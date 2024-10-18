import 'package:hive_flutter/adapters.dart';

@HiveType(typeId: 0)
class Address {
  @HiveField(0)
  final String street;
  @HiveField(1)
  final String city;
  @HiveField(2)
  final String country;

  Address(this.street, this.city, this.country);
}