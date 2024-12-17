import 'package:flutter/material.dart';

class Step3 extends StatefulWidget {
  final double generalPercentage;
  final double questionnairePercentage;

  const Step3({super.key, required this.generalPercentage, required this.questionnairePercentage});

  @override
  State<Step3> createState() => _Step3State();
}

class _Step3State extends State<Step3> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              Image.asset(
                'assets/images/vector/question-concept.jpeg',
                width: 250,
              ),
              const SizedBox(height: 20),
              const Text(
                'Apakah Anda yakin akan menyimpan data ini?',
                style: TextStyle(
                  fontSize: 18,
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 30),
              Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Umum',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${(widget.generalPercentage * 100.0).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: widget.generalPercentage,
                    backgroundColor: Colors.grey[300],
                    color: Colors.blue,
                    minHeight: 8,
                  ),
                  const SizedBox(height: 20),
                  Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        const Text(
                          'Kuisioner',
                          style: TextStyle(
                            fontSize: 16,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        ),
                        Text(
                          '${(widget.questionnairePercentage * 100.0).toStringAsFixed(1)}%',
                          style: const TextStyle(
                            fontSize: 13,
                            fontFamily: 'Poppins',
                            fontWeight: FontWeight.w600,
                          ),
                        )
                      ]),
                  const SizedBox(height: 5),
                  LinearProgressIndicator(
                    value: widget.questionnairePercentage,
                    backgroundColor: Colors.grey[300],
                    color: Colors.green,
                    minHeight: 8,
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
