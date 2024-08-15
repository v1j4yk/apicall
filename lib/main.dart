import 'package:apicalling/apicalling_type2.dart';
import 'package:apicalling/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:apicalling/screen/homepage.dart';
import 'package:provider/provider.dart';
void main(){
   runApp(ListenableProvider(
    create: (context) => Appsercice(), 
    child: const MyApp()
    ));  
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return ListenableProvider(create: (context) => Apicall(), 
    child: MaterialApp(
      title: 'API Calling',
      debugShowCheckedModeBanner: false,
      theme: Provider.of<Appsercice>(context,listen: true).ifdark ? ThemeData.dark() : ThemeData.light(),
      home: const Homepage(),
    ));
  }
}