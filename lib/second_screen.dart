import 'dart:convert';
import 'dart:io';

import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/my_methods.dart';

var _MyMethods = MyMethods();

Column myColumns = Column(children: <Widget>[
  _MyMethods.myRowPeople(
      "Александо Толстиков",
      Image.asset('assets/images/image1.jpg', width: 24, height: 24),
      const Icon(Icons.mic_off, color: Colors.blueGrey),
      const Icon(
        Icons.videocam_off,
        color: Colors.blueGrey,
      ),
      const Icon(
        Icons.back_hand,
        color: Colors.white,
        size: 20,
      ),
      false,
      65,
      Colors.grey,
      "Отошёл",
      115,
      20,
      false)
]);

class SecondScreen extends StatefulWidget {
  const SecondScreen({super.key, Key});

  @override
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {
  final _items = <Widget>[];

  

  void _addItem() {
    setState(() {
      _items.add(_MyMethods.myRowStroke());
      _items.add(_MyMethods.myRowPeople(
          _MyMethods.getTextFromField(),
          Image.asset('assets/images/image1.jpg', width: 24, height: 24),
          const Icon(Icons.mic_off, color: Colors.blueGrey),
          const Icon(
            Icons.videocam_off,
            color: Colors.blueGrey,
          ),
          const Icon(
            Icons.back_hand,
            color: Colors.white,
            size: 20,
          ),
          false,
          65,
          Colors.grey,
          "Отошёл",
          115,
          20,
          true));
          jsonCollect();
    });
  }

  void jsonCollect() async {
    final String asset = 'assets/jsons/mynames.json';
    File modifiedFile = File(asset);
    //final file = File(await DefaultAssetBundle.of(context).loadString('assets/jsons/mynames.json'));
    var jsonData = await rootBundle.loadString('assets/jsons/mynames.json');
    Map<String, dynamic> data = jsonDecode(jsonData) as Map<String, dynamic>;
    data["names"].add(_MyMethods.getTextFromField());
    //file.writeAsStringSync(json.encode(data));
    modifiedFile.writeAsStringSync(json.encode(data));
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Вторая страница"),
      ),
      body: Column(children: <Widget>[
        myColumns,
        Column(
          children: _items,
        ),
        const Padding(padding: EdgeInsets.only(top: 40)),
        ElevatedButton(
            onPressed: () {
              _addItem();
            },
            child: const Text("Добавить пользователя"))
      ]),
    );
  }
}
