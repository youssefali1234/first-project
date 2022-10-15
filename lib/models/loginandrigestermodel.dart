class LoginAndRigesterModel
{
  bool? status;
  String? token;
  User? user;
LoginAndRigesterModel.fromJson(Map<String,dynamic>json)
{
  status=json['status'];
  token=json['token'];
  user=json['user']!=null?User.fromJson(json['user']):null;
}
}
class User
{
  int? id;
  String? name;
  String? phone;
  String? email;
  String? stute;
  String? type;
  String? fire;
  int? num_ads;
  String? email_verified_at;
  String? created_at;
  String? updated_at;
  User.fromJson(Map<String,dynamic>json)
  {
    id=json['id'];
    name=json['name'];
    phone=json['phone'];
    email=json['email'];
    stute=json['stute'];
    type=json['type'];
    fire=json['fire'];
    num_ads=json['num_ads'];
    email_verified_at=json['email_verified_at'];
    created_at=json['created_at'];
    updated_at=json['updated_at'];


  }
}