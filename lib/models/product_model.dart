class Product {
  int id = 0;
  int weight = 0;
  int price = 0;
  int discount = 0;
  int exp = 0;
  double rate = 0;
  String logo = "";
  String category = '';
  String name = "";
  String address = "";
  String mark = "";
  String model = "";
  String color = "";
  String comments = "";
  String keep = "";
  String transportation = "";

  Product();

  Product.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    weight = json["weight"];
    price = json["price"];
    discount = json["discount"];
    exp = json["exp"];
    rate = json["rate"];
    logo = json["logo"];
    category = json["category"];
    name = json["name"];
    address = json["address"];
    mark = json["mark"];
    model = json["model"];
    color = json["color"];
    comments = json["comments"];
    keep = json["keep"];
    transportation = json["transportation"];
  }
}
