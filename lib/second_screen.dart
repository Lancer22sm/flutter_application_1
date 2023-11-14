import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_methods.dart';

var _MyMethods = MyMethods();

String myTextField = "";

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

  String getMyTextField() {
    myTextField = _MyMethods.getTextFromField();
    return myTextField;
  }

  void _addItem() {
    setState(() {
      _items.add(_MyMethods.myRowStroke());
      _items.add(_MyMethods.myRowPeople(
          getMyTextField(),
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
    Map<String, dynamic> myData = await _MyMethods.readJSON();
    myData['names'].add(myTextField);
    _MyMethods.writeJSON(myData);
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
            child: const Text("Добавить пользователя")),
        const Padding(padding: EdgeInsets.only(top: 40)),
        ElevatedButton(
            onPressed: () {
              _MyMethods.jsonClear();
            },
            child: const Text("очистить json"))
      ]),
    );
  }
}
