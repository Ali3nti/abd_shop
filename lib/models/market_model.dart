// create class and set name with UpperCamelCase
class Market {
  // Properties
  int id = 0;
  String category = '';
  double rate = 0;
  String name = "";
  String address = "";
  String img = "";

  // Constructor
  Market();

  // Methods
  //This methods for give json object and create class and set value
  Market.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    address = json["address"];
    img = (json["logo"] != null) ? json["logo"] : "images/market/0.png";
    category = setCategory(json["category"]);
    rate = json["rate"];
  }

  String setCategory(category) {
    String cat = 'متفرقه';
    if (category == 1) {
      cat = 'سوپرمارکت';
    } else if (category == 2) {
      cat = 'پروتئینی';
    } else if (category == 3) {
      cat = 'میوه و سبزیجات';
    }
    return cat;
  }
}

/*
{
"id": 1,
"name": "جت مارکت",
"address": "ونک",
"logo": "images/logo/market/1.jpg",
"category": 1,
"rate": 4.4
},
 */
