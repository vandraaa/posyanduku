import 'package:flutter/material.dart';

class PatientCard extends StatelessWidget {
  final Map<String, dynamic> patient;
  final bool isSelected;
  final VoidCallback onSelect;

  const PatientCard({
    super.key,
    required this.patient,
    required this.isSelected,
    required this.onSelect,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onSelect,
      child: Container(
        margin: const EdgeInsets.symmetric(vertical: 8),
        padding: const EdgeInsets.all(12),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(12),
          border: Border.all(
            color: isSelected ? Colors.blue : Colors.transparent,
            width: 2,
          ),
          color: Colors.white,
          boxShadow: [
            BoxShadow(
              color: Colors.grey.withOpacity(0.2),
              blurRadius: 5,
              offset: const Offset(0, 3),
            ),
          ],
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text(
              patient['nama'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 16,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            Text('NIK: ${patient['nik']}'),
            Text('Alamat: ${patient['alamat']}'),
            const SizedBox(height: 4),
            Text(
              patient['jenis_kelamin'] == 'L' ? 'Laki-laki' : 'Perempuan',
              style: const TextStyle(fontSize: 14, color: Colors.grey),
            ),
          ],
        ),
      ),
    );
  }
}
