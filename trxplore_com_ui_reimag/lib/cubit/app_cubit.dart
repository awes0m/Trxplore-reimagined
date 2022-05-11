import 'package:bloc/bloc.dart';
import 'package:trxplore_com_ui_reimag/cubit/app_cubit_states.dart';

class AppCubit extends Cubit<CubitStates> {
  //Initial state is Initiated at start
  AppCubit(initialState) : super(InitialCubitState()) {
    //once completed emit the Welcomestate
    emit(WelcomeCubitState());
  }
}
