import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http ;

class Product{

  static List products = [];
  
  static productsGetter()async{
    
    try {
      http.Response res = await http.get(Uri.parse('http://10.0.2.2:8080/api/category/getcategory'));

      var data = jsonDecode(res.body);
      products = data['products'];
      
    } catch (e) {
      debugPrint(e.toString());
    }

    
  }


}