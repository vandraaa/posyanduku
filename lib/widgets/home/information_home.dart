import 'package:flutter/material.dart';

class InformationHome extends StatelessWidget {
  const InformationHome({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Row(
          children: [
            const Icon(
              Icons.local_hospital,
              color: Colors.black,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              'Puskesmas Purwosari, Surakarta',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
        const SizedBox(height: 5),
        Row(
          children: [
            const Icon(
              Icons.calendar_today,
              color: Colors.black,
              size: 18,
            ),
            const SizedBox(width: 8),
            Text(
              '11 Desember 2024',
              style: TextStyle(
                fontSize: 13,
                fontWeight: FontWeight.w500,
                fontFamily: 'Poppins',
                color: Colors.grey[800],
              ),
            ),
          ],
        ),
      ],
    );
  }
}
