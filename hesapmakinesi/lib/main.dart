import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      theme: ThemeData(),
      home: const HesapMakinesi(),
    );
  }
}

class HesapMakinesi extends StatefulWidget {
  const HesapMakinesi({Key? key}) : super(key: key);

  @override
  State<HesapMakinesi> createState() => _HesapMakinesiState();
}

class _HesapMakinesiState extends State<HesapMakinesi> {
  int first = 0;
  int second = 0;
  String result = "";
  String text = "";
  String opp = "";
  void ButonFonksiyon(String value) {
    if (value == "C") {
      result = "";
      text = "";
    } else if (value == "+" ||
        value == "-" ||
        value == "x" ||
        value == "/" ||
        value == "%") {
      first = int.parse(text);
      result = "";
      opp = value;
    } else if (value == "=") {
      second = int.parse(text);
      if (opp == "+") {
        result = (first + second).toString();
      }
      if (opp == "-") {
        result = (first - second).toString();
      }
      if (opp == "x") {
        result = (first * second).toString();
      }
      if (opp == "/") {
        result = (first / second).toString();
      }
      if (opp == "%") {
        result = (first % second).toString();
      }
    } else {
      result = int.parse(text + value).toString();
    }

    setState(() {
      text = result;
    });
  }

  Widget BtnContainer(String btnAd, Color btnRenk, Color ContainerRenk) {
    return GestureDetector(
      onTap: (() => ButonFonksiyon(btnAd)),
      child: Container(
        width: 75,
        height: 75,
        decoration: BoxDecoration(
          shape: BoxShape.circle,
          color: ContainerRenk,
        ),
        child: Center(
          child: Text(
            btnAd,
            style: TextStyle(color: btnRenk, fontSize: 30),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          backgroundColor: Colors.black,
          body: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.end,
            children: [
              Text(
                text,
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
              const Divider(
                color: Colors.grey,
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnContainer("C", Colors.white, Colors.orange),
                  BtnContainer("+/-", Colors.white, Colors.orange),
                  BtnContainer("%", Colors.white, Colors.orange),
                  BtnContainer("/", Colors.white, Colors.orange),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnContainer("7", Colors.white, Colors.grey),
                  BtnContainer("8", Colors.white, Colors.grey),
                  BtnContainer("9", Colors.white, Colors.grey),
                  BtnContainer("x", Colors.white, Colors.orange),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnContainer("4", Colors.white, Colors.grey),
                  BtnContainer("5", Colors.white, Colors.grey),
                  BtnContainer("6", Colors.white, Colors.grey),
                  BtnContainer("-", Colors.white, Colors.orange),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnContainer("1", Colors.white, Colors.grey),
                  BtnContainer("2", Colors.white, Colors.grey),
                  BtnContainer("3", Colors.white, Colors.grey),
                  BtnContainer("+", Colors.white, Colors.orange),
                ],
              ),
              const SizedBox(
                height: 10,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  BtnContainer("", Colors.white, Colors.orange),
                  BtnContainer("0", Colors.white, Colors.grey),
                  BtnContainer(".", Colors.white, Colors.grey),
                  BtnContainer("=", Colors.white, Colors.orange),
                ],
              ),
              const SizedBox(
                height: 10,
              )
            ],
          )),
    );
  }
}
