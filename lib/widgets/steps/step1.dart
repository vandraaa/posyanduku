import 'package:flutter/material.dart';
import 'package:prototype_posyandu/utilities/constants.dart';
import 'package:prototype_posyandu/widgets/questions/questions.dart';

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
            QuestionWidget(
              questionText: step1Question1Text,
              hintInputText: step1HintQuestion1,
              isRadio: false,
              initialValue: answersStep1['question1'] ?? '',
              onTextChanged: (value) => updateAnswer('question1', value),
            ),
            QuestionWidget(
              questionText: step1Question2Text,
              hintInputText: step1HintQuestion2,
              isRadio: false,
              initialValue: answersStep1['question2'] ?? '',
              onTextChanged: (value) => updateAnswer('question2', value),
            ),
            QuestionWidget(
              questionText: step1Question3Text,
              hintInputText: step1HintQuestion3,
              isRadio: false,
              initialValue: answersStep1['question3'] ?? '',
              onTextChanged: (value) => updateAnswer('question3', value),
            ),
            QuestionWidget(
              questionText: step1Question4Text,
              hintInputText: step1HintQuestion4,
              isRadio: false,
              initialValue: answersStep1['question4'] ?? '',
              onTextChanged: (value) => updateAnswer('question4', value),
            ),
            QuestionWidget(
              questionText: step1Question5Text,
              hintInputText: step1HintQuestion5,
              isRadio: false,
              initialValue: answersStep1['question5'] ?? '',
              onTextChanged: (value) => updateAnswer('question5', value),
            ),
            QuestionWidget(
              questionText: step1Question6Text,
              isRadio: true,
              radioOptions: step1Question6Options,
              selectedOption: answersStep1['question6'],
              onOptionChanged: (selected) => updateAnswer('question6', selected),
            ),
          ],
        ),
      ),
    );
  }
}
