import 'package:flutter/material.dart';

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

class SecondScreen extends StatelessWidget {
  const SecondScreen({super.key, Key});
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("haha"),
      ),
      body: Column(
        children:<Widget>[
          _MyHomePageState().myRowPeople(
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
                20),
            _MyHomePageState().myRowStroke(),
        ]
        ),
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

  Column myColumnStatePeople(
      String namePeople,
      bool state,
      double containerWidth,
      Color containerColor,
      String statePeople,
      double containerPadding) {
    if (state) {
      return Column(
        children: <Widget>[
          Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 5),
              width: 180,
              height: 20,
              child: Text(
                namePeople,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              )),
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
              child: Text(
                namePeople,
                textAlign: TextAlign.left,
                style: const TextStyle(color: Colors.black),
                overflow: TextOverflow.ellipsis,
                maxLines: 1,
                softWrap: false,
              ))
        ],
      );
    }
  }

  Row myRowPeople(
      String namePeople,
      Image imagePeople,
      Icon iconMicro,
      Icon iconCamera,
      Icon iconHand,
      bool state,
      double containerWidth,
      Color containerColor,
      String statePeople,
      double containerPadding,
      double heightSizeBox) {
    return Row(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: <Column>[
          myColumnPeople(
              namePeople,
              imagePeople,
              iconMicro,
              iconCamera,
              iconHand,
              state,
              containerWidth,
              containerColor,
              statePeople,
              containerPadding,
              heightSizeBox)
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
      Icon iconMicro,
      Icon iconCamera,
      Icon iconHand,
      bool state,
      double containerWidth,
      Color containerColor,
      String statePeople,
      double containerPadding,
      double heightSizeBox) {
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
                    myColumnStatePeople(namePeople, state, containerWidth,
                        containerColor, statePeople, containerPadding),
                    SizedBox(
                        width: 130,
                        child: Wrap(
                          spacing: 5,
                          children: <Widget>[
                            iconHand,
                            iconMicro,
                            iconCamera,
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
                        style: const TextStyle(
                          color: Colors.black,
                          fontSize: 20,
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
                        child: const Icon(Icons.add, color: Colors.lightBlue),
                      ),
                      onTap: () {},
                    ),
                  ],
                )
              ],
            ),
            const Padding(padding: EdgeInsets.only(top: 30)),
            myRowPeople(
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
                20),
            myRowStroke(),
            myRowPeople(
                "Ассистентовый Вадим",
                Image.asset('assets/images/image2.jpg', width: 24, height: 24),
                const Icon(Icons.mic_off, color: Colors.blueGrey),
                const Icon(Icons.videocam_off, color: Colors.blueGrey),
                const Icon(
                  Icons.back_hand,
                  color: Colors.red,
                  size: 20,
                ),
                true,
                65,
                Colors.grey,
                "Отошёл",
                115,
                45),
            myRowStroke(),
            myRowPeople(
                "Поинтов Пётр Петрович",
                Image.asset('assets/images/image3.jpg', width: 24, height: 24),
                const Icon(Icons.mic, color: Colors.blueGrey),
                const Icon(Icons.videocam_off, color: Colors.blueGrey),
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
                20),
            myRowStroke(),
            myRowPeople(
                "Селекторный Кирил Валерьевич",
                Image.asset('assets/images/image4.jpg', width: 24, height: 24),
                const Icon(Icons.mic_off, color: Colors.blueGrey),
                const Icon(Icons.videocam_off, color: Colors.blueGrey),
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
                20),
            myRowStroke(),
            myRowPeople(
                "Худенков Александр",
                Image.asset('assets/images/image5.jpg', width: 24, height: 24),
                const Icon(Icons.mic, color: Colors.blueGrey),
                const Icon(Icons.videocam_off, color: Colors.blueGrey),
                const Icon(
                  Icons.back_hand,
                  color: Colors.white,
                  size: 20,
                ),
                true,
                65,
                Colors.grey,
                "Отошёл",
                115,
                45),
            myRowStroke(),
            myRowPeople(
                "Цапля Андрей Андреевич",
                Image.asset('assets/images/image6.jpg', width: 24, height: 24),
                const Icon(Icons.mic_off, color: Colors.blueGrey),
                const Icon(Icons.videocam_off, color: Colors.blueGrey),
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
                45),
            myRowStroke(),
            myRowPeople(
                "Черный Артём Генадьевич",
                Image.asset('assets/images/image7.jpg', width: 24, height: 24),
                const Icon(Icons.mic_off, color: Colors.blueGrey),
                const Icon(Icons.videocam_off, color: Colors.blueGrey),
                const Icon(
                  Icons.back_hand,
                  color: Colors.white,
                  size: 20,
                ),
                true,
                70,
                Colors.lightGreen,
                "Звоним...",
                110,
                45),
                const Padding(padding: EdgeInsets.only(top: 50)),
                ElevatedButton(onPressed: () {
                  Navigator.push(context, MaterialPageRoute(builder: (context) => const SecondScreen()),);
                }, child: const Text("Переход на некст страницу"))
          ],
        ),
      ),
    );
  }
}
