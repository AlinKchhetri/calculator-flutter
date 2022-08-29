import 'package:bill/utils/constants.dart';
import 'package:flutter/material.dart';
import 'package:hexcolor/hexcolor.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {

  TextEditingController _heightController = TextEditingController();
  TextEditingController _weightController = TextEditingController();
  double _bmiResult = 0;
  String _textResult = "";

  Widget WeightWidget(String text) {
    return Container(
      width: 130,
      child: TextField(
        controller: _weightController,
        style: TextStyle(
          fontSize: 42,
          fontWeight: FontWeight.w300,
          color: accentColor,
        ),
        keyboardType: TextInputType.number,
        decoration: InputDecoration(
          hintText: text,
          hintStyle: TextStyle(
            fontSize: 42,
            fontWeight: FontWeight.w300,
            color: Colors.white.withOpacity(0.8),
          ),
          border: InputBorder.none,
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'BMI Calculator',
          style: TextStyle(
            color: HexColor('#FCC91C'),
            fontWeight: FontWeight.w300,
          ),
        ),
        backgroundColor: Colors.transparent,
        elevation: 0,
        centerTitle: true,
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            SizedBox(height: 20),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  width: 130,
                  child: TextField(
                    controller: _heightController,
                    style: TextStyle(
                      fontSize: 42,
                      fontWeight: FontWeight.w300,
                      color: accentColor,
                    ),
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: 'Height',
                      hintStyle: TextStyle(
                        fontSize: 42,
                        fontWeight: FontWeight.w300,
                        color: Colors.white.withOpacity(0.8),
                      ),
                      border: InputBorder.none,
                    ),
                  ),
                ),
                WeightWidget('Weight'),
              ],
            ),
            const SizedBox(
              height: 30,
            ),
            GestureDetector(
              onTap: () {
                double _h = double.parse(_heightController.text);
                double _w = double.parse(_weightController.text);
                setState(() {
                  _bmiResult = _w / (_h * _h);

                  if(_bmiResult > 25) {
                    _textResult = "You're over-weight";
                  } else if(_bmiResult >= 18.5 && _bmiResult <=25) {
                    _textResult = "You're normal-weight";
                  } else {
                    _textResult = "You're under-weight";
                  }
                });
              },
              child: Container(
                child: Text(
                  'Calculate',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 22
                  ),
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              child: Text(
                _bmiResult.toStringAsFixed(3),
                style: TextStyle(
                  color: accentColor,
                  fontSize: 22
                ),
              ),
            ),
            const SizedBox(
              height: 50,
            ),
            Visibility(
              visible: _textResult.isNotEmpty,
              child: Container(
                child: Text(
                  _textResult,
                  style: TextStyle(
                    color: accentColor,
                    fontSize: 32
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
