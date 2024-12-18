import 'package:flutter/material.dart';
import 'package:prototype_posyandu/data/question_data.dart';

class Step2 extends StatefulWidget {
  final String? selectedCategory;
  final Function(String) onCategorySelected;

  const Step2({
    super.key,
    required this.selectedCategory,
    required this.onCategorySelected,
  });

  @override
  State<Step2> createState() => _Step2State();
}

class _Step2State extends State<Step2> {
  late Map<String, String> answersStep2;
  String? selectedCategoryKey;

  @override
  void initState() {
    super.initState();
  }

  void selectCategory(String key) {
    setState(() {
      selectedCategoryKey = key;
    });
    widget.onCategorySelected(key);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              children: questionnareOptions.map((option) {
                return _buildCategoryCard(
                  option['key']!,
                  option['title']!,
                  option['description']!,
                );
              }).toList(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryCard(String key, String title, String description) {
    bool isSelected = widget.selectedCategory == key;
    return Container(
      margin: const EdgeInsets.symmetric(vertical: 8.0, horizontal: 16.0),
      decoration: BoxDecoration(
        border: isSelected
            ? Border.all(color: Colors.blue, width: 2)
            : Border.all(color: Colors.transparent, width: 2),
        borderRadius: BorderRadius.circular(8.0),
      ),
      child: Card(
        elevation: 0.0,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 20.0),
          child: ListTile(
            title: Text(
              title,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 16,
              ),
            ),
            subtitle: Text(
              description,
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w400,
                fontSize: 13,
              ),
            ),
            onTap: () => selectCategory(key),
            splashColor: Colors.transparent,
            hoverColor: Colors.transparent,
          ),
        ),
      ),
    );
  }
}
