import 'package:equatable/equatable.dart';

abstract class CubitStates extends Equatable{}

//Every Cubit app must have a state that is the initial state of the app.
class InitialCubitState extends CubitStates{
  @override
  //TODO: implement props
  List<Object> get props => [];
}

// once initial state is set, the app can be in any of the following states

//Welcome Screen state
class WelcomeCubitState extends CubitStates{
  @override
  //TODO: implement props
  List<Object> get props => [];
}