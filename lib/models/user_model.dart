import 'package:abd_shop/models/gender_model.dart';

import 'address_model.dart';
import 'city_model.dart';

class User {
  int id = 0; // Unique identifier for the user
  String firstName = ''; // User's first name
  String lastName = ''; // User's last name
  String phoneNumber = ''; // User's phone number
  int nationalId = 0; // User's phone number //TODO: int
  int addressList = 0; // Primary address line //TODO: int
  int otp = 0; // Random number generated for authentication user
  int city = 0; // City of residence //TODO: int
  int state = 0; // State of residence //TODO: int
  String email = ''; // User's email address (unique)
  int gender = 0; // User's gender (e.g., Male, Female, Other) //TODO: int
  String avatar = ''; // URL to the user's profile picture
  int rate = 0; // User's rate (e.g.,)'
  int isActive = 0; // Status of the user account (active/inactive)
  int isVerified = 0; // Status of phone number verification
  String birthDate = 'DateTime.now()'; // User's date of birth //TODO: String
  String lastLogin = 'DateTime.now()'; // Timestamp of the last login //TODO: String
  String createdAt = 'DateTime.now()'; // Timestamp of when the user was created//TODO: String
  String updatedAt = 'DateTime.now()'; // Timestamp of the last update //TODO: String
  int loginAttempts = 0;

  User(); // Number of failed login attempts// Preferred method of contact (e.g., Email, SMS)

  User.fromJson(Map<String, dynamic> json) {
    id = json['id'] ?? 0;
    firstName = json['first_name'] ?? '';
    lastName = json['last_name'] ?? '';
    phoneNumber = json['phone'] ?? '';
    nationalId = json['national_id'] ?? '';
    addressList = json['address_id'];
            // ?.map((addressMap) => Address.fromJson(addressMap))
            // ?.toList() ??
        // [];
    otp = json['otp'] ?? '';
    city = json['city_id'];
    state = json['state_id'] ?? '';
    email = json['email'] ?? '';
    gender = json['gender'];
    avatar = json['avatar'] ?? '';
    rate = json['rate'] ?? 0;
    isActive = json['is_active'] ;
    isVerified = json['is_verified'] ;
    birthDate = json['birth_date'] ;
    createdAt = json['created_at'] ;
    updatedAt = json['updated_at'] ;
    lastLogin = json['login_at'] ;
    // loginAttempts = json['login_attempts'] ?? 0;
  }
}
