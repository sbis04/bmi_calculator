import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'BMI Calculator Module',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  var jData1;
  var color = Colors.purple;

  static const platform = const MethodChannel('com.souvikbiswas.bmi/data');

  _MyHomePageState() {
    platform.setMethodCallHandler(_receiveFromHost);
  }

  Future<void> _receiveFromHost(MethodCall call) async {
    var jData;

    try {
      print(call.method);

      if (call.method == "fromHostToClient") {
        final String data = call.arguments;
        print(call.arguments);
        jData = await jsonDecode(data);
        print(jData['value']);
        print(jData['advice']);
      }
    } on PlatformException catch (error) {
      print(error);
    }

    setState(() {
      jData1 = jData;
      if (jData['color'] == 'blue') {
        color = Colors.blue;
      } else if (jData['color'] == 'green') {
        color = Colors.green;
      } else {
        color = Colors.red;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        color: color,
        child: Center(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: <Widget>[
              Text(
                'YOUR BMI',
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 40,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                jData1['value'],
                style: TextStyle(
                    color: Colors.white,
                    fontSize: 70,
                    fontWeight: FontWeight.bold),
              ),
              Text(
                jData1['advice'],
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 20,
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
