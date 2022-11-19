import 'package:flutter/material.dart';
import 'dart:io';
import 'dart:ui';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(primarySwatch: Colors.blue),
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {


  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("Get Device Info in Flutter"),
        ),
        body: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: <Widget>[
              const Center(
                child: Text(
                  'Your Device Information:',
                  style: TextStyle(
                      fontWeight: FontWeight.w700,
                      fontSize: 25,
                      color: Colors.red),
                ),
              ),
              const SizedBox(height: 20),
              Column(children: [
                Align(
                  alignment: Alignment.topLeft,
                  child: Text(
                    'Platform: ${Platform.operatingSystem}\n',
                    style: const TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Version: ${Platform.operatingSystemVersion}\n',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Screen size:  ${window.physicalSize.width} x ${window.physicalSize.height}\n',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
                Align(
                  alignment: Alignment.centerLeft,
                  child: Text(
                    'Network: ${  printIps() }\n',
                     style: TextStyle(fontSize: 20),
                  ),
                )
              ]),
            ],
          ),
        ));
  }

  Future<List> printIps() async {
      List<String> networkInterfaces = [];
        for (var interface in await NetworkInterface.list()) {
          for (var addr in interface.addresses) {
            print("${addr.type.name} ==  ${addr.address}");
            networkInterfaces.add("${addr.type.name} ==  ${addr.address}");
          }
       }
    return networkInterfaces;
  }


}
