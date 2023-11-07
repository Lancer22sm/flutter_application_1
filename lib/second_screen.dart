
import 'package:flutter/material.dart';
import 'package:flutter_application_1/my_methods.dart';

var _MyMethods = const MyMethods();

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
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
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
                45,
                false),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
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
                20,
                false),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
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
                20,
                false),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
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
                45,
                false),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
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
                45,
                false),
            _MyMethods.myRowStroke(),
            _MyMethods.myRowPeople(
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
                45,
                false)
        ]
        ),
    );
  }
}
