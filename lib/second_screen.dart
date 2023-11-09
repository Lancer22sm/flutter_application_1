import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_methods.dart';
import 'dart:ui';

var _MyMethods = MyMethods();

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, Key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Вторая страница"),
      ),
      body: Column(children: <Widget>[
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
            false),
        const Padding(padding: EdgeInsets.only(top: 40)),
        GestureDetector(
            onTap: () {
              var containerss = Container(
                width: 120,
                height: 2,
                color: Colors.green,
              );
              var myRowStroke = _MyMethods.myRowStroke();
              var myRowPeople = _MyMethods.myRowPeople(
                  _MyMethods.getTextFromField(),
                  Image.asset('assets/images/image1.jpg',
                      width: 24, height: 24),
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
                  false);
              Navigator.of(context).pushReplacement(
                MaterialPageRoute<void>(
                  builder: (BuildContext context) => containerss,
                ),
              );
              WidgetsBinding.instance.addPostFrameCallback((timeStamp) {
                // Создаем новый виджет
                final widget = const Text('Hello, World!');

                // Добавляем виджет в дерево виджетов
                context.replaceWith(widget);
              });
            },
            child: Container(
              alignment: Alignment.center,
              width: 180,
              height: 20,
              color: Colors.blue,
              child: const Text("добавить пользователя"),
            ))
      ]),
    );
  }
}
