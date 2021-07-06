import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.grey.shade900,
        appBar: AppBar(
          title: Text('Dicee'),
          backgroundColor: Colors.red,
        ),
        body: DicePage(),
      ),
    ),
  );
}

class DicePage extends StatefulWidget {
  const DicePage({Key? key}) : super(key: key);

  @override
  _DicePageState createState() => _DicePageState();
}

class _DicePageState extends State<DicePage> {
  int leftDiceNumber = 1;
  int centerDiceNumber = 1;
  // Random random = Random(7);
  int rightDiceNumber = 1;
  int diceUpper(int dice) {
    /**
     * increments dice value of 1,
     * if the value is greater than 6,
     * the value 1 is given as diceValue.
     */
    dice++;
    if (dice > 6) {
      dice = 1;
    }
    return dice;
  }

  int milestoneDice() {
    /**
     * this function ensures the dice value is between 1 and 6
     */
    int diceValue = 0;
    // while (diceValue < 1 || diceValue > 6) {
    diceValue = 1 + Random().nextInt(6) as int;
    // }
    return diceValue;
  }

  void changeDiceFace() {
    /**
     * This function throws two dice set display their random values.
     */

    setState(() {
      leftDiceNumber = milestoneDice();
      centerDiceNumber = milestoneDice();
      rightDiceNumber = milestoneDice();
      print("leftDiceNumber = $leftDiceNumber");
      print("centerDiceNumber = $centerDiceNumber");
      print("rightDiceNumber = $rightDiceNumber");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          buildedExpanded(context, leftDiceNumber, Colors.blue.shade400),
          buildedExpanded(context, centerDiceNumber, Colors.white),
          buildedExpanded(context, rightDiceNumber, Colors.red.shade400),
        ],
      ),
    );
  }

  @override
  Widget buildedExpanded(BuildContext context, int diceNumber, Color myColor) {
    return Expanded(
      child: Padding(
        padding: const EdgeInsets.all(2.0),
        child: TextButton(
          onPressed: () {
            changeDiceFace();
          },
          child: Image(
            image: AssetImage('images/dice$diceNumber.png'),
            color: myColor,
          ),
        ),
      ),
    );
  }
}
