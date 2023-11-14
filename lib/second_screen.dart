import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_application_1/my_methods.dart';
import 'package:path_provider/path_provider.dart';

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

  localFile(path) async {
    return File('$path/MyNames.json');
  }

  void jsonCollect() async {
    List<String> myNames = [];
    //final file = File(await DefaultAssetBundle.of(context).loadString('assets/jsons/mynames.json'));
    var jsonData = await rootBundle.loadString('assets/jsons/mynames.json');
    Map<String, dynamic> data = jsonDecode(jsonData) as Map<String, dynamic>;
    data["names"].add(_MyMethods.getTextFromField());
    writeJSON(data);
    Map<String, dynamic> myData = await readJSON();
    List<dynamic> items = myData['names'];
    myNames = items.map((dynamic element) {
      return element.toString();
    }).toList();
    print(myNames);
    //file.writeAsStringSync(json.encode(data));
    //modifiedFile.writeAsStringSync(json.encode(data));
  }

  localPath() async {
    try {
      var tempDir = await getTemporaryDirectory();
      String tempPath = tempDir.path;

      var appDocDir = await getApplicationDocumentsDirectory();
      String appDocPath = appDocDir.path;
      return appDocPath;
    } catch (err) {
      print(err);
    }
  }

// читаем данные json
  readJSON() async {
    try {
      final file = await localFile(await localPath());
      String str = await file.readAsString();
      return json.decode(str);
    } catch (err) {
      print(err);
    }
  }

  // записываем данные json
  writeJSON(Map<String, dynamic> obj) async {
    try {
      final file = await localFile(await localPath());
      return file.writeAsString(json.encode(obj));
    } catch (err) {
      print(err);
    }
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
