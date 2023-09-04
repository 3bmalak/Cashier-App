class TableViewModel {
  dynamic code;
  dynamic itemWeight;
  dynamic weightUnit;
  dynamic category;
  dynamic price;
  dynamic discountPrice;
  dynamic itemName;
  dynamic quantity;
  dynamic boughtPrice;
  dynamic notes;
  bool isChecked=false;


  TableViewModel(
      this.code,
      this.itemWeight,
      this.weightUnit,
      this.category,
      this.price,
      this.discountPrice,
      this.itemName,
      this.quantity,
      this.isChecked,
      this.boughtPrice,
      this.notes
      );

  TableViewModel.fromJson(var json)
  {
    code= json['code'];
    boughtPrice= json['boughtPrice'];
    itemWeight= json['itemWeight'];
    category= json['category'];
    weightUnit= json['weightUnit'];
    price= json['price'];
    discountPrice= json['discountPrice'];
    itemName= json['itemName'];
    quantity= json['quantity'];
    notes= json['notes'];

  }
  Map<String, dynamic> toMap()
  {
    return {
      'code':code,
      'itemWeight' : itemWeight,
      'category' : category,
      'weightUnit' : weightUnit,
      'price' : price,
      'discountPrice' : discountPrice,
      'itemName' : itemName,
      'notes' : notes,
      'quantity' : quantity,
    };
  }
}