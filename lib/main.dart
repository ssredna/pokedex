import 'dart:convert';

import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:pokemon_type/typecard.dart';
import 'package:pokemon_type/types.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Pokemon Types',
      theme: ThemeData(
        primarySwatch: Colors.green,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: HomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class HomePage extends StatefulWidget {
  HomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  var url = 'https://pokeapi.co/api/v2/type/';

  var typeList = new List<PokeType>();
  var debugLog = new List<String>();

  @override
  void initState() {
    super.initState();

    fetchData();
  }

  fetchData() async {
    var resAllTypes = await http.get(url);
    var decodedJson = jsonDecode(resAllTypes.body);
    for (var type in decodedJson['results']) {
      var resType = await http.get(type['url']);
      var decodedJsonType = jsonDecode(resType.body);
      if (typeList.length < 18) {
        this.typeList.add(new PokeType.fromJson(decodedJsonType));
        this.debugLog.add(type['url']);
        setState(() {});
      }
    }

    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Pokemon Types'),
          backgroundColor: Colors.amber[400],
        ),
        body: typeList.length < 18
            ? Center(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: <Widget>[
                    CircularProgressIndicator(),
                    Text(debugLog.last),
                  ],
                ),
              )
            : GridView.count(
                crossAxisCount: 3,
                children: typeList
                    .map((type) => TypeCard(
                          type: type,
                        ))
                    .toList(),
              ));
  }
}
