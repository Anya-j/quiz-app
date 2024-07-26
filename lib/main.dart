import 'package:flutter/material.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: QuizApp(),
      debugShowCheckedModeBanner: false,
    );
  }
}

class QuizApp extends StatefulWidget {
  const QuizApp({super.key});

  @override
  State createState() => _QuizApp();
}

class singlequestionformat {
  final String? questions;
  final List<String>? options;
  final int? answer;

  const singlequestionformat({this.questions, this.answer, this.options});
}

class _QuizApp extends State {
  bool questionPage = true;
  int questionNo = 0;
  int ansNo = -1;
  int score = 0;

  MaterialStateProperty<Color?> isanswercorrect(int selectedindex) {
    if (ansNo != -1) {
      if (selectedindex == questions[questionNo].answer) {
        return const MaterialStatePropertyAll(Colors.green);
      } else if (selectedindex == ansNo) {
        return const MaterialStatePropertyAll(Colors.red);
      } else {
        return const MaterialStatePropertyAll(null);
      }
    } else {
      return const MaterialStatePropertyAll(null);
    }
  }

  void checkpageisvalide() {
    if (ansNo == -1) {
      return;
    }
    if (ansNo == questions[questionNo].answer) {
      score++;
    }
    if (ansNo != -1) {
      if (questionNo == questions.length - 1) {
        questionPage = false;
        setState(() {});
      }
      setState(() {
        ansNo = -1;
        questionNo++;
      });
    }
  }

  List questions = [
    const singlequestionformat(
        questions:
            " Which programming language is primarily used in Flutter development? ",
        options: ["C#", "Dart", "Kotlin", "Java"],
        answer: 1),
    const singlequestionformat(
        questions: "What does 'setState' do in Flutter?",
        options: [
          "Defines initial state",
          "Creates widget instances",
          "Updates state,rebuild",
          "Contains source code"
        ],
        answer: 2),
    const singlequestionformat(
        questions: "What does 'Hot Reload' do in Flutter development?",
        options: [
          "Compiles code",
          "Debugging",
          "Warmup the device",
          "Refreshes app layout"
        ],
        answer: 3),
    const singlequestionformat(
        questions:
            " Which widget in Flutter is commonly used for creating a list of scrollable elements?",
        options: ["Listview", "Container", "Text", "Gridview"],
        answer: 0),
    const singlequestionformat(
        questions: "What is the role of the 'Navigator' in Flutter?",
        options: [
          "Controls layouts",
          "Manages states",
          "Handles navigation",
          "Defines theme"
        ],
        answer: 2),
  ];

  Scaffold isQuestionScreen() {
    if (questionPage == true) {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 201, 237),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        body: Column(
          children: [
            const SizedBox(
              height: 25,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text(
                  "Questions : ",
                  style: TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
                Text(
                  "${questionNo + 1}/${questions.length}",
                  style: const TextStyle(
                    fontSize: 25,
                    fontWeight: FontWeight.w600,
                  ),
                ),
              ],
            ),
            const SizedBox(
              height: 50,
            ),
            Container(
              margin: const EdgeInsets.only(left: 20),
              width: 380,
              child: Text(
                questions[questionNo].questions,
                style: const TextStyle(
                  fontSize: 23,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 0;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(0)),
                  child: Text("1.  ${questions[questionNo].options[0]}",
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 1;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(1)),
                  child: Text("2.  ${questions[questionNo].options[1]}",
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 2;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(2)),
                  child: Text("3.  ${questions[questionNo].options[2]}",
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ))),
            ),
            const SizedBox(
              height: 30,
            ),
            SizedBox(
              height: 30,
              width: 300,
              child: ElevatedButton(
                  onPressed: () {
                    if (ansNo == -1) {
                      setState(() {
                        ansNo = 3;
                      });
                    }
                  },
                  style: ButtonStyle(backgroundColor: isanswercorrect(3)),
                  child: Text("4.  ${questions[questionNo].options[3]}",
                      style: const TextStyle(
                        fontSize: 23,
                        fontWeight: FontWeight.w400,
                      ))),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: checkpageisvalide,
          backgroundColor: Colors.black,
          splashColor: Colors.black,
          child: const Icon(
            Icons.forward,
            color: Colors.white,
          ),
        ),
      );
    } else {
      return Scaffold(
        backgroundColor: Color.fromARGB(255, 231, 201, 237),
        appBar: AppBar(
          centerTitle: true,
          backgroundColor: Colors.black,
          title: const Text(
            "QuizApp",
            style: TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w800,
              color: Colors.white,
            ),
          ),
        ),
        body: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Column(
              children: [
                const SizedBox(
                  height: 30,
                ),
                Image.network(
                  "https://media2.giphy.com/media/ZhvduEq5hWKYsmhRAJ/giphy.gif",
                  height: 200,
                  width: 250,
                ),
                const SizedBox(
                  height: 25,
                ),
                Image.network(
                  "https://t4.ftcdn.net/jpg/06/63/81/81/360_F_663818119_2xPzENWYc2Oqws2ZFjoKW2yBLgPOtOAz.jpg",
                  height: 200,
                ),
                const Text(
                  "You Have Successfully Completed The Quiz.",
                  style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                      fontStyle: FontStyle.italic),
                ),
                const SizedBox(
                  height: 20,
                ),
                Text(
                  "Your Score: $score/${questions.length}",
                  style: const TextStyle(
                      fontSize: 20, fontWeight: FontWeight.w600),
                ),
                const SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    backgroundColor: Colors.red,
                  ),
                  onPressed: () {
                    setState(() {
                      ansNo = -1;
                      questionNo = 0;
                      questionPage = true;
                      score = 0;
                    });
                  },
                  child: const Text(
                    "CHALLENGE AGAIN!!",
                    style: TextStyle(
                      color: Colors.black,
                    ),
                  ),
                )
              ],
            ),
          ],
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return isQuestionScreen();
  }
}
