import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';
// import 'dart:io';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue, // MyHomePage
      ),
       home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('API'),
        centerTitle: true,
      ),
      body: Center(
        child: FutureBuilder(
          future: http.get(Uri.parse('https://reqres.in/api/users?page=2')),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.done) {
              final List data = json.decode(snapshot.data!.body)['data'];
              return ListView.builder(
                itemCount: data.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    title: Text(data[index]['email']),
                    subtitle: Text(data[index]['first_name'] + ' ' + data[index]['last_name']),
                    leading: CircleAvatar(
                      backgroundImage: NetworkImage(data[index]['avatar']),
                    ),
                  );
                },
              );
            } else {
              return CircularProgressIndicator();
            }
          },
        ),
      ),
    );
  }
}

