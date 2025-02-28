class CategoryModel {
  int id = 0;
  String name = "";
  String image = "";

  CategoryModel();

  CategoryModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = (json["image"] != null) ? json["image"] : "images/market/0.png";
  }
}
