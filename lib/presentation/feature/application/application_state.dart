import 'package:equatable/equatable.dart';

class ApplicationState extends Equatable {
  const ApplicationState();

  factory ApplicationState.getDefault(){
    return const ApplicationState();
  }

  @override
  List<Object?> get props => <Object?>[];
}
