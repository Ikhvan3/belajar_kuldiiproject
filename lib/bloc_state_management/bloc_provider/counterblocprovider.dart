import 'package:flutter_bloc/flutter_bloc.dart';

// Definisikan event untuk Increment dan Decrement
abstract class CounterEvent {}

class IncrementEvent extends CounterEvent {}

class DecrementEvent extends CounterEvent {}

class CounterBlocc extends Bloc<CounterEvent, int> {
  CounterBlocc() : super(10) {
    // Daftarkan event handler
    on<IncrementEvent>((event, emit) {
      emit(state + 1); // Tambahkan counter
    });

    on<DecrementEvent>((event, emit) {
      emit(state - 1); // Kurangi counter
    });
  }
}
