import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
void main(){ runApp(
 
  const MyApp());
 getdata() ;
}
String APIURL = 'https://jsonplaceholder.typicode.com/posts';
class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Material App',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('Material App Bar'),
        ),
        body: const Center(
          child: Text('Hello World'),
        ),
      ),
    );
  }
}


Future<void> getdata() async{
var dataresponse = await http.get(Uri.parse(APIURL));
log(dataresponse.body);

}