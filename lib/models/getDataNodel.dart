class GetDataModel {
  dynamic code;
  dynamic notes;
  dynamic itemWeight;
  dynamic weightUnit;
  dynamic category;
  dynamic price;
  dynamic discountPrice;
  dynamic itemName;
  dynamic quantity;
  dynamic boughtPrice;
  bool isChecked=false;


  GetDataModel(
      this.code,
      this.notes,
      this.itemWeight,
      this.weightUnit,
      this.category,
      this.price,
      this.discountPrice,
      this.itemName,
      this.quantity,
      this.boughtPrice
      );

  GetDataModel.fromJson(var json)
  {
    code= json['code'];
    notes= json['notes'];
    itemWeight= json['itemWeight'];
    category= json['category'];
    weightUnit= json['weightUnit'];
    price= json['price'];
    discountPrice= json['discountPrice'];
    itemName= json['itemName'];
    boughtPrice= json['boughtPrice'];
    quantity= json['quantity'];

  }


  Map<String, dynamic> toMap()
  {
    return {
      'code':code,
      'notes' : notes,
      'itemWeight' : itemWeight,
      'category' : category,
      'weightUnit' : weightUnit,
      'price' : price,
      'boughtPrice' : boughtPrice,
      'discountPrice' : discountPrice,
      'itemName' : itemName,
      'quantity' : quantity,
    };
  }
}