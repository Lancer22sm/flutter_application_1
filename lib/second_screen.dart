import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_methods.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

var _MyMethods = MyMethods();

String myTextField = "";

Column myColumns = Column(children: <Widget>[
  _MyMethods.myRowPeople(
      "Александо Толстиков",
      Image.asset('assets/images/image1.jpg', width: 24, height: 24),
      SvgPicture.asset('assets/icons/mic_off.svg', height: 18),
      SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
      const Icon(
        Icons.back_hand,
        color: Colors.white,
        size: 20,
      ),
      "TextField",
      Colors.black)
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
          myTextField,
          Image.asset('assets/images/image1.jpg', width: 24, height: 24),
          SvgPicture.asset('assets/icons/mic_off.svg', height: 18),
          SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
          const Icon(
            Icons.back_hand,
            color: Colors.white,
            size: 20,
          ),
          "none",
          Colors.black));
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
              String getText = getMyTextField();
              if (getText != "") {
                _addItem();
              }
            },
            child: const Text("Добавить пользователя")),
        const Padding(padding: EdgeInsets.only(top: 40)),
        ElevatedButton(
            onPressed: () async {
              _MyMethods.jsonClear();

              Uri url = Uri.parse('http://192.168.42.76:8080/get');

              var response = await http.get(url);
              print(response.body);
            },
            child: const Text("очистить json"))
      ]),
    );
  }
}
