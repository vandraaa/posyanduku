import 'package:flutter/material.dart';
import 'package:prototype_posyandu/widgets/questions/questions.dart';
import 'package:prototype_posyandu/data/question_data.dart';

class Step1 extends StatefulWidget {
  final Function(Map<String, String>) onUpdateAnswers;
  final Map<String, String> selectedAnswer;

  const Step1({super.key, required this.onUpdateAnswers, required this.selectedAnswer});

  @override
  State<Step1> createState() => _Step1State();
}

class _Step1State extends State<Step1> {
  late Map<String, String> answersStep1;

  @override
  void initState() {
    super.initState();
    answersStep1 = Map.from(widget.selectedAnswer);
  }

  void updateAnswer(String questionKey, String value) {
    setState(() {
      answersStep1[questionKey] = value;
    });
    widget.onUpdateAnswers(answersStep1);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            ...step1Questions.map((question) => QuestionWidget(
                  questionText: question['questionText']!,
                  hintInputText: question['hintInputText'],
                  isRadio: question['isRadio'],
                  keyboardType: question['keyboardType'],
                  initialValue: answersStep1[question['key']] ?? '',
                  onTextChanged: question['isRadio'] == false
                      ? (value) => updateAnswer(question['key'], value)
                      : null,
                )),
            QuestionWidget(
              questionText: step1RadioQuestion['questionText']!,
              isRadio: step1RadioQuestion['isRadio'],
              radioOptions: step1RadioQuestion['radioOptions'],
              selectedOption: answersStep1[step1RadioQuestion['key']],
              onOptionChanged: (selected) => updateAnswer(step1RadioQuestion['key'], selected),
            ),
          ],
        ),
      ),
    );
  }
}
