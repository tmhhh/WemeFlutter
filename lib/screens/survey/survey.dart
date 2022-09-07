import 'package:flutter/material.dart';
import 'package:flutter_app/screens/survey/finish.dart';
import 'package:flutter_app/widgets/index.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:page_transition/page_transition.dart';
import 'dart:convert';
import 'package:http/http.dart' as http;

import '../../models/question.dart';

class SurveyPage extends StatefulWidget {
  static const routeName = '/survey';

  const SurveyPage({Key? key}) : super(key: key);

  @override
  State<SurveyPage> createState() => _SurveyPageState();
}

enum SelectionOptions { True, False }

class _SurveyPageState extends State<SurveyPage> {
  final List<Question> _questions = [];
  int _currentQuestion = 0;
  String? radioButtonValue;
  final scaffoldKey = GlobalKey<ScaffoldState>();
  SelectionOptions? _character =SelectionOptions.True;

  Future<void> getQuestion() async {
    final url = Uri.parse(
        'https://x8ki-letl-twmt.n7.xano.io/api:wsasEJLt/form-with-question-survey?formId=7cc33dcd-783b-401d-9cb8-a043c52a481a');

    var response = await http.get(url);
    var jsonResponse = json.decode(response.body);
    var questionResponse = jsonResponse['report']['questions'];
    questionResponse.forEach((e) {
      _questions.add(Question(e['id'], e['title'], e['type']));
    });
    setState(() {
      _currentQuestion = 0;
    });
  }

  @override
  void initState() {
    super.initState();
    getQuestion();
  }

  Question get currentQuestion {
    return _questions[_currentQuestion];
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      key: scaffoldKey,
      backgroundColor: Theme.of(context).cardColor,
      body: SafeArea(
        child: GestureDetector(
          onTap: () => FocusScope.of(context).unfocus(),
          child: Container(
            width: double.infinity,
            height: double.infinity,
            decoration: BoxDecoration(
              color: Theme.of(context).secondaryHeaderColor,
            ),
            child: Column(
              mainAxisSize: MainAxisSize.max,
              children: [
                SurveyHeaderWidget(
                  quizNumber: _currentQuestion + 1,
                  totalQuiz: _questions.length,
                ),
                Expanded(
                  flex: 1,
                  child: Center(
                    widthFactor: double.infinity,
                    heightFactor: double.infinity,
                    child:_questions.isEmpty ? CircularProgressIndicator(): Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: Text(
                         currentQuestion.title,
                        style:
                            TextStyle(fontSize: 28, fontWeight: FontWeight.w500),
                        textAlign: TextAlign.center,
                      ),
                    ),
                  ),
                ),
                Container(
                  child: Column(
                    children: <Widget>[
                      ListTile(
                        title: const Text('True'),
                        leading: Radio<SelectionOptions>(
                          value: SelectionOptions.True,
                          groupValue: _character,
                          onChanged: (SelectionOptions? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                      ListTile(
                        title: const Text('False'),
                        leading: Radio<SelectionOptions>(
                          value: SelectionOptions.False,
                          groupValue: _character,
                          onChanged: (SelectionOptions? value) {
                            setState(() {
                              _character = value;
                            });
                          },
                        ),
                      ),
                    ],
                  ),
                ),
                Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: TextButton(
                          onPressed: () {
                            if (_currentQuestion > 0) {
                              setState(() {
                                _currentQuestion -= 1;
                              });
                            }
                          },
                          child: Text('Prev'),
                        ),
                      ),
                    ),
                    Expanded(
                      child: Padding(
                        padding: EdgeInsets.fromLTRB(10, 0, 10, 0),
                        child: ElevatedButton(
                          onPressed: () async {
                            if (_currentQuestion < _questions.length -1) {
                              setState(() {
                                _currentQuestion += 1;
                              });
                            } else {
                              await Navigator.push(
                                context,
                                PageTransition(
                                  type: PageTransitionType.rightToLeft,
                                  duration: Duration(milliseconds: 500),
                                  reverseDuration: Duration(milliseconds: 500),
                                  child: EndSurveyPage(),
                                ),
                              );
                            }
                          },
                          child: Text('Next'),
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
