import 'dart:convert';
import 'dart:io';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:path_provider/path_provider.dart';
import 'package:flutter_svg/svg.dart';
import 'package:http/http.dart' as http;

class MyMethods extends StatelessWidget {
  MyMethods({super.key});
  final _controller = TextEditingController();

  String getTextFromField() {
    String myText = _controller.text;
    _controller.text = "";
    return myText;
  }

  localFile(path) async {
    return File('$path/MyNames.json');
  }

  void jsonClear() async {
    var jsonData = await rootBundle.loadString('assets/jsons/mynames.json');
    Map<String, dynamic> data = jsonDecode(jsonData) as Map<String, dynamic>;
    writeJSON(data);
  }

  localPath() async {
    try {
      //var tempDir = await getTemporaryDirectory();
      //String tempPath = tempDir.path;

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
      Uri url = Uri.parse('http://192.168.42.76:8080/get');
      var response = await http.get(url);
      //print(response.body);

      //final file = await localFile(await localPath());
      //String str = await file.readAsString();

      return json.decode(response.body);
    } catch (err) {
      print(err);
    }
  }

  // записываем данные json
  writeJSON(Map<String, dynamic> obj) async {
    try {
      //final file = await localFile(await localPath());
      String myObj = jsonEncode(obj);
      print(myObj);
      Uri url = Uri.parse('http://192.168.42.76:8080/put');
      var isPut = await http.put(url, body: myObj);
      print(isPut);

      //return file.writeAsString(json.encode(obj));
    } catch (err) {
      print(err);
    }
  }

  Widget FirstOrSecondScreen(bool first, String namePeople, Color colorText) {
    if (first) {
      return Text(
        namePeople,
        textAlign: TextAlign.left,
        style: TextStyle(
          color: colorText,
          fontFamily: 'Montserrat',
        ),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: false,
      );
    } else {
      return TextField(
        controller: _controller,
        decoration: const InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Введите текст'),
      );
    }
  }

  Column myColumnStatePeople(
      String namePeople,
      bool state,
      double containerWidth,
      Color containerColor,
      String statePeople,
      double containerPadding,
      bool first,
      Color colorText) {
    if (state) {
      return Column(
        children: <Widget>[
          Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 5),
              width: 180,
              height: 20,
              child: FirstOrSecondScreen(first, namePeople, colorText)),
          Padding(
            padding: EdgeInsets.only(right: containerPadding, left: 5, top: 5),
            child: Container(
              alignment: Alignment.center,
              width: containerWidth,
              height: 20,
              decoration: BoxDecoration(
                  shape: BoxShape.rectangle,
                  borderRadius: const BorderRadius.all(Radius.circular(15)),
                  color: containerColor),
              child: Text(
                statePeople,
                maxLines: 1,
                style: const TextStyle(color: Colors.white),
              ),
            ),
          )
        ],
      );
    } else {
      return Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: <Widget>[
          Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 5),
              width: 180,
              height: 20,
              child: FirstOrSecondScreen(first, namePeople, colorText))
        ],
      );
    }
  }

  Row myRowPeople(
      String namePeople,
      Image imagePeople,
      SvgPicture svgMicro,
      SvgPicture svgCamera,
      Icon iconHand,
      String statePeople,
      Color colorText) {
    bool first = true;
    bool state = true;
    double containerWidth;
    Color containerColor;
    double containerPadding;
    double heightSizeBox;
    if (statePeople == "none") {
      state = false;
      containerWidth = 65;
      containerColor = Colors.grey;
      containerPadding = 115;
      heightSizeBox = 20;
    } else if (statePeople == "Отошёл") {
      containerWidth = 65;
      containerColor = Colors.grey;
      containerPadding = 115;
      heightSizeBox = 45;
    } else if (statePeople == "Контакт оффлайн") {
      containerWidth = 130;
      containerColor = Colors.black12;
      containerPadding = 50;
      heightSizeBox = 45;
    } else if (statePeople == "Звоним...") {
      containerWidth = 70;
      containerColor = const Color.fromRGBO(34, 165, 166, 1);
      containerPadding = 110;
      heightSizeBox = 45;
    } else {
      state = false;
      containerWidth = 65;
      containerColor = Colors.grey;
      containerPadding = 115;
      heightSizeBox = 20;
      first = false;
    }
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Column>[
          myColumnPeople(
              namePeople,
              imagePeople,
              svgMicro,
              svgCamera,
              iconHand,
              state,
              containerWidth,
              containerColor,
              statePeople,
              containerPadding,
              heightSizeBox,
              first,
              colorText)
        ]);
  }

  Row myRowStroke() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: <Column>[myColumnStroke()],
    );
  }

  Column myColumnPeople(
      String namePeople,
      Image imagePeople,
      SvgPicture svgMicro,
      SvgPicture svgCamera,
      Icon iconHand,
      bool state,
      double containerWidth,
      Color containerColor,
      String statePeople,
      double containerPadding,
      double heightSizeBox,
      bool first,
      Color colorText) {
    return Column(
      mainAxisAlignment: MainAxisAlignment.start,
      children: <Widget>[
        const Padding(padding: EdgeInsets.only(top: 10)),
        Row(
          children: <Widget>[
            const Padding(padding: EdgeInsets.only(left: 5, right: 10)),
            ClipOval(
              child: SizedBox.fromSize(
                size: const Size.fromRadius(12), // Image radius
                child: imagePeople,
              ),
            ),
            SizedBox(
              width: 320,
              height: heightSizeBox,
              child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: <Widget>[
                    myColumnStatePeople(
                        namePeople,
                        state,
                        containerWidth,
                        containerColor,
                        statePeople,
                        containerPadding,
                        first,
                        colorText),
                    SizedBox(
                        width: 120,
                        child: Wrap(
                          spacing: 5,
                          children: <Widget>[
                            iconHand,
                            SizedBox(
                              width: 20,
                              child: svgMicro,
                            ),
                            svgCamera,
                            const Padding(padding: EdgeInsets.only(left: 5)),
                            const Icon(Icons.arrow_drop_down,
                                color: Colors.black)
                          ],
                        ))
                  ]),
            )
          ],
        )
      ],
    );
  }

  Column myColumnStroke() {
    return Column(
      children: <Widget>[
        InkWell(
          child: Container(
              color: Colors.grey,
              margin: const EdgeInsets.only(right: 10, left: 10, top: 10),
              width: 340,
              height: 1),
        ),
      ],
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('dsds'),
      ),
    );
  }
}
