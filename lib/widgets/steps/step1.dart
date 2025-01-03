import 'package:flutter/material.dart';
import 'package:prototype_posyandu/widgets/questions/questions.dart';
import 'package:prototype_posyandu/widgets/questions/double_input_question.dart';
import 'package:prototype_posyandu/data/question_data.dart';

class Step1 extends StatefulWidget {
  final Function(Map<String, String>) onUpdateAnswers;
  final Map<String, String> selectedAnswer;

  const Step1(
      {super.key, required this.onUpdateAnswers, required this.selectedAnswer});

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
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionWidget(
                  questionText: step1Questions[0]['questionText']!,
                  hintInputText: step1Questions[0]['hintInputText'],
                  isRadio: step1Questions[0]['isRadio'],
                  keyboardType: step1Questions[0]['keyboardType'],
                  initialValue: answersStep1[step1Questions[0]['key']] ?? '',
                  onTextChanged: step1Questions[0]['isRadio'] == false
                      ? (value) => updateAnswer(step1Questions[0]['key'], value)
                      : null,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Pada pemeriksaan sebelumnya 68kg',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                QuestionWidget(
                  questionText: step1Questions[1]['questionText']!,
                  hintInputText: step1Questions[1]['hintInputText'],
                  isRadio: step1Questions[1]['isRadio'],
                  keyboardType: step1Questions[1]['keyboardType'],
                  initialValue: answersStep1[step1Questions[1]['key']] ?? '',
                  onTextChanged: step1Questions[1]['isRadio'] == false
                      ? (value) => updateAnswer(step1Questions[1]['key'], value)
                      : null,
                ),
                const Padding(
                  padding: EdgeInsets.symmetric(horizontal: 8.0),
                  child: Text(
                    'Pada pemeriksaan sebelumnya 170cm',
                    style: TextStyle(
                      color: Colors.red,
                      fontSize: 12,
                      fontFamily: 'Poppins',
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 8),
            ...step1Questions.skip(2).take(1).map((question) => QuestionWidget(
                  questionText: question['questionText']!,
                  hintInputText: question['hintInputText'],
                  isRadio: question['isRadio'],
                  keyboardType: question['keyboardType'],
                  initialValue: answersStep1[question['key']] ?? '',
                  onTextChanged: question['isRadio'] == false
                      ? (value) => updateAnswer(question['key'], value)
                      : null,
                )),
            const SizedBox(height: 8),

            DoubleInputQuestionWidget(
              questionText: step1Questions[3]['questionText']!,
              hintInputTextLeft: "Sistole",
              hintInputTextRight: "Diastole",
              initialValueLeft: answersStep1[step1Questions[3]['key']]?.split('/')[0] ?? '',
              initialValueRight: answersStep1[step1Questions[3]['key']]?.split('/')[1] ?? '',
              onTextChangedLeft: (value) {
                final rightValue = answersStep1[step1Questions[3]['key']]?.split('/')[1] ?? '';
                updateAnswer(step1Questions[3]['key'], "$value/$rightValue");
              },
              onTextChangedRight: (value) {
                final leftValue = answersStep1[step1Questions[3]['key']]?.split('/')[0] ?? '';
                updateAnswer(step1Questions[3]['key'], "$leftValue/$value");
              },
            ),
            const SizedBox(height: 8),
            ...step1Questions.skip(4).map((question) => QuestionWidget(
                  questionText: question['questionText']!,
                  hintInputText: question['hintInputText'],
                  isRadio: question['isRadio'],
                  keyboardType: question['keyboardType'],
                  initialValue: answersStep1[question['key']] ?? '',
                  onTextChanged: question['isRadio'] == false
                      ? (value) => updateAnswer(question['key'], value)
                      : null,
                )),
          ],
        ),
      ),
    );
  }
}
