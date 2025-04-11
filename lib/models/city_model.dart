class City {
  int id = 0; // Unique identifier for the city
  String code = 'province_id/city_id'; // Code format: province_id/city_id (e.g., 1/17)
  String cityName = ''; // Name of the city
  String provinceName = ''; // Name of the province
  String street = ''; // Name of the street
  String alley = ''; // Name of the alley

  // Default constructor
  City();

  // Constructor to create a City object from a JSON object
  City.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0; // Assign city ID from JSON
    code = json["code"] ?? '0/0'; // Assign code from JSON
    cityName = json["city"] ?? ''; // Assign city name from JSON
    provinceName = json["province"] ?? ''; // Assign province name from JSON
    street = json["street"] ?? ''; // Assign street name from JSON
    alley = json["alley"] ?? ''; // Assign alley name from JSON
  }
}
