import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:injectable/injectable.dart';
import 'package:portfolio/presentation/feature/home/home_state.dart';

abstract class HomeCubit extends Cubit<HomeState>{
  HomeCubit() : super(HomeState.getDefault());

}

@Injectable(as : HomeCubit)
class HomeCubitImpl extends HomeCubit {

}