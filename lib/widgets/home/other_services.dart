import 'package:flutter/material.dart';
import 'package:prototype_posyandu/screens/target_data_screen.dart';

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
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => const TargetDataScreen(),
              ),
            );
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
