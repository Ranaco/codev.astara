// ignore_for_file: avoid_types_as_parameter_names, non_constant_identifier_names, prefer_const_constructors, prefer_const_literals_to_create_immutables

import 'package:flutter/material.dart';

void main() {
  runApp(MaterialApp(home: const MyApp()));
}

class MyApp extends StatefulWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  _MyAppState createState() => _MyAppState();
}

class _MyAppState extends State<MyApp> {
  var init = '';
  var res = '';
  var operationToPerform = '0';
  var firstNum = 0;
  var secondNum = 0;
  var history = '0';
  _Calc(var got) {
    if (got == 'AC') {
      init = '0';
      res = '0';
      firstNum = 0;
      history = '0';
      operationToPerform = '0';
      secondNum = 0;
    } else if (got == 'C') {
      firstNum = 0;
      res = '0';
      secondNum = 0;
    } else if (got == '+' ||
        got == '-' ||
        got == '/' ||
        got == '*' ||
        got == '%') {
      firstNum = int.parse(init);
      res = '';
      operationToPerform = got;
    } else if (got == '=') {
      secondNum = int.parse(init);

      if (operationToPerform == '+') {
        res = (firstNum + secondNum).toString();
        history =
            firstNum.toString() + operationToPerform + secondNum.toString();
      }
      if (operationToPerform == '-') {
        res = (firstNum - secondNum).toString();
        history =
            firstNum.toString() + operationToPerform + secondNum.toString();
      }
      if (operationToPerform == '*') {
        res = (firstNum * secondNum).toString();
        history =
            firstNum.toString() + operationToPerform + secondNum.toString();
      }
      if (operationToPerform == '/') {
        res = (firstNum / secondNum).toString();
        history =
            firstNum.toString() + operationToPerform + secondNum.toString();
      }
      if (operationToPerform == '%') {
        res = ((firstNum / secondNum) * 100).toString();
        history =
            firstNum.toString() + operationToPerform + secondNum.toString();
      }
    } else if (got == '<') {
      res = init.substring(0, init.length - 1);
    } else {
      res = int.parse(init + got).toString();
    }
    setState(() {
      init = res;
    });
  }

  @override
  Widget build(BuildContext context) {
    Widget Numbutton(var num, [var color = Colors.black, var text]) {
      return Container(
        decoration: BoxDecoration(boxShadow: [
          BoxShadow(
            color: Colors.grey.shade900,
            offset: Offset(2, 2),
            blurRadius: 15,
            spreadRadius: 1,
          ),
          BoxShadow(
            color: Colors.grey.shade700,
            offset: Offset(2, 2),
            blurRadius: 15,
            spreadRadius: 1,
          )
        ], shape: BoxShape.circle),
        child: ElevatedButton(
          onPressed: () {
            _Calc(num);
          },
          child: Text(
            num,
            style: TextStyle(
              fontSize: 25,
              fontWeight: FontWeight.w300,
              color: text,
            ),
          ),
          style: ElevatedButton.styleFrom(
              shape: CircleBorder(), primary: color, fixedSize: Size(40, 40)),
        ),
      );
    }

    Widget OpButton(var text) {
      return ElevatedButton(
        onPressed: () {
          _Calc(text);
        },
        child: Text(
          text,
          style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),
        ),
        style: ElevatedButton.styleFrom(
          primary: Colors.grey.shade900,
        ),
      );
    }

    return MaterialApp(
      debugShowCheckedModeBanner: false,
      home: Scaffold(
        backgroundColor: Colors.black,
        body: Wrap(
          direction: Axis.horizontal,
          alignment: WrapAlignment.spaceEvenly,
          children: <Widget>[
            Column(
              children: <Widget>[
                SizedBox(
                  height: 220,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    Text(
                      history,
                      style: TextStyle(
                        color: Colors.grey.shade500,
                      ),
                    )
                  ],
                ),
                SizedBox(
                  height: 10,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: <Widget>[
                    Text(
                      init,
                      style:
                          TextStyle(color: Colors.grey.shade400, fontSize: 50),
                    ),
                  ],
                ),
                SizedBox(
                  height: 50,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    OpButton('AC'),
                    OpButton('C'),
                    Numbutton('<', Colors.grey.shade300, Colors.grey.shade900),
                    Numbutton('%', Colors.grey.shade300, Colors.grey.shade900),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: <Widget>[
                    Numbutton('7'),
                    Numbutton('8'),
                    Numbutton('9'),
                    Numbutton(
                      '*',
                      Colors.grey.shade300,
                      Colors.grey.shade900,
                    ),
                  ],
                ),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Numbutton('4'),
                      Numbutton('5'),
                      Numbutton('6'),
                      Numbutton(
                          '+', Colors.grey.shade300, Colors.grey.shade900),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Numbutton('1'),
                      Numbutton('2'),
                      Numbutton('3'),
                      Numbutton(
                          '-', Colors.grey.shade300, Colors.grey.shade900),
                    ]),
                SizedBox(
                  height: 20,
                ),
                Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: <Widget>[
                      Numbutton('00'),
                      Numbutton('0'),
                      Container(
                        decoration: BoxDecoration(boxShadow: [
                          BoxShadow(
                            color: Colors.grey.shade900,
                            offset: Offset(2, 2),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                          BoxShadow(
                            color: Colors.grey.shade900,
                            offset: Offset(2, 2),
                            blurRadius: 15,
                            spreadRadius: 1,
                          ),
                        ], shape: BoxShape.circle),
                        child: ElevatedButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => development()));
                          },
                          child: Text(
                            '.',
                          ),
                          style: ElevatedButton.styleFrom(
                            shape: CircleBorder(),
                            primary: Colors.black,
                            fixedSize: Size(40, 40),
                          ),
                        ),
                      ),
                      Numbutton(
                          '/', Colors.grey.shade300, Colors.grey.shade900),
                    ])
              ],
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            _Calc('=');
          },
          child: Icon(Icons.arrow_forward_ios_rounded),
          backgroundColor: Colors.grey.shade900,
        ),
        floatingActionButtonLocation: FloatingActionButtonLocation.centerFloat,
      ),
    );
  }
}

class development extends StatelessWidget {
  const development({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('development'),
      ),
    );
  }
}
