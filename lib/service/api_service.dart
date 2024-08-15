import 'dart:convert';
import 'dart:developer';
import 'package:apicalling/model/user.dart';
import 'package:http/http.dart' as http;
import 'package:flutter/material.dart';

String apiurl = "https://reqres.in/api/users?page=1";

class Apicall extends ChangeNotifier {
  Welcome? _welcomeData;
  Welcome? get welcomeData => _welcomeData;

  get user => null;

  Future<void> getuser() async {
    var response = await http.get(Uri.parse(apiurl));
    if (response.statusCode == 200) {
      _welcomeData = Welcome.fromRawJson(response.body);
      notifyListeners();
      log("success");
    } else {
     log('Error occure');
    }
  }
}

class Appsercice extends ChangeNotifier{
  bool _ifdark = false ;
  bool get ifdark => _ifdark;

  void changetheme (){
    _ifdark = !_ifdark;
    notifyListeners();
  }
}

