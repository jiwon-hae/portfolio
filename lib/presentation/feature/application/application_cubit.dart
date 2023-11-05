import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/presentation/feature/application/application_state.dart';

abstract class ApplicationCubit extends Cubit<ApplicationState>{
  ApplicationCubit() : super(ApplicationState.getDefault());

}

@Injectable(as : ApplicationCubit)
class ApplicationCubitImpl extends ApplicationCubit {

}