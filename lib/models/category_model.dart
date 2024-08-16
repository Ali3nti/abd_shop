
class CategoryModel{
  int id = 0;
  String name = "" ;
  String img = "" ;

  CategoryModel();

  CategoryModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    img = (json["logo"] != null) ? json["logo"] : "images/market/0.png";
  }

}