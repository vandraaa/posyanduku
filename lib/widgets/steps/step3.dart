import 'package:flutter/material.dart';
import 'package:prototype_posyandu/data/question_data.dart';
import 'package:prototype_posyandu/widgets/questions/questions.dart';

class Step3 extends StatefulWidget {
  final Function(Map<String, String>) onUpdateAnswers;
  final Map<String, String> selectedAnswer;
  final String selectedCategory;

  const Step3({
    super.key,
    required this.onUpdateAnswers,
    required this.selectedAnswer,
    required this.selectedCategory,
  });

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  late Map<String, String> answersStep3;

  @override
  void initState() {
    super.initState();
    answersStep3 = Map.from(widget.selectedAnswer);
  }

  void updateAnswer(String questionKey, String value) {
    setState(() {
      answersStep3[questionKey] = value;
    });
    widget.onUpdateAnswers(answersStep3);
  }

  @override
  Widget build(BuildContext context) {
    List<Map<String, dynamic>> categoryQuestions = questionsForCategory(widget.selectedCategory);

    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: categoryQuestions.map((question) {
            return QuestionWidget(
              questionText: question['questionText']!,
              isRadio: true,
              radioOptions: List<String>.from(question['options'] ?? ['Ya', 'Tidak']),
              selectedOption: answersStep3[question['key']],
              onOptionChanged: (selected) => updateAnswer(question['key']!, selected),
            );
          }).toList(),
        ),
      ),
    );
  }
}
