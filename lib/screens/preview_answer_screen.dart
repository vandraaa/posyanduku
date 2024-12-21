import 'package:flutter/material.dart';

class PreviewAnswerScreen extends StatelessWidget {
  final Map<String, String> step1Answers;
  final Map<String, String> step3Answers;
  final int id;
  final String nik;
  final String nama;
  final String alamat;
  final String jenisKelamin;

  // Daftar pertanyaan untuk Step 1 dan Step 3
  final List<String> step1Questions = [
    'Question 1',
    'Question 2',
    'Question 3',
  ];

  final List<String> questionnareOptions = [
    'ppok',
    'tbc',
    'gangguan-jiwa',
  ];

   PreviewAnswerScreen({
    Key? key,
    required this.step1Answers,
    required this.step3Answers,
    required this.id,
    required this.nik,
    required this.nama,
    required this.alamat,
    required this.jenisKelamin,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Preview Answer"),
        titleTextStyle: const TextStyle(color: Colors.white),
        backgroundColor: Colors.blueAccent,
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios_new, color: Colors.white),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            // Display user details from API response
            Card(
              margin: const EdgeInsets.only(bottom: 16),
              elevation: 4,
              child: Padding(
                padding: const EdgeInsets.all(16.0),
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      'User Information',
                      style: TextStyle(
                        fontSize: 25,
                        fontWeight: FontWeight.bold,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text('ID: $id', style: TextStyle(fontStyle: FontStyle.italic),),
                    Text('NIK: $nik', style: TextStyle(fontStyle: FontStyle.italic),),
                    Text('Name: $nama', style: TextStyle(fontStyle: FontStyle.italic),),
                    Text('Address: $alamat', style: TextStyle(fontStyle: FontStyle.italic),),
                    Text('Gender: $jenisKelamin', style: TextStyle(fontStyle: FontStyle.italic),),
                  ],
                ),
              ),
            ),
            // Display Step 1 answers
            Text(
              'U',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ...step1Questions.map((question) {
              return Text('$question: ${step1Answers[question] ?? step1Answers}');
            }).toList(),
            const SizedBox(height: 16),
            // Display Step 3 answers
            Text(
              'Kuisioner',
              style: Theme.of(context).textTheme.titleLarge,
            ),
            ...questionnareOptions.map((question) {
              return Text('$question: ${step3Answers[question] ?? step3Answers}');
            }).toList(),
            const SizedBox(height: 16),
          ],
        ),
      ),
    );
  }
}