import 'package:flutter/material.dart';

class ConnectionStatusBar extends StatelessWidget {
  final bool isOnline;
  final bool isChecked;

  const ConnectionStatusBar({
    super.key,
    required this.isOnline,
    required this.isChecked,
  });

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: MediaQuery.of(context).size.width,
      child: Container(
        color: isChecked ? (isOnline ? Colors.green : Colors.red) : Colors.grey,
        padding: const EdgeInsets.symmetric(vertical: 6),
        child: Center(
          child: Text(
            isChecked
                ? (isOnline ? 'Anda Sedang Online' : 'Anda Sedang Offline')
                : 'Memeriksa Koneksi...',
            style: const TextStyle(
              fontSize: 12.5,
              fontWeight: FontWeight.w500,
              color: Colors.white,
              fontFamily: 'Poppins',
            ),
          ),
        ),
      ),
    );
  }
}
