import 'package:flutter/material.dart';
import 'package:prototype_posyandu/data/question_data.dart';
import 'package:prototype_posyandu/screens/preview_answer_screen.dart';
import 'package:prototype_posyandu/widgets/alert/validation_message.dart';
import 'package:prototype_posyandu/widgets/steps/step1.dart';
import 'package:prototype_posyandu/widgets/steps/step2.dart';
import 'package:prototype_posyandu/widgets/steps/step3.dart';
import 'package:prototype_posyandu/widgets/steps/step4.dart';

class FormScreen extends StatefulWidget {
  final Map<String, dynamic>? patientData;

  const FormScreen({super.key, required this.patientData});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  int _currentStep = 0;

  Map<String, String> _step1Answers = {};
  Map<String, String> _step3Answers = {};
  String _selectedCategory = '';

  bool _showValidationMessage = false;

  void _updateStep1Answers(Map<String, String> answers) {
    setState(() {
      _step1Answers = answers;
    });
  }

  void _updateStep3Answers(Map<String, String> answers) {
    setState(() {
      _step3Answers = answers;
    });
  }

  void _setCategory(String category) {
    setState(() {
      _selectedCategory = category;
      _showValidationMessage = false;
    });
  }

  List<Widget> get _stepsContent => [
        Step1(
          onUpdateAnswers: _updateStep1Answers,
          selectedAnswer: _step1Answers,
        ),
        Step2(
          selectedCategory: _selectedCategory,
          onCategorySelected: _setCategory,
        ),
        Step3(
          onUpdateAnswers: _updateStep3Answers,
          selectedAnswer: _step3Answers,
          selectedCategory: _selectedCategory,
        ),
        Step4(
          generalPercentage: _calculateStep1Percentage(),
          questionnairePercentage: _calculateStep2Percentage(),
        ),
      ];

  double _calculateStep1Percentage() {
    int totalQuestions = step1Questions.length + 1;
    int answeredQuestions =
        _step1Answers.values.where((answer) => answer.isNotEmpty).length;
    return totalQuestions == 0 ? 0.0 : answeredQuestions / totalQuestions;
  }

  double _calculateStep2Percentage() {
    int totalQuestions = questionsForCategory(_selectedCategory).length;
    int answeredQuestions =
        _step3Answers.values.where((answer) => answer.isNotEmpty).length;
    return totalQuestions == 0 ? 0.0 : answeredQuestions / totalQuestions;
  }

  void _nextStep() {
    if (_currentStep == 1 && _selectedCategory.isEmpty) {
      setState(() {
        _showValidationMessage = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _showValidationMessage = false;
        });
      });

      return;
    } else if (_currentStep == 3 &&
        (_calculateStep1Percentage() < 1.0 ||
            _calculateStep2Percentage() < 1.0)) {
      setState(() {
        _showValidationMessage = true;
      });

      Future.delayed(const Duration(seconds: 3), () {
        setState(() {
          _showValidationMessage = false;
        });
      });

      return;
    } else {
      setState(() {
        _showValidationMessage = false;
      });
    }

    if (_currentStep < _stepsContent.length - 1) {
      setState(() {
        _currentStep++;
      });
    } else {
      _saveForm();
    }
  }

  void _previousStep() {
    if (_currentStep > 0) {
      setState(() {
        _currentStep--;
      });
    }
  }

  void _saveForm() {
    Navigator.push(
      context,
      MaterialPageRoute(
        builder: (context) => PreviewScreen(
          patientData: widget.patientData,
          general: _step1Answers,
          questionnaireType: _selectedCategory,
          questionnaire: _step3Answers,
        ),
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
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.white,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Stack(
        children: [
          Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: List.generate(_stepsContent.length, (index) {
                    return Row(
                      children: [
                        CircleAvatar(
                          radius: 20,
                          backgroundColor: index <= _currentStep
                              ? Colors.blue
                              : Colors.grey[300],
                          child: Text(
                            '${index + 1}',
                            style: TextStyle(
                              color: index <= _currentStep
                                  ? Colors.white
                                  : Colors.black,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                        ),
                        if (index < _stepsContent.length - 1)
                          Container(
                            width: 40,
                            height: 4,
                            color: index < _currentStep
                                ? Colors.blue
                                : Colors.grey[300],
                          ),
                      ],
                    );
                  }),
                ),
                const SizedBox(height: 16),
                Expanded(
                  child: _stepsContent[_currentStep],
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.end,
                  children: [
                    ElevatedButton(
                      onPressed: _currentStep > 0 ? _previousStep : null,
                      style: ElevatedButton.styleFrom(
                        backgroundColor:
                            _currentStep > 0 ? Colors.blue : Colors.grey,
                      ),
                      child: const Text(
                        'Back',
                        style: TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                    const SizedBox(width: 16),
                    ElevatedButton(
                      onPressed: _nextStep,
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Colors.blue,
                      ),
                      child: Text(
                        _currentStep < _stepsContent.length - 1
                            ? 'Next'
                            : 'Save',
                        style: const TextStyle(
                          color: Colors.white,
                          fontFamily: 'Poppins',
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ),
          if (_showValidationMessage)
            Positioned(
              left: 25,
              right: 25,
              bottom: 100,
              child: ValidationMessage(
                message: _currentStep == 1
                    ? 'Silahkan pilih kategori kuisioner terlebih dahulu.'
                    : 'Isi semua pertanyaan sebelum melanjutkan.',
              ),
            ),
        ],
      ),
    );
  }
}
