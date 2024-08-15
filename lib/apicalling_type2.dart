import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;
void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({Key? key}) : super(key: key);




  @override
  State<MyHomePage> createState() => _MyHomePageState();
}
class _MyHomePageState extends State<MyHomePage> {
List data = [];
Future<void> fetchData() async {
  final response = await http.get(Uri.parse('https://reqres.in/api/users?page=1'));
  if (response.statusCode == 200) {
    final fetchData = jsonDecode(response.body)['data'];
    setState(() {
      data = fetchData;
    });
    print(data);
  } else {
    throw Exception('Failed to load data');
  }
  // print("success");
  
}

@override
  void initState() {
    super.initState();
    fetchData();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Flutter Demo'),
      ),
      body: ListView.builder(itemCount: data.length, itemBuilder: (context, index) {
        return ListTile(
          title: Text(data[index]['first_name' ] + " " + data[index]['last_name']),
          subtitle: Text(data[index]['email']),
          leading: CircleAvatar(
            backgroundImage: NetworkImage(data[index]['avatar']),
          ),
        );
      },)
     
    );
  }
}