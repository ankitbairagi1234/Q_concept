import 'package:flutter/material.dart';
import 'package:flutter_secure_storage/flutter_secure_storage.dart';
import 'package:intl/intl.dart';

final storage = FlutterSecureStorage();
var authToken;
Color spcl = Color(0xff655586);
var selectedCurrency;
var selectedCurrencyRate;
var langCode;

String currencySymbol(String currencyName) {
  NumberFormat format =
      NumberFormat.simpleCurrency(name: currencyName.toUpperCase());
  return "${format.currencySymbol}";
}
