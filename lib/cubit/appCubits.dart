import 'package:bloc/bloc.dart';
import 'package:flutter_cubit/cubit/app_states.dart';

class AppCubits extends Cubit<CubitStates>{
  AppCubits(initialState) : super(InitialState()){
    emit(WelcomeState());
  }

  void getData(){
    try {
      emit(LoadingState());
    }catch(e){

    }
  }
}