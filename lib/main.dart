import 'package:flutter/material.dart';
import 'second_screen.dart';
import 'package:flutter_application_1/my_methods.dart';
import 'package:flutter_svg/svg.dart';

var _MyMethods = MyMethods();
// Вход в приложение
void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
// Маршрутизация домашней страницы приложения
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String dropdownvalue = 'Все';
  var items = [
    'Все',
    'Онлайн',
    'Оффлайн',
  ];

  final _items = <Widget>[];
  List<String> myNames = [];

  void _addItem() async {
    Map<String, dynamic> myData = await _MyMethods.readJSON();
    List<dynamic> items = myData['names'];
    myNames = items.map((dynamic element) {
      return element.toString();
    }).toList();
    if (myNames.length > 7) {
      setState(() {
        for (var i = 0; i < (myNames.length - 7); i++) {
          _items.add(_MyMethods.myRowStroke());
          _items.add(_MyMethods.myRowPeople(
              myNames[i + 7],
              Image.asset('assets/images/image1.jpg', width: 24, height: 24),
              SvgPicture.asset('assets/icons/mic_off.svg', height: 18),
              SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
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
              true,
              Colors.black));
        }
      });
    } else {
      _items.clear();
    }
  }

  @override
  void initState() {
    super.initState();
    _addItem();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Align(
        alignment: Alignment.topCenter,
        child: Column(
          children: <Widget>[
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: <Column>[
                Column(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 40)),
                    Container(
                      margin: const EdgeInsets.only(left: 10, right: 5),
                      height: 40,
                      width: 290,
                      decoration: BoxDecoration(
                          shape: BoxShape.rectangle,
                          borderRadius:
                              const BorderRadius.all(Radius.circular(5)),
                          border: Border.all(
                            color: Colors.grey,
                            width: 1,
                          )),
                      child: DropdownButton(
                        menuMaxHeight: 200,
                        isExpanded: true,
                        value: dropdownvalue,
                        padding: const EdgeInsets.only(left: 10),
                        style: const TextStyle(
                          color: Colors.black,
                          fontFamily: 'Montserrat',
                          fontSize: 18,
                        ),
                        icon: const Icon(Icons.keyboard_arrow_down),
                        items: items.map((String items) {
                          return DropdownMenuItem(
                            value: items,
                            child: Text(items),
                          );
                        }).toList(),
                        onChanged: (String? newValue) {
                          setState(() {
                            dropdownvalue = newValue!;
                            _addItem();
                          });
                        },
                      ),
                    )
                  ],
                ),
                Column(
                  children: <Widget>[
                    const Padding(padding: EdgeInsets.only(top: 40)),
                    InkWell(
                      child: Container(
                        margin: const EdgeInsets.only(right: 10, left: 5),
                        width: 40,
                        height: 40,
                        decoration: BoxDecoration(
                            shape: BoxShape.rectangle,
                            borderRadius:
                                const BorderRadius.all(Radius.circular(5)),
                            border: Border.all(
                              color: Colors.lightBlue,
                              width: 1,
                            )),
                        child: IconButton(
                          icon: const Icon(Icons.add, color: Colors.lightBlue),
                          onPressed: () {
                            Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const SecondScreen()),
                            );
                          },
                        ),
                      ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            _MyMethods.myRowPeople(
                "Александ Толстиков",
                Image.asset('assets/images/image1.jpg', width: 24, height: 24),
                SvgPicture.asset('assets/icons/mic_off.svg', height: 18),
                SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
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
                true,
                Colors.black),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
                "Ассистентовый Вадим",
                Image.asset('assets/images/image2.jpg', width: 24, height: 24),
                SvgPicture.asset('assets/icons/mic_off.svg', height: 18),
                SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
                const Icon(
                  Icons.back_hand,
                  color: Colors.red,
                  size: 20,
                ),
                true,
                65,
                Colors.black45,
                "Отошёл",
                115,
                45,
                true,
                Colors.black),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
                "Поинтов Пётр Петрович",
                Image.asset('assets/images/image3.jpg', width: 24, height: 24),
                SvgPicture.asset('assets/icons/mic_on.svg', height: 18),
                SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
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
                true,
                Colors.black),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
                "Селекторный Кирил Валерьевич",
                Image.asset('assets/images/image4.jpg', width: 24, height: 24),
                SvgPicture.asset('assets/icons/mic_off.svg', height: 18),
                SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
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
                true,
                Colors.black),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
                "Худенков Александр",
                Image.asset('assets/images/image5.jpg', width: 24, height: 24),
                SvgPicture.asset('assets/icons/mic_on.svg', height: 18),
                SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
                const Icon(
                  Icons.back_hand,
                  color: Colors.white,
                  size: 20,
                ),
                true,
                65,
                Colors.black45,
                "Отошёл",
                115,
                45,
                true,
                Colors.black),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
                "Цапля Андрей Андреевич",
                Image.asset('assets/images/image6.jpg', width: 24, height: 24),
                SvgPicture.asset('assets/icons/mic_off.svg', height: 18),
                SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
                const Icon(
                  Icons.back_hand,
                  color: Colors.white,
                  size: 20,
                ),
                true,
                130,
                Colors.black12,
                "Контакт оффлайн",
                55,
                45,
                true,
                Colors.black54),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
                "Черный Артём Генадьевич",
                Image.asset('assets/images/image7.jpg', width: 24, height: 24),
                SvgPicture.asset('assets/icons/mic_off.svg', height: 18),
                SvgPicture.asset('assets/icons/camera_off.svg', height: 18),
                const Icon(
                  Icons.back_hand,
                  color: Colors.white,
                  size: 20,
                ),
                true,
                70,
                const Color.fromRGBO(34, 165, 166, 1),
                "Звоним...",
                110,
                45,
                true,
                Colors.black54),
            Column(
              children: _items,
            ),
          ],
        ),
      ),
    );
  }
}
