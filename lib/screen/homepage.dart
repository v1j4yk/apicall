import 'package:apicalling/service/api_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class Homepage extends StatefulWidget {
  const Homepage({super.key});

  @override
  State<Homepage> createState() => _HomepageState();
}

class _HomepageState extends State<Homepage> {
  @override
  void initState() {
    // TODO: implement initState
    super.initState();
    Provider.of<Apicall>(context,listen: false).getuser();
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('API'),
        centerTitle: true,
        actions: [
          IconButton(onPressed: (){
            Provider.of<Appsercice>(context,listen: false).changetheme();
          },
          icon:Icon(Provider.of<Appsercice>(context,listen: true).ifdark ? Icons.dark_mode : Icons.light_mode),
          )
        ],
      ),
      body:  SizedBox(
        height: MediaQuery.of(context).size.height,
        width: MediaQuery.of(context).size.width,
        child:Column(
          children: [ 
            Consumer<Apicall>(
              builder: (context,datavalue, child) {
                return datavalue.welcomeData == null
                    ? const CircularProgressIndicator()
                    : ListView.builder(
                  shrinkWrap: true,
                  itemCount: datavalue.welcomeData!.data.length,
                  itemBuilder: (context, index) {
                    return ListTile(
                      leading: CircleAvatar(
                        backgroundImage: NetworkImage(datavalue.welcomeData!.data[index].avatar),
                      ),
                      title: Text(datavalue.welcomeData!.data[index].firstName + " " + datavalue.welcomeData!.data[index].lastName),
                      subtitle: Text(datavalue.welcomeData!.data[index].email),
                    );
                  },
                );
              },
            ),
          ],
        )
      )
    );
  }
}