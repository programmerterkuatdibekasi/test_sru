import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';

class AppTextStyle {
  AppTextStyle._();
  static FontWeight light = FontWeight.w300;
  static FontWeight regular = FontWeight.w400;
  static FontWeight medium = FontWeight.w500;
  static FontWeight semiBold = FontWeight.w600;
  static FontWeight bold = FontWeight.w700;
  static FontWeight extraBold = FontWeight.w800;
  static FontWeight black = FontWeight.w900;

  static final String? _nunitoSans = GoogleFonts.roboto().fontFamily;

  static TextStyle h1 = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 20,
    fontWeight: bold,
    height: 1.2,
    fontFamily: _nunitoSans,
  );
  static TextStyle h2 = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 18,
    fontWeight: bold,
    height: 1.2,
    fontFamily: _nunitoSans,
  );
  static TextStyle h3 = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 16,
    fontWeight: bold,
    height: 1.2,
    fontFamily: _nunitoSans,
  );
  static TextStyle h4 = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 14,
    fontWeight: medium,
    height: 1.2,
    fontFamily: _nunitoSans,
  );

  static TextStyle regularStyle = TextStyle(
    decoration: TextDecoration.none,
    color: Colors.black,
    fontSize: 12,
    fontWeight: regular,
    height: 1.2,
    fontFamily: _nunitoSans,
  );
}

class AppColorStyle {
  AppColorStyle._();

  static const Color backgroundColor = Color(0xFFF5F5F5);
  static const Color black = Color(0xff403F3F);
  static const Color grey = Color(0xFF909090);
  static const Color lightGrey = Color(0xFFEEEEEE);
}