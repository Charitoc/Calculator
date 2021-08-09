import 'package:flutter/material.dart';
import 'package:math_expressions/math_expressions.dart';

class MyBodywidget extends StatefulWidget {
  @override
  _MyBodywidgetState createState() => _MyBodywidgetState();
}

class _MyBodywidgetState extends State<MyBodywidget> {
  String equation = '';
  String result = '';
  String expression = "";
  final List numbers = [
    'C',
    '⌫',
    '%',
    '÷',
    '7',
    '8',
    '9',
    'x',
    '4',
    '5',
    '6',
    '-',
    '1',
    '2',
    '3',
    '+',
    '00',
    '0',
    ',',
    '='
  ];

  void _updateScreen(var num) {
    setState(() {
      if (num == 'C') {
        equation = '';
        result = '';
      } else if (num == '⌫') {
        equation = equation.substring(0, equation.length - 1);
      } else if (num == '=') {
        expression = equation;
        expression = expression.replaceAll('x', '*');
        expression = expression.replaceAll('÷', '/');

        try {
          Parser p = Parser();
          Expression exp = p.parse(expression);

          ContextModel cm = ContextModel();
          result = '${exp.evaluate(EvaluationType.REAL, cm)}';
        } catch (e) {
          result = 'Error';
        }
      } else {
        equation += num;
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.topRight,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              equation,
              style: TextStyle(fontSize: 38, fontWeight: FontWeight.bold),
            ),
            color: Colors.grey[200],
          ),
        ),
        Expanded(
          flex: 1,
          child: Container(
            alignment: Alignment.bottomRight,
            padding: EdgeInsets.all(10),
            width: double.infinity,
            child: Text(
              result,
              style: TextStyle(
                fontSize: 48,
                fontWeight: FontWeight.bold,
              ),
            ),
            color: Colors.grey[200],
          ),
        ),
        Expanded(
          flex: 2,
          child: GridView.count(
              childAspectRatio: 3 / 2,
              crossAxisCount: 4,
              padding: EdgeInsets.all(10),
              children: numbers.map((num) {
                return Card(
                  elevation: 4,
                  shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(30)),
                  child: InkWell(
                    borderRadius: BorderRadius.circular(30),
                    child: Center(
                      child: Container(
                        child: Text(
                          num,
                          style: TextStyle(fontSize: 30, height: 1.5),
                        ),
                      ),
                    ),
                    onTap: () {
                      _updateScreen(num);
                    },
                  ),
                );
              }).toList()),
        ),
      ],
    );
  }
}
