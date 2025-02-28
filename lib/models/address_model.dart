class Address {
  int id = 0;
  String postalCode = '';
  String address = '';

  Address();

  Address.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    address = json['address'] ?? '';
    postalCode = json['postal_code'] ?? '';
  }
}
