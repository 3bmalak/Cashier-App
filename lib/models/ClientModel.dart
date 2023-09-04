class ClientModel {
  dynamic name;
  dynamic convicted;
  dynamic phoneNumber;
  dynamic email;
  dynamic offer;

  ClientModel({required this.name,required this.offer,required this.phoneNumber, required this.convicted, required this.email});


  ClientModel.fromJson(var json)
  {
    name= json['name'];
    convicted= json['convicted'];
    phoneNumber= json['phoneNumber'];
    offer= json['offer'];
    email= json['email'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'offer':offer,
      'phoneNumber' : phoneNumber,
      'name' : name,
      'convicted' : convicted,
      'email' : email,

    };
  }
}