import 'package:bill/utils/constants.dart';
import 'package:flutter/material.dart';

class Calculator extends StatefulWidget {
  const Calculator({Key? key}) : super(key: key);

  @override
  State<Calculator> createState() => _CalculatorState();
}

class _CalculatorState extends State<Calculator> {
  double result = 0;
  dynamic temp;
  var num = 0;
  var operation = '';

  Widget resultView(double result, double width, double height) {
    return Container(
      width: width,
      height: height / 2.7,
      color: Colors.black,
      child: Column(
        mainAxisAlignment: MainAxisAlignment.end,
        children: [
          Text(
              num.toString(),
              style: TextStyle(
                color: Colors.white.withOpacity(0.6),
                fontSize: 18,
              ),
            ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              crossAxisAlignment: CrossAxisAlignment.end,
              children: [
                SizedBox(width: width - 170),
                Text(
                  result.toStringAsFixed(3),
                  style: const TextStyle(
                    color: Colors.white,
                    fontSize: 32,
                  ),
                )
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget numberButton(int number, color) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          num = number;
        });
      },
      child: Text(
        number.toString(),
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }

  Widget stringButton(String op, color) {
    return ElevatedButton(
      onPressed: () {
        setState(() {
          if (op == 'AC') {
            result = 0;
            num = 0;
          } else if (op == '+') {
            temp = num;
            result = result + temp;
          } else if (op == '--') {
            temp = num;
            result = result - temp;
          } else if (op == 'X') {
            temp = num;
            result = result * temp;
          } else if (op == '-:-') {
            temp = num;
            result = result / temp;
          } else if (op == '=') {
      
          }
        });
      },
      child: Text(
        op,
        style: const TextStyle(
          fontSize: 24,
        ),
      ),
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all<Color>(color),
        shape: MaterialStateProperty.all<RoundedRectangleBorder>(
          RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(100),
          ),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    var width = MediaQuery.of(context).size.width;
    var height = MediaQuery.of(context).size.height;

    var padding = MediaQuery.of(context).padding;
    var safeHeight = height - padding.top - padding.bottom;

    return Scaffold(
      body: Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            resultView(result, width, height),
            GridView.count(
              crossAxisCount: 4,
              childAspectRatio: 1 / 1,
              crossAxisSpacing: 10,
              mainAxisSpacing: 10,
              padding: const EdgeInsets.all(10.0),
              shrinkWrap: true,
              children: [
                stringButton('AC', opColor),
                stringButton('+/-', opColor),
                stringButton('%', opColor),
                stringButton('-:-', accentColor),
                numberButton(7, numberColor),
                numberButton(8, numberColor),
                numberButton(9, numberColor),
                stringButton('X', accentColor),
                numberButton(4, numberColor),
                numberButton(5, numberColor),
                numberButton(6, numberColor),
                stringButton('--', accentColor),
                numberButton(1, numberColor),
                numberButton(2, numberColor),
                numberButton(3, numberColor),
                stringButton('+', accentColor),
                numberButton(0, numberColor),
                stringButton('.', numberColor),
                stringButton('=', accentColor),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
