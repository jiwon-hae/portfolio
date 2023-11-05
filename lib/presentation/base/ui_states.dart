import 'package:equatable/equatable.dart';

abstract class UiState extends Equatable {
  const UiState();

  @override
  List<Object?> get props => <Object?>[];
}

class Success<T> extends UiState {
  const Success({required this.data});

  final T data;

  @override
  List<Object?> get props => <Object?>[data];
}

class Loading<T> extends UiState {
  const Loading({this.previousData});
  final T? previousData;

  @override
  List<Object?> get props => <Object?>[previousData];
}

class Fail extends UiState {}

class Error extends UiState {
  const Error({required this.error});
  final Error error;

  @override
  List<Object?> get props => <Object?>[error];
}