import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart' show debugPaintSizeEnabled;

void main() {
  debugPaintSizeEnabled = false; // Remove to suppress visual layout
  runApp(MyApp());
}

BoxDecoration myBoxDecoration() {
  return BoxDecoration(
    border: Border.all(color: Colors.black54),
    borderRadius: BorderRadius.circular(10),
  );
}

BoxDecoration simleDecoration() {
  return BoxDecoration(
    border: Border.all(color: Colors.black54),
  );
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Home(),
    );
  }
}

//Main class
class Main extends StatefulWidget {
  @override
  _MainState createState() => new _MainState();
}

class _MainState extends State<Main> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '問題１',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('問題１'),
        ),
        // Change to buildColumn() for the other column example
        body: Center(child: buildColumn()),
      ),
    );
  }

  int index = 0;
  // #enddocregion Row
  Widget buildColumn() =>
      // #docregion Column
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildRowHeader(), buildRowBody()],
      );
  // #enddocregion Column
  Widget buildRowHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            margin: const EdgeInsets.all(5.0),
            color: Colors.amber.shade50,
            width: 60.0,
            height: 60.0,
            child: Image.asset("images/1.jpg")),
        Container(
            margin: const EdgeInsets.all(15.0),
            decoration: myBoxDecoration(),
            width: 260.0,
            height: 60.0,
            child: buildRowRunning()),
      ],
    );
  }
  // #enddocregion Row

  Widget buildRowRunning() =>
      // #docregion Row
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (index == 0)
            Container(
                width: 60.0,
                height: 60.0,
                child: Image.asset("images/user.jpg")),
          if (index == 1)
            Container(
                width: 60.0,
                margin: const EdgeInsets.only(left: 47.5),
                height: 60.0,
                child: Image.asset("images/user.jpg")),
          if (index == 2)
            Container(
                width: 60.0,
                margin: const EdgeInsets.only(left: 95.0),
                height: 60.0,
                child: Image.asset("images/user.jpg")),
          if (index == 3)
            Container(
                width: 60.0,
                margin: const EdgeInsets.only(left: 142.5),
                height: 60.0,
                child: Image.asset("images/user.jpg")),
          if (index == 4)
            Container(
                width: 60.0,
                margin: const EdgeInsets.only(left: 190.0),
                height: 60.0,
                child: Image.asset("images/user.jpg")),
        ],
      );

  Widget buildRowBody() =>
      // #docregion Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.all(5.0),
            decoration: myBoxDecoration(),
            width: 220.0,
            height: 400.0,
            child: buildColumnKanji(),
          ),
          Container(
              margin: const EdgeInsets.all(5.0),
              decoration: myBoxDecoration(),
              width: 100.0,
              height: 400.0,
              child: buildColumnMenu()),
        ],
      );
  // #enddocregion Row

  Widget buildColumnKanji() =>
      // #docregion Row
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Text("一かくめはどっち？"),
          buildContainerKanji(),
          buildContainerChoose()
        ],
      );

  Widget buildContainerKanji() => Container(
        margin: const EdgeInsets.all(5.0),
        decoration: myBoxDecoration(),
        width: 160.0,
        height: 160.0,
        child: Container(
          margin: const EdgeInsets.all(15.0),
          width: 160.0,
          height: 160.0,
          child: Image.asset(
            '$imgurl',
          ),
        ),
      );

  Widget buildContainerChoose() =>
      // #docregion Column
      Container(
        margin: const EdgeInsets.all(5.0),
        decoration: myBoxDecoration(),
        width: 200.0,
        height: 60.0,
        child: buildRowChoose(),
      );

  Widget buildRowChoose() =>
      // #docregion Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [aBtn(), bBtn()],
      );

  Widget buildColumnMenu() =>
      // #docregion Row
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [buildContainerBtn(), buildContainerScore()],
      );

  Widget buildContainerBtn() =>
      // #docregion Column
      Container(
        margin: const EdgeInsets.all(5.0),
        width: 100.0,
        height: 100.0,
        child: buildColumnBtn(),
      );

  Widget buildColumnBtn() =>
      // #docregion Row
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [topBtn(), mapBtn()],
      );

  Widget buildContainerScore() =>
      // #docregion Column
      Container(
        margin: const EdgeInsets.all(5.0),
        decoration: myBoxDecoration(),
        width: 100.0,
        height: 100.0,
        child: Text('Score:'),
      );

  Widget topBtn() => ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        },
        child: const Text('Topに戻る'),
      );
  Widget mapBtn() => ElevatedButton(
        onPressed: () {},
        child: const Text('Map選択'),
      );

  Widget aBtn() => ElevatedButton(
        onPressed: _onClicked,
        child: const Text('A'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.black),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))),
      );
  Widget bBtn() => ElevatedButton(
        onPressed: _onClicked,
        child: const Text('B'),
        style: ButtonStyle(
            backgroundColor: MaterialStateProperty.all(Colors.red),
            textStyle: MaterialStateProperty.all(TextStyle(fontSize: 16))),
      );

  var _myImageArray = [
    'images/kanji1.jpg',
    'images/kanji2.jpg',
    'images/kanji3.jpg',
    'images/kanji4.jpg',
    'images/kanji5.jpg',
  ];

  String imgurl = 'images/kanji1.jpg';

  void _onClicked() {
    setState(() {
      imgurl = _myImageArray[index];
      index++;
      if (index == _myImageArray.length) {
        index = 0;
      }
    });
  }
}

