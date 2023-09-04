class UserDataModel {
  dynamic name;
  dynamic Uid;
  dynamic phoneNumber;
  dynamic email;

  UserDataModel({required this.name, required this.Uid, required this.email});


  UserDataModel.fromJson(var json)
  {
    name= json['name'];
    Uid= json['Uid'];
    phoneNumber= json['phoneNumber'];
    email= json['email'];

  }

}