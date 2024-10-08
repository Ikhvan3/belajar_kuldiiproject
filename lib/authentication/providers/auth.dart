import 'dart:async';
import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:shared_preferences/shared_preferences.dart';

class Authen with ChangeNotifier {
  Timer? _authTimer;
  String? _idToken, userId;
  DateTime? _expiryDate;

  String? _tempidToken, tempuserId;
  DateTime? _tempexpiryDate;

  //untuk menyimpan data diaplikasi
  Future<void> tempData() async {
    _idToken = _tempidToken;
    userId = tempuserId;
    _expiryDate = _tempexpiryDate;

    //untuk menyimpan data ke local storage
    final sharedPref = await SharedPreferences.getInstance();
    final myMapSPref = json.encode({
      'token': _tempidToken,
      'uid': tempuserId,
      'expired': _tempexpiryDate?.toIso8601String(),
    });

    sharedPref.setString('authData', myMapSPref);

    _autologout();
    notifyListeners();
  }

  //jika isAuthe ada tokennya akan masuk ke homepage
  bool get isAuthe {
    return token != null;
  }

  //untuk mendapatkan token pada setiap login
  String? get token {
    if (_idToken != null &&
        _expiryDate != null &&
        _expiryDate!.isAfter(DateTime.now())) {
      return _idToken;
    } else {
      return null;
    }
  }

  Future<void> signup(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signUp?key=AIzaSyAOVclex9K9CeHwbyqJhqSDeURZHToR42Q");

    try {
      var response = await http.post(
        url,
        body: json.encode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      var responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _tempidToken = responseData["idToken"];
      tempuserId = responseData["localId"];
      _tempexpiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );
    } catch (error) {
      throw error;
    }
  }

  Future<void> login(String email, String password) async {
    Uri url = Uri.parse(
        "https://identitytoolkit.googleapis.com/v1/accounts:signInWithPassword?key=AIzaSyAOVclex9K9CeHwbyqJhqSDeURZHToR42Q");
    try {
      var response = await http.post(
        url,
        body: json.encode(
          {
            "email": email,
            "password": password,
            "returnSecureToken": true,
          },
        ),
      );
      var responseData = json.decode(response.body);
      if (responseData['error'] != null) {
        throw responseData['error']['message'];
      }

      _tempidToken = responseData["idToken"];
      tempuserId = responseData["localId"];
      _tempexpiryDate = DateTime.now().add(
        Duration(
          seconds: int.parse(responseData["expiresIn"]),
        ),
      );
    } catch (error) {
      print(error);
      throw error;
    }
  }

  Future<void> logout() async {
    //membuat semua data = null agar kembali ke loginpage,kembalian dari get token
    _idToken = null;
    userId = null;
    _expiryDate = null;
    if (_authTimer != null) {
      _authTimer!.cancel();
      _authTimer = null;
    }

    //untuk clear sharedpreferennya dari local storage
    final pref = await SharedPreferences.getInstance();
    pref.clear();
    notifyListeners();
  }

  void _autologout() {
    if (_authTimer != null) {
      _authTimer!.cancel();
    }
    final timeToExpiry = _tempexpiryDate!.difference(DateTime.now()).inSeconds;
    print(timeToExpiry);
    _authTimer = Timer(Duration(seconds: timeToExpiry), logout);
  }

  Future<bool?> autoLogin() async {
    final pref = await SharedPreferences.getInstance();

    //jika tidak ada data pada authData akan mereturn false dan masuk ke login
    if (!pref.containsKey('authData')) {
      return false;
    }
    //jika ada data akan meterurn true dan masuk ke homepage
    final myData =
        json.decode(pref.get('authData').toString()) as Map<String, dynamic>;

    final myExpiryDate = DateTime.parse(myData["expired"]);

    //jika waktu expiry kadaluarsa akan mereturn false dan kembali ke login
    if (myExpiryDate.isBefore(DateTime.now())) {
      return false;
    }

    //jika waktu tidak expiry akan mereturn true dan masuk ke homepage
    _idToken = myData["token"];

    userId = myData["uid"];

    _expiryDate = myExpiryDate;

    notifyListeners();
    return true;
  }
}
