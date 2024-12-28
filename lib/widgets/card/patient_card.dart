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
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    patient['nama'],
                    style: const TextStyle(
                      fontWeight: FontWeight.bold,
                      fontSize: 15,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Text(
                    '${patient['nik']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  Text(
                    'Alamat: ${patient['alamat']}',
                    style: const TextStyle(
                      fontWeight: FontWeight.w500,
                      fontSize: 12.5,
                      fontFamily: 'Poppins',
                    ),
                  ),
                  const SizedBox(height: 4),
                  Row(
                    children: [
                      Icon(
                        patient['jenis_kelamin'] == 'L'
                            ? Icons.male
                            : Icons.female,
                        color: patient['jenis_kelamin'] == 'L'
                            ? Colors.blue
                            : Colors.pink,
                        size: 16,
                      ),
                      const SizedBox(width: 2),
                      Text(
                        patient['jenis_kelamin'] == 'L'
                            ? 'Laki-laki'
                            : 'Perempuan',
                        style: TextStyle(
                          fontSize: 13,
                          color: patient['jenis_kelamin'] == 'L' ? Colors.blue : Colors.pink,
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w500,
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),
            ClipRRect(
              borderRadius: BorderRadius.circular(8),
              child: Image.asset(
                patient['jenis_kelamin'] == 'L'
                    ? 'assets/images/vector/male.png'
                    : 'assets/images/vector/female.png',
                width: 80,
                height: 80,
                fit: BoxFit.cover,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
