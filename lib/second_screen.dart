import 'package:flutter/material.dart';
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

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, Key});

  @override
  _SecondScreen createState() => _SecondScreen();
}

class _SecondScreen extends State<SecondScreen> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Вторая страница"),
      ),
      body: Column(
        children:<Widget>[
          myColumns,
        const Padding(padding: EdgeInsets.only(top: 40)),
        ElevatedButton(
                onPressed: () {
                  setState(() {
                    myColumns.children.add(_MyMethods.myRowStroke());
                    myColumns.children.add(_MyMethods.myRowPeople(
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
                  true));
                  });
                },
                child: const Text("Переход на другую страницу"))
        ]
        ),
    );
  }
}
