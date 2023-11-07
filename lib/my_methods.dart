import 'dart:convert';

import 'package:flutter/material.dart';
import 'dart:io';

class MyMethods extends StatelessWidget {
  const MyMethods({super.key});

  Widget FirstOrSecondScreen(bool first, String namePeople) {
    if (first) {
      return Text(
        namePeople,
        textAlign: TextAlign.left,
        style: const TextStyle(color: Colors.black),
        overflow: TextOverflow.ellipsis,
        maxLines: 1,
        softWrap: false,
      );
    } else {
      return const TextField(
        decoration: InputDecoration(
            contentPadding: EdgeInsets.only(bottom: 10),
            enabledBorder: InputBorder.none,
            focusedBorder: InputBorder.none,
            hintText: 'Введите текст'),
      );
    }
  }

  void myJson() {
    List<String> names = [
    "Алиса",
    "Боб",
    "Чарли",
  ];
  }

  Column myColumnStatePeople(
      String namePeople,
      bool state,
      double containerWidth,
      Color containerColor,
      String statePeople,
      double containerPadding,
      bool first) {
    if (state) {
      return Column(
        children: <Widget>[
          Container(
              alignment: Alignment.bottomLeft,
              padding: const EdgeInsets.only(left: 5),
              width: 180,
              height: 20,
              child: FirstOrSecondScreen(first, namePeople)),
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
              child: FirstOrSecondScreen(first, namePeople))
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
      double heightSizeBox,
      bool first) {
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
              heightSizeBox,
              first)
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
      double heightSizeBox,
      bool first) {
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
                        containerColor, statePeople, containerPadding, first),
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
      appBar: AppBar(
        title: const Text('dsds'),
      ),
    );
  }
}
