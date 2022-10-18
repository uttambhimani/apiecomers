import 'dart:convert';
import 'package:apiecomers/ecomers.dart';
import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;


class HomeProvider extends ChangeNotifier{

  String apilink ="https://fakestoreapi.com/products";

  Ecomers? AlldataList;

  //api calling=>http

  Future<List> apicalling()async{

    var jasonString = await http.get(Uri.parse(apilink));
    var json = jsonDecode(jasonString.body);

    return json.map((e)=>Ecomers.fromJson(e)).toList();

  }

}