import 'package:flutter/material.dart';

class OtherServices extends StatelessWidget {
  const OtherServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Layanan Lainnya',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        GestureDetector(
          onTap: () {
            Navigator.pushReplacementNamed(context, '/target-data');
          },
          child: ClipRRect(
            borderRadius: BorderRadius.circular(12),
            child: Image.asset(
              'assets/images/banner/data-sasaran.png',
              width: double.infinity,
              height: 150,
              fit: BoxFit.cover,
            ),
          ),
        ),
      ],
    );
  }
}
