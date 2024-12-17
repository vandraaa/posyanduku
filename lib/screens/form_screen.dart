import 'package:flutter/material.dart';
import 'package:prototype_posyandu/widgets/steps/step1.dart';
import 'package:prototype_posyandu/widgets/steps/step2.dart';
import 'package:prototype_posyandu/widgets/steps/step3.dart';

class FormScreen extends StatefulWidget {
  const FormScreen({super.key});

  @override
  State<FormScreen> createState() => _FormScreenState();
}

class _FormScreenState extends State<FormScreen> {
  int _currentStep = 0;

  Map<String, String> _step1Answers = {
    'question1': '',
    'question2': '',
    'question3': '',
    'question4': '',
    'question5': '',
    'question6': '',
  };

  Map<String, String> _step2Answers = {
    'question1': '',
    'question2': '',
    'question3': '',
    'question4': '',
    'question5': '',
  };

  void _updateStep1Answers(Map<String, String> answers) {
    setState(() {
      _step1Answers = answers;
    });
  }

  void _updateStep2Answers(Map<String, String> answers) {
    setState(() {
      _step2Answers = answers;
    });
  }

  List<Widget> get _stepsContent => [
    Step1(onUpdateAnswers: _updateStep1Answers, selectedAnswer: _step1Answers),
    Step2(onUpdateAnswers: _updateStep2Answers, selectedAnswer: _step2Answers),
    Step3(
      generalPercentage: _calculateStep1Percentage(),
      questionnairePercentage: _calculateStep2Percentage(),
    ),
  ];

  double _calculateStep1Percentage() {
    int totalQuestions = _step1Answers.length;
    int answeredQuestions = _step1Answers.values.where((answer) => answer.isNotEmpty).length;
    return answeredQuestions / totalQuestions;
  }

  double _calculateStep2Percentage() {
    int totalQuestions = _step2Answers.length;
    int answeredQuestions = _step2Answers.values.where((answer) => answer.isNotEmpty).length;
    return answeredQuestions / totalQuestions;
  }

  void _nextStep() {
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
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        title: const Text('Form Saved'),
        content: const Text('Your form has been saved successfully!'),
        actions: [
          TextButton(
            onPressed: () => Navigator.pop(context),
            child: const Text('OK'),
          ),
        ],
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
            Navigator.pushNamed(context, '/find-patient');
          },
        ),
      ),
      body: Padding(
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
                    _currentStep < _stepsContent.length - 1 ? 'Next' : 'Save',
                    style: const TextStyle(
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
