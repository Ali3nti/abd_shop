
class DiscountModel{
  int id = 0;
  String name = "" ;
  String img = "" ;
  String info = "" ;
  int price = 0 ;
  int discount
  = 0 ;


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