class City {
  int id = 0;
  String code = 'province_id/city_id'; // Like 1/17
  String cityName = ''; // Province of residence
  String provinceName = ''; // Province of residence

  City();

  City.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    code = json["code"] ?? '0/0';
    cityName = json["city"] ?? '';
    provinceName = json["province"] ?? '';
  }
}
