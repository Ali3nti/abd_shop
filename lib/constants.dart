import 'package:flutter/material.dart';

////////////// URL //////////////////
// const baseUrl = "http://192.168.1.100/abd_shop/";
const baseUrl = "https://mehdidehghani.ir/";
/////////////// COLORS //////////////////////
const Color kPrimaryColor = Color(0xFFff6200);
const Color kPrimaryTextColor = Color(0xFF1E1E1E);
const Color kHintTextColor = Color(0xFF7e7e7e);

///////////////Colors used in project/////////////////////
const Color kWhiteColor = Color(0xFFFFFFFF);
const Color kBackgroundColor = Color(0xFFF8FAFB);
const Color kLightBackgroundColor = Color(0xFFEEEEEE);
const Color kDarkBackgroundColor = Color(0xFFDDDDDD);
const Color kBoxBackgroundColor = Color(0xFFA0A0A0);
const Color kTextHintColor = Color(0xFF555555);
const Color kTextPrimaryColor = Color(0xFF222222);
const Color kTextDarkColor = Color(0xFF263238);
const Color kAccentColor = Color(0xFF405AA9);
const Color kErrorColor = Color(0xD2911C1C);

const Color kRedColor = Color(0xFFFF6663);
const Color kBlueColor = Color(0xFF1fa8a7);
const Color kGreenColor = Color(0xff76AE70);
const Color kYellowColor = Color(0xffd7bc45);
const Color kOrangeColor = Color(0xFFf29842);

//////////////////////////////
//////////Size////////////////
//////////////////////////////

const kFieldSizeWith = 125.0;
const kFieldSizeHeight = 30.0;

const kBoxSizeWith = 135.0;
const kBoxSizeHeight = 30.0;

//////////////////////////////

/////////////// STYLES //////////////////////
//////////////////////////////
//////////Text Style//////////
//////////////////////////////

const kMainTextStyle = TextStyle(
    color: kTextPrimaryColor,
    fontFamily: 'Yekan',
    fontSize: 16.0,
    fontWeight: FontWeight.w700);
const kMainTextStyleOrange = TextStyle(
    color: Colors.deepOrange,
    fontFamily: 'Yekan',
    fontSize: 15.0,
    fontWeight: FontWeight.w700);

///////////Text Style/////////

const kTextWhite = TextStyle(color: kWhiteColor);

const kHeader7 = TextStyle(
    color: Colors.black,
    fontSize: 16,
    fontWeight: FontWeight.w500,
    fontFamily: 'Poppins-Regular');

const inputFieldTextStyleDispenser = TextStyle(
  fontFamily: 'Yekan',
  fontWeight: FontWeight.w100,
  color: kTextPrimaryColor,
);

const inputFieldHintTextStyleDispenser = TextStyle(
  fontFamily: 'Yekan',
  fontSize: 14,
  color: kTextHintColor,
);

///////////////////////////////////
/// BOX DECORATION STYLES
//////////////////////////////////

const dispenserPlateDecoration = BoxDecoration(
  color: kLightBackgroundColor,
  boxShadow: [
    BoxShadow(
        color: Color.fromRGBO(0, 0, 0, .1),
        blurRadius: 10,
        spreadRadius: 5,
        offset: Offset(0, 1))
  ],
  borderRadius: BorderRadiusDirectional.all(
    Radius.circular(8),
  ),
);

const dispensersPlateDecoration = BoxDecoration(
  color: Color(0xFFBBBBBB),
  boxShadow: [
    BoxShadow(
        color: Color.fromRGBO(0, 0, 0, .1),
        blurRadius: 10,
        spreadRadius: 5,
        offset: Offset(0, 1))
  ],
  borderRadius: BorderRadiusDirectional.all(
    Radius.circular(8),
  ),
);

/////////////////////////////////////
/// INPUT FIELD DECORATION STYLES
////////////////////////////////////

const inputFieldFocusedBorderStyle = OutlineInputBorder(
  borderRadius: BorderRadius.all(
    Radius.circular(6),
  ),
  borderSide: BorderSide(
    color: kPrimaryColor,
  ),
);

const inputFieldDefaultBorderStyle = OutlineInputBorder(
  gapPadding: 0,
  borderRadius: BorderRadius.all(
    Radius.circular(8),
  ),
  borderSide: BorderSide(color: kPrimaryColor),
);

const TextStyle kTextStyle = TextStyle(
  fontSize: 12,
  color: kPrimaryTextColor,
);
const TextStyle kHeaderTextStyle = TextStyle(
  fontSize: 16,
  color: kPrimaryTextColor,
  fontWeight: FontWeight.bold,
);
const TextStyle kHeaderTextStyle2 = TextStyle(
  fontSize: 12,
  color: kPrimaryTextColor,
  fontWeight: FontWeight.normal,
);
const TextStyle kHeaderTextStyle3 = TextStyle(
  fontSize: 18,
  color: Colors.white,
  fontWeight: FontWeight.bold,
);

const TextStyle kHintTextStyle = TextStyle(
  fontSize: 12,
  color: kHintTextColor,
  fontWeight: FontWeight.bold,
);
const TextStyle kPrimaryTextStyle = TextStyle(
  fontSize: 12,
  color: kPrimaryTextColor,
  fontWeight: FontWeight.bold,
);
const TextStyle kPrimaryTextStyle2 = TextStyle(
  fontSize: 12,
  color: kPrimaryTextColor,
  fontWeight: FontWeight.normal,
);
