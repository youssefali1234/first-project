import 'package:shopping_tranning/models/loginandrigestermodel.dart';

abstract class LoginStates{}

class intialLoginState extends LoginStates{}


class LoginSuccessState extends LoginStates{
final  LoginAndRigesterModel loginAndRigesterModel;

  LoginSuccessState(this.loginAndRigesterModel);
}
class LoginLoadingState extends LoginStates{}
class LoginErrorState extends LoginStates{}


class ChangeIconState extends LoginStates{}