import 'package:calculator/controller/NavigationController.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';

class Calculator extends StatefulWidget {
  final NavigationController controller = Get.put(NavigationController());
  Calculator({super.key});

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  Widget calcbutton(
      String btntxt, Color btncolor, Color txtcolor, double size) {
    return Container(
      child: ElevatedButton(
        onPressed: () {
          // Here we'll put what will be done after pressing the button
        },
        style: ElevatedButton.styleFrom(
          shape: const CircleBorder(),
          shadowColor: btncolor,
          padding: EdgeInsets.all(size * 0.05),
        ),
        child: Text(
          btntxt,
          style: TextStyle(
            fontSize: size * 0.1,
            color: txtcolor,
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    final buttonSize = size.width * 0.2;
    final fontSize = size.width * 0.1;

    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        title: const Text(
          'Calculator',
          style: TextStyle(color: Colors.black),
        ),
        backgroundColor: Colors.white,
      ),
      body: Padding(
        padding: EdgeInsets.symmetric(horizontal: size.width * 0.05),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            // Calculator display
            Row(
              mainAxisAlignment: MainAxisAlignment.end,
              children: [
                Padding(
                  padding: EdgeInsets.all(size.width * 0.02),
                  child: Text(
                    '0',
                    textAlign: TextAlign.left,
                    style: TextStyle(
                      color: Colors.black,
                      fontSize: fontSize,
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('AC', Colors.grey, Colors.black, buttonSize),
                calcbutton('+/-', Colors.grey, Colors.black, buttonSize),
                calcbutton('%', Colors.grey, Colors.black, buttonSize),
                calcbutton('/', Colors.amber, Colors.black, buttonSize),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('7', Colors.grey, Colors.black, buttonSize),
                calcbutton('8', Colors.grey, Colors.black, buttonSize),
                calcbutton('9', Colors.grey, Colors.black, buttonSize),
                calcbutton('x', Colors.amber, Colors.black, buttonSize),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('4', Colors.grey, Colors.black, buttonSize),
                calcbutton('5', Colors.grey, Colors.black, buttonSize),
                calcbutton('6', Colors.grey, Colors.black, buttonSize),
                calcbutton('-', Colors.amber, Colors.black, buttonSize),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                calcbutton('1', Colors.grey, Colors.black, buttonSize),
                calcbutton('2', Colors.grey, Colors.black, buttonSize),
                calcbutton('3', Colors.grey, Colors.black, buttonSize),
                calcbutton('+', Colors.orangeAccent, Colors.black, buttonSize),
              ],
            ),
            SizedBox(height: size.height * 0.01),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                ElevatedButton(
                  onPressed: () {
                    // button function
                  },
                  style: ElevatedButton.styleFrom(
                    padding: EdgeInsets.symmetric(
                      vertical: size.height * 0.025,
                      horizontal: size.width * 0.05,
                    ),
                    shape: const StadiumBorder(),
                    backgroundColor: Colors.grey,
                  ),
                  child: Text(
                    "0",
                    style: TextStyle(
                      fontSize: size.width * 0.1,
                      color: Colors.white,
                    ),
                  ),
                ),
                calcbutton('.', Colors.grey, Colors.black, buttonSize),
                calcbutton('DEL', Colors.grey, Colors.black, buttonSize),
                calcbutton('=', Colors.orangeAccent, Colors.black, buttonSize),
              ],
            ),
          ],
        ),
      ),
    );
  }

  // Here we're going to write the calculator logic of the app
}
