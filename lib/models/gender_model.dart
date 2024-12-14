class Gender {
  int id = 0;
  String gender = "";

  Gender();

  Gender.fromJson(Map<String, dynamic> json) {
    id = json["id"] ?? 0;
    gender = json["gender"] ?? '';
  }
}
