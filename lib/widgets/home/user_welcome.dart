import 'package:flutter/material.dart';

class UserWelcome extends StatelessWidget {
  const UserWelcome({super.key});

  @override
  Widget build(BuildContext context) {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Selamat Datang,',
                  style: TextStyle(
                    fontSize: 12,
                    fontWeight: FontWeight.normal,
                    color: Colors.grey,
                    fontFamily: 'Poppins',
                  ),
                ),
                Text(
                  'Kevin Andra Nugroho',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                    color: Colors.black,
                    fontFamily: 'Poppins',
                  ),
                ),
              ],
            ),
            Icon(
              Icons.notifications,
              color: Colors.black,
              size: 30,
            ),
          ],
        ),
      ],
    );
  }
}
