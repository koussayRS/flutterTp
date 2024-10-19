import 'package:flutter/material.dart';

class QuizPage extends StatefulWidget {
  @override
  _QuizPageState createState() => _QuizPageState();
}

class _QuizPageState extends State<QuizPage> {
  List<Map<String, dynamic>> _questions = [];
  Map<int, String> _selectedAnswers = {};
  int res = 0;
  bool showScore = false;

  @override
  void initState() {
    super.initState();
    _loadQuizData();
  }

  void _loadQuizData() {
    _questions = [
      {
        'question': 'Quelle est la capitale de la France ?',
        'choices': ['Paris', 'Lyon', 'Marseille', 'Nice'],
        'response': 'Paris'
      },
      {
        'question': 'Combien fait 5 + 3 ?',
        'choices': ['5', '8', '10', '15'],
        'response': '8'
      },
      {
        'question': 'Qui a peint La Joconde ?',
        'choices': ['Leonard de Vinci', 'Picasso', 'Van Gogh', 'Monet'],
        'response': 'Leonard de Vinci'
      },
      {
        'question': 'Quelle est la planète la plus proche du Soleil ?',
        'choices': ['Vénus', 'Mars', 'Mercure', 'Jupiter'],
        'response': 'Mercure'
      },
      {
        'question':
            'Quel est le langage de programmation utilisé pour Flutter ?',
        'choices': ['Java', 'Python', 'Dart', 'Swift'],
        'response': 'Dart'
      },
    ];
  }

  void _checkResult() {
    res = 0;
    _selectedAnswers.forEach((index, answer) {
      if (answer == _questions[index]['response']) {
        res++;
      }
    });

    setState(() {
      showScore = true;
    });
  }

  void _resetQuiz() {
    setState(() {
      _selectedAnswers.clear();
      res = 0;
      showScore = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color.fromARGB(255, 69, 106, 177),
        title: const Text('Mon Quiz'),
      ),
      body: _questions.isEmpty
          ? Center(child: CircularProgressIndicator())
          : ListView.builder(
              itemCount: _questions.length,
              itemBuilder: (context, index) {
                final question = _questions[index];
                return Container(
                  margin: EdgeInsets.symmetric(vertical: 10, horizontal: 15),
                  child: Card(
                    elevation: 5,
                    child: Padding(
                      padding: const EdgeInsets.all(15.0),
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            question['question'],
                            style: TextStyle(
                              fontSize: 18,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          SizedBox(height: 10),
                          Column(
                            children: (question['choices'] as List<dynamic>)
                                .map<Widget>((choice) {
                              return RadioListTile<String>(
                                title: Text(choice),
                                value: choice,
                                groupValue: _selectedAnswers[index],
                                onChanged: showScore
                                    ? null
                                    : (value) {
                                        setState(() {
                                          _selectedAnswers[index] = value!;
                                        });
                                      },
                              );
                            }).toList(),
                          ),
                        ],
                      ),
                    ),
                  ),
                );
              },
            ),
      bottomNavigationBar: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisSize: MainAxisSize.min,
          children: [
            if (!showScore)
              ElevatedButton(
                child: Text('Afficher le Score'),
                onPressed: _checkResult,
              ),
            if (showScore)
              Column(
                children: [
                  Text(
                    'Votre score : $res/${_questions.length}',
                    style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
                  ),
                  SizedBox(height: 10),
                  ElevatedButton(
                    onPressed: _resetQuiz,
                    child: Text('Recommencer le Quiz'),
                  ),
                ],
              ),
            SizedBox(height: 10),
          ],
        ),
      ),
    );
  }
}
