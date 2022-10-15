import 'package:shopping_tranning/models/loginandrigestermodel.dart';

abstract class RigesterStates{}

class intialRigesterState extends RigesterStates{}

class RigesterLoadingState extends RigesterStates{}
class RigesterSuccessStateState extends RigesterStates{
  LoginAndRigesterModel loginAndRigesterModel;
  RigesterSuccessStateState(this.loginAndRigesterModel);
}
class RigesterErrorStateState extends RigesterStates{}


class ChangeIconPasswordState extends RigesterStates{}

