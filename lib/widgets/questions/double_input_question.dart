import 'package:flutter/material.dart';

class DoubleInputQuestionWidget extends StatefulWidget {
  final String questionText;
  final String? hintInputTextLeft;
  final String? hintInputTextRight;
  final String? initialValueLeft;
  final String? initialValueRight;
  final TextInputType? keyboardTypeLeft;
  final TextInputType? keyboardTypeRight;
  final void Function(String)? onTextChangedLeft;
  final void Function(String)? onTextChangedRight;

  const DoubleInputQuestionWidget({
    super.key,
    required this.questionText,
    this.hintInputTextLeft = 'Masukkan jawaban',
    this.hintInputTextRight = 'Masukkan jawaban',
    this.initialValueLeft,
    this.initialValueRight,
    this.keyboardTypeLeft,
    this.keyboardTypeRight,
    this.onTextChangedLeft,
    this.onTextChangedRight,
  });

  @override
  _DoubleInputQuestionWidgetState createState() =>
      _DoubleInputQuestionWidgetState();
}

class _DoubleInputQuestionWidgetState extends State<DoubleInputQuestionWidget> {
  late TextEditingController leftController;
  late TextEditingController rightController;

  @override
  void initState() {
    super.initState();
    leftController = TextEditingController(text: widget.initialValueLeft);
    rightController = TextEditingController(text: widget.initialValueRight);
  }

  @override
  void dispose() {
    leftController.dispose();
    rightController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.questionText,
            style: const TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.w500,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                child: TextField(
                  controller: leftController,
                  onChanged: (value) {
                    if (widget.onTextChangedLeft != null) {
                      widget.onTextChangedLeft!(value);
                    }
                  },
                  keyboardType:
                      widget.keyboardTypeLeft ?? TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: widget.hintInputTextLeft,
                  ),
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
              const SizedBox(width: 10),
              Expanded(
                child: TextField(
                  controller: rightController,
                  onChanged: (value) {
                    if (widget.onTextChangedRight != null) {
                      widget.onTextChangedRight!(value);
                    }
                  },
                  keyboardType:
                      widget.keyboardTypeRight ?? TextInputType.number,
                  decoration: InputDecoration(
                    border: const OutlineInputBorder(),
                    hintText: widget.hintInputTextRight,
                  ),
                  style: const TextStyle(
                    fontSize: 13,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w400,
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
