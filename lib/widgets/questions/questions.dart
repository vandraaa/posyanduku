import 'package:flutter/material.dart';

class QuestionWidget extends StatefulWidget {
  final String questionText;
  final bool isRadio;
  final List<String>? radioOptions;
  final String? selectedOption;
  final String? initialValue;
  final String? hintInputText;
  final void Function(String)? onOptionChanged;
  final void Function(String)? onTextChanged;

  const QuestionWidget({
    super.key,
    required this.questionText,
    this.isRadio = false,
    this.radioOptions,
    this.selectedOption,
    this.onOptionChanged,
    this.onTextChanged,
    this.initialValue,
    this.hintInputText = 'Masukkan jawaban',
  });

  @override
  _QuestionWidgetState createState() => _QuestionWidgetState();
}

class _QuestionWidgetState extends State<QuestionWidget> {
  late TextEditingController textController;

  @override
  void initState() {
    super.initState();
    textController = TextEditingController(text: widget.initialValue);
  }

  @override
  void dispose() {
    // Jangan lupa untuk membersihkan controller
    textController.dispose();
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
          if (!widget.isRadio) const SizedBox(height: 10),
          if (widget.isRadio && widget.radioOptions != null)
            SizedBox(
              width: double.infinity,
              child: Wrap(
                spacing: 10.0,
                children: widget.radioOptions!.map((option) {
                  return Row(
                    mainAxisSize: MainAxisSize.min,
                    children: [
                      Radio<String>(
                        value: option,
                        groupValue: widget.selectedOption,
                        onChanged: (value) {
                          if (widget.onOptionChanged != null && value != null) {
                            widget.onOptionChanged!(value);
                          }
                        },
                      ),
                      Text(option),
                    ],
                  );
                }).toList(),
              ),
            )
          else
            TextField(
              controller: textController,
              onChanged: (value) {
                if (widget.onTextChanged != null) {
                  widget.onTextChanged!(value);
                }
              },
              decoration: InputDecoration(
                border: const OutlineInputBorder(),
                hintText: widget.hintInputText,
              ),
              style: const TextStyle(
                fontSize: 13,
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
              ),
            ),
        ],
      ),
    );
  }
}
