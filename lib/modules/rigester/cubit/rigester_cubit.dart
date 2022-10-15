import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:shopping_tranning/models/loginandrigestermodel.dart';
import 'package:shopping_tranning/modules/rigester/cubit/rigester_states.dart';
import 'package:shopping_tranning/shared/network/remote/dio.dart';
import 'package:shopping_tranning/shared/network/remote/end_points.dart';

class RigesterCubit extends Cubit<RigesterStates>
{
  RigesterCubit():super(intialRigesterState());

 static RigesterCubit get(context)=>BlocProvider.of(context);

late LoginAndRigesterModel rigester;
 void Rigester({
required String name,
required String phone,
required String email,
required String password,
required String fire,
})
 {
   print('hello');
   emit(RigesterLoadingState());
   DioHelper.postdata(
       url: SignUp,
       data: {
         'name':name,
         'phone':phone,
         'email':email,
         'fire':fire,
         'password':password,
       }
   ).then((value) {
     print(value.data);
     rigester=LoginAndRigesterModel.fromJson(value.data);
     emit(RigesterSuccessStateState(rigester));
   }).catchError((error){
     print('error  ${error.toString()}');
     emit(RigesterErrorStateState());
   });
 }

  IconData suffix= Icons.visibility_outlined;
  bool ispassword=false;
  void changeIconPassword()
  {
    ispassword=!ispassword;
    suffix=ispassword?Icons.visibility_off_outlined:Icons.visibility_outlined;
    emit(ChangeIconPasswordState());
  }
 }
