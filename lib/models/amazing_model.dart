
class AmazingModel{
  int id = 0;
  String name = "" ;
  String img = "" ;
  String info = "" ;
  String cast = "" ;
  String discount = "" ;


  AmazingModel();

  AmazingModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    info = json["info"];
    cast = json["cast"];
    discount = json["discount"];
    img = (json["logo"] != null) ? json["logo"] : "images/market/0.png";
  }

}