////scree2
class Home extends StatefulWidget {
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  int cnt = 1;

  Widget buildColumnMenu() =>
      // #docregion Row
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          FlatButton(
              color: Colors.teal,
              textColor: Colors.white,
              onPressed: () {
                Navigator.of(context)
                    .push(MaterialPageRoute(builder: (context) => Main()));
              },
              child: Text('問題１')),
          Container(
            margin: const EdgeInsets.all(5.0),
            width: 100.0,
            height: 20.0,
          ),
          FlatButton(
            color: Colors.teal,
            textColor: Colors.white,
            onPressed: () {
              Navigator.of(context)
                  .push(MaterialPageRoute(builder: (context) => Screen2()));
            },
            child: Text('問題２'),
          ),
        ],
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home'),
      ),
      body: Center(
        child: buildColumnMenu(),
      ),
    );
  }
}

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: '問題２',
      home: Scaffold(
        appBar: AppBar(
          title: const Text('問題２'),
        ),
        // Change to buildColumn() for the other column example
        body: Center(child: buildColumn()),
      ),
    );
  }

  int index = 0;
  // #enddocregion Row
  Widget buildColumn() =>
      // #docregion Column
      Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [buildRowHeader(), buildRowBody()],
      );
  // #enddocregion Column
  Widget buildRowHeader() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        Container(
            margin: const EdgeInsets.all(5.0),
            color: Colors.amber.shade50,
            width: 60.0,
            height: 60.0,
            child: Image.asset("images/1.jpg")),
        Container(
            margin: const EdgeInsets.all(15.0),
            decoration: myBoxDecoration(),
            width: 260.0,
            height: 60.0,
            child: buildRowRunning()),
      ],
    );
  }
  // #enddocregion Row

  Widget buildRowRunning() =>
      // #docregion Row
      Row(
        mainAxisAlignment: MainAxisAlignment.start,
        children: [
          if (index == 0)
            Container(
                width: 60.0,
                height: 60.0,
                child: Image.asset("images/user.jpg")),
          if (index == 1)
            Container(
                width: 60.0,
                margin: const EdgeInsets.only(left: 47.5),
                height: 60.0,
                child: Image.asset("images/user.jpg")),
          if (index == 2)
            Container(
                width: 60.0,
                margin: const EdgeInsets.only(left: 95.0),
                height: 60.0,
                child: Image.asset("images/user.jpg")),
          if (index == 3)
            Container(
                width: 60.0,
                margin: const EdgeInsets.only(left: 142.5),
                height: 60.0,
                child: Image.asset("images/user.jpg")),
          if (index == 4)
            Container(
                width: 60.0,
                margin: const EdgeInsets.only(left: 190.0),
                height: 60.0,
                child: Image.asset("images/user.jpg")),
        ],
      );

  Widget buildRowBody() =>
      // #docregion Row
      Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          Container(
            margin: const EdgeInsets.all(5.0),
            decoration: myBoxDecoration(),
            width: 220.0,
            height: 400.0,
            child: buildColumnKanji(),
          ),
          Container(
              margin: const EdgeInsets.all(5.0),
              decoration: myBoxDecoration(),
              width: 100.0,
              height: 400.0,
              child: buildColumnMenu()),
        ],
      );
  // #enddocregion Row

  Widget buildColumnKanji() =>
      // #docregion Row
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [Text("女の人ひめいが聞こえた"), buildColumnPuzzle()],
      );

  String dropImgUrl1 = "images/empty.jpg";
  String dropImgUrl2 = "images/empty.jpg";
  String dropImgUrl3 = "images/empty.jpg";
  String dropImgUrl4 = "images/empty.jpg";
  String dropImgUrl5 = "images/empty.jpg";
  String dropImgUrl6 = "images/empty.jpg";
  String dropImgUrl7 = "images/empty.jpg";
  String dropImgUrl8 = "images/empty.jpg";

  bool _isPart1Dropped = false;
  bool _isPart2Dropped = false;
  bool _isPart3Dropped = false;
  bool _isPart4Dropped = false;

  Widget buildColumnPuzzle() => Container(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
                margin: const EdgeInsets.all(5.0),
                width: 200.0,
                height: 100.0,
                child: Stack(children: [
                  Positioned(
                    top: 0,
                    left: 0,
                    child: DragTarget<String>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: simleDecoration(),
                          child: Image.asset('$dropImgUrl1'),
                        );
                      },
                      onAccept: (data) {
                        setState(() {
                          dropImgUrl1 = data;
                          if (data == 'images/part1.jpg') {
                            _isPart1Dropped = true;
                          }
                          if (data == 'images/part2.jpg') {
                            _isPart2Dropped = true;
                          }
                          if (data == 'images/part3.jpg') {
                            _isPart3Dropped = true;
                          }
                          if (data == 'images/part4.jpg') {
                            _isPart4Dropped = true;
                          }
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 50,
                    child: DragTarget<String>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: simleDecoration(),
                          child: Image.asset('$dropImgUrl2'),
                        );
                      },
                      onAccept: (data) {
                        setState(() {
                          dropImgUrl2 = data;
                          if (data == 'images/part1.jpg') {
                            _isPart1Dropped = true;
                          }
                          if (data == 'images/part2.jpg') {
                            _isPart2Dropped = true;
                          }
                          if (data == 'images/part3.jpg') {
                            _isPart3Dropped = true;
                          }
                          if (data == 'images/part4.jpg') {
                            _isPart4Dropped = true;
                          }
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 100,
                    child: DragTarget<String>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: simleDecoration(),
                          child: Image.asset('$dropImgUrl3'),
                        );
                      },
                      onAccept: (data) {
                        setState(() {
                          dropImgUrl3 = data;
                          if (data == 'images/part1.jpg') {
                            _isPart1Dropped = true;
                          }
                          if (data == 'images/part2.jpg') {
                            _isPart2Dropped = true;
                          }
                          if (data == 'images/part3.jpg') {
                            _isPart3Dropped = true;
                          }
                          if (data == 'images/part4.jpg') {
                            _isPart4Dropped = true;
                          }
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 0,
                    left: 150,
                    child: DragTarget<String>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: simleDecoration(),
                          child: Image.asset('$dropImgUrl4'),
                        );
                      },
                      onAccept: (data) {
                        setState(() {
                          dropImgUrl4 = data;
                          if (data == 'images/part1.jpg') {
                            _isPart1Dropped = true;
                          }
                          if (data == 'images/part2.jpg') {
                            _isPart2Dropped = true;
                          }
                          if (data == 'images/part3.jpg') {
                            _isPart3Dropped = true;
                          }
                          if (data == 'images/part4.jpg') {
                            _isPart4Dropped = true;
                          }
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 0,
                    child: DragTarget<String>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: simleDecoration(),
                          child: Image.asset('$dropImgUrl5'),
                        );
                      },
                      onAccept: (data) {
                        setState(() {
                          dropImgUrl5 = data;
                          if (data == 'images/part1.jpg') {
                            _isPart1Dropped = true;
                          }
                          if (data == 'images/part2.jpg') {
                            _isPart2Dropped = true;
                          }
                          if (data == 'images/part3.jpg') {
                            _isPart3Dropped = true;
                          }
                          if (data == 'images/part4.jpg') {
                            _isPart4Dropped = true;
                          }
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 50,
                    child: DragTarget<String>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: simleDecoration(),
                          child: Image.asset('$dropImgUrl6'),
                        );
                      },
                      onAccept: (data) {
                        setState(() {
                          dropImgUrl6 = data;
                          if (data == 'images/part1.jpg') {
                            _isPart1Dropped = true;
                          }
                          if (data == 'images/part2.jpg') {
                            _isPart2Dropped = true;
                          }
                          if (data == 'images/part3.jpg') {
                            _isPart3Dropped = true;
                          }
                          if (data == 'images/part4.jpg') {
                            _isPart4Dropped = true;
                          }
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 100,
                    child: DragTarget<String>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: simleDecoration(),
                          child: Image.asset('$dropImgUrl7'),
                        );
                      },
                      onAccept: (data) {
                        setState(() {
                          dropImgUrl7 = data;
                          if (data == 'images/part1.jpg') {
                            _isPart1Dropped = true;
                          }
                          if (data == 'images/part2.jpg') {
                            _isPart2Dropped = true;
                          }
                          if (data == 'images/part3.jpg') {
                            _isPart3Dropped = true;
                          }
                          if (data == 'images/part4.jpg') {
                            _isPart4Dropped = true;
                          }
                        });
                      },
                    ),
                  ),
                  Positioned(
                    top: 50,
                    left: 150,
                    child: DragTarget<String>(
                      builder: (
                        BuildContext context,
                        List<dynamic> accepted,
                        List<dynamic> rejected,
                      ) {
                        return Container(
                          height: 50,
                          width: 50,
                          decoration: simleDecoration(),
                          child: Image.asset('$dropImgUrl8'),
                        );
                      },
                      onAccept: (data) {
                        setState(() {
                          dropImgUrl8 = data;
                          if (data == 'images/part1.jpg') {
                            _isPart1Dropped = true;
                          }
                          if (data == 'images/part2.jpg') {
                            _isPart2Dropped = true;
                          }
                          if (data == 'images/part3.jpg') {
                            _isPart3Dropped = true;
                          }
                          if (data == 'images/part4.jpg') {
                            _isPart4Dropped = true;
                          }
                        });
                      },
                    ),
                  ),
                ])),
            Container(
              margin: const EdgeInsets.all(5.0),
              decoration: myBoxDecoration(),
              width: 250.0,
              height: 70.0,
              child: Row(
                children: [
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    width: 50.0,
                    height: 50.0,
                    child: Visibility(
                      visible: !_isPart1Dropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'images/part1.jpg',
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset('images/part1.jpg'),
                          ),
                        ),
                        feedback: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset('images/part1.jpg'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    width: 50.0,
                    height: 50.0,
                    child: Visibility(
                      visible: !_isPart2Dropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'images/part2.jpg',
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset('images/part2.jpg'),
                          ),
                        ),
                        feedback: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset('images/part2.jpg'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    width: 50.0,
                    height: 50.0,
                    child: Visibility(
                      visible: !_isPart3Dropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'images/part3.jpg',
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset('images/part3.jpg'),
                          ),
                        ),
                        feedback: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset('images/part3.jpg'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                  ),
                  Container(
                    margin: const EdgeInsets.all(0.0),
                    width: 50.0,
                    height: 50.0,
                    child: Visibility(
                      visible: !_isPart4Dropped,
                      child: Draggable<String>(
                        // Data is the value this Draggable stores.
                        data: 'images/part4.jpg',
                        child: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset('images/part4.jpg'),
                          ),
                        ),
                        feedback: Container(
                          height: 50.0,
                          width: 50.0,
                          child: Center(
                            child: Image.asset('images/part4.jpg'),
                          ),
                        ),
                        childWhenDragging: Container(),
                      ),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      );

  Widget buildColumnMenu() =>
      // #docregion Row
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [buildContainerBtn(), buildContainerScore()],
      );

  Widget buildContainerBtn() =>
      // #docregion Column
      Container(
        margin: const EdgeInsets.all(5.0),
        width: 100.0,
        height: 100.0,
        child: buildColumnBtn(),
      );

  Widget buildColumnBtn() =>
      // #docregion Row
      Column(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [topBtn(), mapBtn()],
      );

  Widget buildContainerScore() =>
      // #docregion Column
      Container(
        margin: const EdgeInsets.all(5.0),
        decoration: myBoxDecoration(),
        width: 100.0,
        height: 100.0,
        child: Text('Score:'),
      );

  Widget topBtn() => ElevatedButton(
        onPressed: () {
          Navigator.of(context)
              .push(MaterialPageRoute(builder: (context) => Home()));
        },
        child: const Text('Topに戻る'),
      );
  Widget mapBtn() => ElevatedButton(
        onPressed: () {},
        child: const Text('Map選択'),
      );
}

///screen2
