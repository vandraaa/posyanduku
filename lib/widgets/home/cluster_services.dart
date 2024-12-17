import 'package:flutter/material.dart';
import 'package:prototype_posyandu/data/cluster_service_data.dart';

class ClusterServices extends StatelessWidget {
  const ClusterServices({super.key});

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          'Layanan Klaster',
          style: TextStyle(
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
        const SizedBox(height: 10),
        GridView.builder(
          shrinkWrap: true,
          physics: const NeverScrollableScrollPhysics(),
          gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
            crossAxisCount: 3,
            mainAxisSpacing: 16,
            crossAxisSpacing: 16,
            childAspectRatio: 3 / 4,
          ),
          itemCount: clusterServices.length,
          itemBuilder: (context, index) {
            final service = clusterServices[index];
            return GestureDetector(
              onTap: () {
                if (service.title == 'Dewasa & Lansia') {
                  Navigator.pushReplacementNamed(context, '/find-patient');
                }
              },
              child: Column(
                children: [
                  ClipRRect(
                    borderRadius: BorderRadius.circular(8),
                    child: Image.asset(
                      service.imagePath,
                      width: 120,
                      height: 120,
                      fit: BoxFit.cover,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Text(
                    service.title,
                    textAlign: TextAlign.center,
                    style: const TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 12.5,
                      fontWeight: FontWeight.w500,
                    ),
                  ),
                ],
            ));
          },
        ),
      ],
    );
  }
}
