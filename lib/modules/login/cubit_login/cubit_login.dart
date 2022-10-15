import 'package:bloc/bloc.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_tranning/models/loginandrigestermodel.dart';
import 'package:shopping_tranning/modules/login/cubit_login/states_login.dart';
import 'package:shopping_tranning/shared/network/remote/dio.dart';
import 'package:shopping_tranning/shared/network/remote/end_points.dart';

class LoginCubit extends Cubit<LoginStates>
{
  LoginCubit():super(intialLoginState());
  static LoginCubit get(context)=>BlocProvider.of(context);
LoginAndRigesterModel? login;
void LoginUser({
  required String email,
  required String pass,
  required String fire,
})
{
  emit(LoginLoadingState());
DioHelper.postdata(
    url: Login,
    data: {
      'email':email,
      'pass':pass,
      'fire':fire
    }
).then((value)
{
  login=LoginAndRigesterModel.fromJson(value.data);
  print(value.data);
  emit(LoginSuccessState(login!));
}).catchError((error)
{
  print(' error is  ${error.toString()}');
  emit(LoginErrorState());
})
;
}

IconData suffix=Icons.visibility_outlined;
bool ispassword=false;
void changeIconAndIsPassword()
{
  ispassword=!ispassword;
  suffix=ispassword?Icons.visibility_off_outlined:Icons.visibility_outlined;
  emit(ChangeIconState());
}


}