import 'dart:convert';

import 'package:final_practice/screen/home/model/home_model.dart';
import 'package:flutter/services.dart';

class JsonHelper
{
  static JsonHelper helper = JsonHelper._();
  JsonHelper._();

  Future<Product> getData() async {
    String jsonString = await rootBundle.loadString("assets/json/planet.json");
    var json = jsonDecode(jsonString);
    Product p1= Product.mapToModel(json);
    return p1;
  }
}