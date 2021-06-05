import 'package:flutter/material.dart';
import 'dart:math';

void main() {
  return runApp(
    MaterialApp(
      home: Scaffold(
        backgroundColor: Colors.red,
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

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    leftDiceNumber = milestoneDice();
                    print("leftDiceNumber = $leftDiceNumber");
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$leftDiceNumber.png'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  setState(() {
                    rightDiceNumber = milestoneDice();
                    print("rightDiceNumber = $rightDiceNumber");
                  });
                },
                child: Image(
                  image: AssetImage('images/dice$rightDiceNumber.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
/*

class DicePage extends StatelessWidget {
  int leftDiceNumber = 1;
  int rightDiceNumber = 1;
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  print("bouton gauche pressé");
                  leftDiceNumber += 1;
                },
                child: Image(
                  image: AssetImage('images/dice$leftDiceNumber.png'),
                ),
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: TextButton(
                onPressed: () {
                  print("bouton droit pressé");
                  rightDiceNumber += 1;
                },
                child: Image(
                  image: AssetImage('images/dice$rightDiceNumber.png'),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
*/
