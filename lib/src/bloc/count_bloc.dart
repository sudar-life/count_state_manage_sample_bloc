import 'package:bloc/bloc.dart';
import 'package:equatable/equatable.dart';
import 'package:rxdart/rxdart.dart';

EventTransformer<T> debounceTime<T>(Duration duration) {
  return (events, mapper) => events.debounceTime(duration).flatMap(mapper);
}

class CountBloc extends Bloc<CountEvent, int> {
  CountBloc() : super(0) {
    on<AddCountEvent>((event, emit) {
      emit(state + 1);
    });
    on<SubstracCountEvent>(
      (event, emit) {
        emit(state - 1);
      },
      transformer: debounceTime(
        const Duration(milliseconds: 1000),
      ),
    );
  }
}

abstract class CountEvent extends Equatable {}

class AddCountEvent extends CountEvent {
  @override
  List<Object?> get props => [];
}

class SubstracCountEvent extends CountEvent {
  @override
  List<Object?> get props => [];
}
