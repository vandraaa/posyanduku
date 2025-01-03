import 'package:flutter/material.dart';
import 'package:prototype_posyandu/data/question_data.dart';
import 'package:prototype_posyandu/screens/bluetooth_print_screen.dart';
import 'package:prototype_posyandu/widgets/card/patient_card.dart';
import 'package:prototype_posyandu/widgets/questions/question_answer.dart';

class PreviewScreen extends StatelessWidget {
  final Map<String, dynamic>? patientData;
  final Map<String, String> general;
  final String questionnaireType;
  final Map<String, String> questionnaire;

  const PreviewScreen({
    Key? key,
    required this.patientData,
    required this.general,
    required this.questionnaireType,
    required this.questionnaire,
  }) : super(key: key);

  Widget buildQuestionAnswer(String questionText, String answer) {
    return Padding(
      padding: const EdgeInsets.only(bottom: 15.0),
      child: QuestionAnswerWidget(
        question: questionText,
        answer: answer,
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.blueAccent,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const Text(
                  'Informasi Pasien',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 10),
                SizedBox(
                  width: double.infinity,
                  child: PatientCard(
                    patient: patientData ?? {},
                    isSelected: false,
                    onSelect: () {},
                  ),
                ),
                const SizedBox(height: 20),
                const Text(
                  'Umum',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 15),
                ...List.generate(
                  5,
                  (index) => buildQuestionAnswer(
                    "${index + 1}. ${step1Questions[index]['questionText']}",
                    general['question${index + 1}'].toString(),
                  ),
                ),
                const SizedBox(height: 30),
                Text(
                  'Kuisioner ($questionnaireType)',
                  style: const TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    fontFamily: 'Poppins',
                  ),
                ),
                const SizedBox(height: 15),
                ...List.generate(
                  3,
                  (index) => buildQuestionAnswer(
                    "${index + 1}. ${questionsForCategory(questionnaireType)[index]['questionText']}",
                    questionnaire['question${index + 1}'].toString(),
                  ),
                ),
                const SizedBox(height: 80),
              ],
            ),
          ),
          Positioned(
            bottom: 20,
            left: 16,
            right: 16,
            child: ElevatedButton.icon(
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => const BluetoothPrintScreen(),
                  ),
                );
              },
              icon: const Icon(
                Icons.print,
                color: Colors.white,
                size: 24,
              ),
              label: const Text(
                'Print',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'Poppins',
                ),
              ),
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.blueAccent,
                padding: const EdgeInsets.symmetric(vertical: 16),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(8),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
