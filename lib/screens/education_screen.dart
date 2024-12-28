import 'package:flutter/material.dart';
import 'package:prototype_posyandu/data/education_data.dart';
import 'package:prototype_posyandu/widgets/card/education_card.dart';

class EducationScreen extends StatefulWidget {
  const EducationScreen({super.key});

  @override
  State<EducationScreen> createState() => _EducationScreenState();
}

class _EducationScreenState extends State<EducationScreen> {
  final TextEditingController _searchController = TextEditingController();
  List<Map<String, String>> _filteredData = educationData;

  @override
  void initState() {
    super.initState();
    _searchController.addListener(_filterEducationData);
  }

  void _filterEducationData() {
    final query = _searchController.text.toLowerCase();
    setState(() {
      _filteredData = educationData
          .where((data) => data['title']!.toLowerCase().contains(query))
          .toList();
    });
  }

  @override
  void dispose() {
    _searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'Materi Edukasi',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w500,
            fontSize: 18.0,
          ),
        ),
        centerTitle: true,
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintText: 'Masukkan Judul Edukasi',
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontSize: 14.0,
                  fontWeight: FontWeight.w400,
                  color: Colors.grey,
                ),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                  borderSide: const BorderSide(),
                ),
                contentPadding:
                    const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                prefixIcon: const Icon(
                  Icons.search,
                  color: Colors.grey,
                ),
              ),
            ),
            const SizedBox(height: 16),
            Expanded(
              child: _filteredData.isNotEmpty
                  ? GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        crossAxisSpacing: 16,
                        childAspectRatio: 16 / 14,
                      ),
                      itemCount: _filteredData.length,
                      itemBuilder: (context, index) {
                        final data = _filteredData[index];
                        return EducationCard(
                          title: data['title']!,
                          image: data['image']!,
                        ); 
                      },
                    )
                  : const Center(
                      child: Text(
                        'Konten tidak ditemukan',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontSize: 16.0,
                          fontWeight: FontWeight.w500,
                          color: Colors.grey,
                        ),
                      ),
                    ),
            ),
          ],
        ),
      ),
    );
  }
}
