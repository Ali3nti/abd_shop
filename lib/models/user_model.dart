import 'package:abd_shop/models/gender_model.dart';

import 'address_model.dart';
import 'city_model.dart';

class User {
  int id = 0; // Unique identifier for the user
  String firstName = ''; // User's first name
  String lastName = ''; // User's last name
  String phoneNumber = ''; // User's phone number
  String nationalId = ''; // User's phone number
  List<Address> addressList = []; // Primary address line
  int otp = 0; // Random number generated for authentication user
  City city = City(); // City of residence
  String state = ''; // State of residence
  String email = ''; // User's email address (unique)
  Gender gender = Gender(); // User's gender (e.g., Male, Female, Other)
  String avatar = ''; // URL to the user's profile picture
  int rate = 0; // User's rate (e.g.,)'
  int isActive = 0; // Status of the user account (active/inactive)
  int isVerified = 0; // Status of phone number verification
  DateTime birthDate = DateTime.now(); // User's date of birth
  DateTime lastLogin = DateTime.now(); // Timestamp of the last login
  DateTime createdAt = DateTime.now(); // Timestamp of when the user was created
  DateTime updatedAt = DateTime.now(); // Timestamp of the last update
  int loginAttempts = 0;

  User(); // Number of failed login attempts// Preferred method of contact (e.g., Email, SMS)

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    phoneNumber = json['phone'] ?? '';
    nationalId = json['national_id'] ?? '';
    addressList = json['address']
            ?.map((addressMap) => Address.fromJson(addressMap))
            ?.toList() ??
        [];
    otp = json['otp'] ?? '';
    city = City.fromJson(json['city']);
    state = json['state'] ?? '';
    email = json['email'] ?? '';
    gender = Gender.fromJson(json['gender']);
    avatar = json['avatar'] ?? '';
    rate = json['rate'] ?? 0;
    isActive = json['is_active'] ?? true;
    isVerified = json['is_verified'] ?? false;
    birthDate = DateTime.parse(json['birth_date'] ?? DateTime.now().toString());
    createdAt = DateTime.parse(json['created_at'] ?? DateTime.now().toString());
    updatedAt = DateTime.parse(json['updated_at'] ?? DateTime.now().toString());
    lastLogin = DateTime.parse(json['last_login'] ?? DateTime.now().toString());
    loginAttempts = json['login_attempts'] ?? 0;
  }
}
