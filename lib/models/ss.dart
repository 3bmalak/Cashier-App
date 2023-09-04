class SSS {
  dynamic date;
  dynamic money;
  dynamic totalCost;
  dynamic paid;
  dynamic orderID;
  dynamic ClientPhoneNumber;
  dynamic ClientName;

  SSS({required this.date,required this.totalCost, required this.money, required this.paid,required this.orderID});


  SSS.fromJson(var json)
  {
    date= json['date'];
    money= json['money'];
    totalCost= json['totalCost'];
    paid= json['paid'];
    orderID= json['orderID'];
  }

  Map<String, dynamic> toMap()
  {
    return {
      'totalCost' : totalCost,
      'date' : date,
      'money' : money,
      'orderID' : orderID,
      'paid' : paid,

    };
  }
}