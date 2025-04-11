
class SliderModel{
  int id = 0;
  String name = "" ;
  String image = "" ;



  SliderModel();

  SliderModel.fromJSON(Map<String, dynamic> json) {
    id = json["id"];
    name = json["name"];
    image = json["image"];

  }

}
