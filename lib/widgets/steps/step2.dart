import 'package:flutter/material.dart';
import 'package:prototype_posyandu/utilities/constants.dart';
import 'package:prototype_posyandu/widgets/questions/questions.dart';

class Step2 extends StatefulWidget {
  final Function(Map<String, String>) onUpdateAnswers;
  final Map<String, String> selectedAnswer;

  const Step2({super.key, required this.onUpdateAnswers, required this.selectedAnswer});

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  late Map<String, String> answersStep2;
  String? selectedCategory;

  @override
  void initState() {
    super.initState();
    answersStep2 = Map.from(widget.selectedAnswer);
  }

  void updateAnswer(String questionKey, String value) {
    setState(() {
      answersStep2[questionKey] = value;
    });
    widget.onUpdateAnswers(answersStep2); 
  }

  void selectCategory(String category) {
    setState(() {
      selectedCategory = category;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            if (selectedCategory == null)
              Column(
                children: [
                  _buildCategoryCard(questionnareType1, descQuestionnareType1),
                  _buildCategoryCard(questionnareType2, descQuestionnareType2),
                  _buildCategoryCard(questionnareType3, descQuestionnareType3),
                ],
              )
            else
              Column(
                children: [
                  QuestionWidget(
                    questionText: 'Kuisioner 1 untuk Dewasa/Lansia \n(Ya/Tidak)',
                    isRadio: true,
                    radioOptions: const ['Ya', 'Tidak'],
                    selectedOption: answersStep2['question1'],
                    onOptionChanged: (selected) => updateAnswer('question1', selected),
                  ),
                  QuestionWidget(
                    questionText: 'Kuisioner 2 untuk Dewasa/Lansia \n(Ya/Tidak)',
                    isRadio: true,
                    radioOptions: const ['Ya', 'Tidak'],
                    selectedOption: answersStep2['question2'],
                    onOptionChanged: (selected) => updateAnswer('question2', selected),
                  ),
                  QuestionWidget(
                    questionText: 'Kuisioner 3 untuk Dewasa/Lansia \n(Ya/Tidak)',
                    isRadio: true,
                    radioOptions: const ['Ya', 'Tidak'],
                    selectedOption: answersStep2['question3'],
                    onOptionChanged: (selected) => updateAnswer('question3', selected),
                  ),
                  QuestionWidget(
                    questionText: 'Kuisioner 4 untuk Dewasa/Lansia \n(Ya/Tidak)',
                    isRadio: true,
                    radioOptions: const ['Ya', 'Tidak'],
                    selectedOption: answersStep2['question4'],
                    onOptionChanged: (selected) => updateAnswer('question4', selected),
                  ),
                  QuestionWidget(
                    questionText: 'Kuisioner 5 untuk Dewasa/Lansia \n(Ya/Tidak)',
                    isRadio: true,
                    radioOptions: const ['Ya', 'Tidak'],
                    selectedOption: answersStep2['question5'],
                    onOptionChanged: (selected) => updateAnswer('question5', selected),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String title, String description) {
    return Card(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      child: Padding(
        padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
        child: ListTile(
        title: Text(title, style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w600,
          fontSize: 16,
        )),
        subtitle: Text(description, style: const TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w400,
          fontSize: 13,
        )),
        onTap: () => selectCategory(title),
      ),
      ) 
    );
  }
}
