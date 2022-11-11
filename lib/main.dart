import 'package:flutter/material.dart';
import 'dart:async';
import 'dart:math';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Halloween Whack-a-Mole',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Halloween Whack-a-Mole'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  int _points = 0;
  double _time = 0;
  Timer? timer;
  bool _gameStarted = false;
  String _gameStatus = "Start Game";
  String _gameResult = "";
  bool _treat = false;
  List<bool> showHide = [];

  void initializeShowHide() {
    for (int i = 0; i < 15; i++) {
      showHide.add(false);
    }
  }

  void setShowHide() {
    for (int i = 0; i < 15; i++) {
      showHide[i] = (Random().nextDouble() < 0.5);
    }
  }

  void _startGame() {
    if (!_gameStarted) {
      _gameStarted = true;
      _gameStatus = "Game Running";
      _gameResult = "";
      _treat = false;

      timer = Timer.periodic(Duration(milliseconds: 500), (timer) {
        setState(() {
          _time += 0.5;
          setShowHide();
        });
        if (_time > 14.5) {
          _gameResult =
              "You Lost the Game!! You got only $_points points. No candy for you.";
          _gameStatus = "Restart Game";
          _gameStarted = false;
          _time = 0;
          _points = 0;
          timer.cancel();
        }
        if (_points > 9) {
          _gameResult =
              "You Won the Game!! You got $_points points. Here is your Candies => ";
          _gameStatus = "Restart Game";
          _gameStarted = false;
          _time = 0;
          _points = 0;
          _treat = true;
          timer.cancel();
        }
      });
    }
  }

  @override
  void initState() {
    super.initState();
    initializeShowHide();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("Time passed: $_time seconds   <>  Your points: $_points"),
      ),
      body: Center(
        //Column Layout
        child: Column(children: <Widget>[
          Row(
            children: [
              Container(
                padding: const EdgeInsets.fromLTRB(30, 20, 0, 10),
                child: Text(_gameResult),
              ),
              Visibility(
                visible: _treat,
                child: Image.asset(
                  'candy.png',
                  width: 100,
                ),
              ),
            ],
          ),
          Row(children: [
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[0]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[0],
                    child: Image.asset(
                      'pic4.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[1]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[1],
                    child: Image.asset(
                      'pic1.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[2]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[2],
                    child: Image.asset(
                      'pic3.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[3]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[3],
                    child: Image.asset(
                      'pic2.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[4]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[4],
                    child: Image.asset(
                      'pic4.png',
                      width: 80,
                    )),
              ),
            ),
          ]),
          Row(children: [
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[5]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[5],
                    child: Image.asset(
                      'pic1.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[6]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[6],
                    child: Image.asset(
                      'pic4.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[7]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[7],
                    child: Image.asset(
                      'pic2.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[8]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[8],
                    child: Image.asset(
                      'pic3.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[9]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[9],
                    child: Image.asset(
                      'pic4.png',
                      width: 80,
                    )),
              ),
            ),
          ]),
          Row(children: [
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[10]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[10],
                    child: Image.asset(
                      'pic3.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[11]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[11],
                    child: Image.asset(
                      'pic2.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[12]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[12],
                    child: Image.asset(
                      'pic1.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[13]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[13],
                    child: Image.asset(
                      'pic3.png',
                      width: 80,
                    )),
              ),
            ),
            Container(
              width: 80,
              height: 80,
              padding: EdgeInsets.all(4),
              child: GestureDetector(
                onTap: () {
                  if (showHide[14]) {
                    setState(() {
                      if (_gameStatus == "Game Running") _points++;
                    });
                  }
                },
                child: Visibility(
                    visible: showHide[14],
                    child: Image.asset(
                      'pic1.png',
                      width: 80,
                    )),
              ),
            ),
          ]),
        ]),
      ),
      floatingActionButton: ElevatedButton(
        onPressed: _startGame,
        child: Text(_gameStatus),
      ), // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}
