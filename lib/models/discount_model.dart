
class DiscountModel{
  int id = 0;
  String name = "" ;
  String img = "" ;
  String info = "" ;
  String price = "" ;
  String discount = "" ;


  DiscountModel();

  DiscountModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    info = json["info"];
    price = json["price"];
    discount = json["discount"];
    img = (json["logo"] != null) ? json["logo"] : "images/market/0.png";
  }

}