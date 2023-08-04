class DataModel {
  int price;
  DataModel.fromJson(Map<String, dynamic> json)
      : price = json['bitcoin']['usd'];
  //a method that convert object to json
  Map<String, dynamic> toJson() => {
        'usd': price,
      };
}
