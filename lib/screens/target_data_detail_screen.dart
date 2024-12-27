import 'package:flutter/material.dart';

class TargetDataDetailScreen extends StatefulWidget {
  final Map<String, dynamic> patient;

  const TargetDataDetailScreen({super.key, required this.patient});

  @override
  State<TargetDataDetailScreen> createState() => _TargetDataDetailScreenState();
}

class _TargetDataDetailScreenState extends State<TargetDataDetailScreen> {
  String activeTab = 'Biodata';

  @override
  Widget build(BuildContext context) {
    final patient = widget.patient;

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.white,
        elevation: 1,
        leading: IconButton(
          icon: const Icon(
            Icons.arrow_back_ios_new,
            color: Colors.black,
          ),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
        title: const Text(
          'Detail Data Sasaran',
          style: TextStyle(
            color: Colors.black,
            fontFamily: 'Poppins',
            fontWeight: FontWeight.w600,
            fontSize: 18,
          ),
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(50),
              child: Image.asset(
                patient['jenis_kelamin'] == 'L'
                    ? 'assets/images/vector/male.png'
                    : 'assets/images/vector/female.png',
                width: 100,
                height: 100,
                fit: BoxFit.cover,
              ),
            ),
            const SizedBox(height: 16),
            Text(
              patient['nama'],
              style: const TextStyle(
                fontWeight: FontWeight.bold,
                fontSize: 18,
                fontFamily: 'Poppins',
              ),
            ),
            const SizedBox(height: 4),
            Text(
              patient['kategori'] ?? 'Tidak ada kategori',
              style: const TextStyle(
                fontWeight: FontWeight.w500,
                fontSize: 14,
                fontFamily: 'Poppins',
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                _buildTabButton('Biodata'),
                const SizedBox(width: 8),
                _buildTabButton('Kartu Bantu Pemeriksaan'),
              ],
            ),
            const SizedBox(height: 16),
            Expanded(
              child: activeTab == 'Biodata' ? _buildBiodata(patient) : _buildKartuBantu(),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String tabName) {
    final isActive = activeTab == tabName;
    return GestureDetector(
      onTap: () {
        setState(() {
          activeTab = tabName;
        });
      },
      child: Chip(
        label: Text(
          tabName,
          style: TextStyle(
            color: isActive ? Colors.white : Colors.blueGrey,
            fontFamily: 'Poppins',
          ),
        ),
        backgroundColor: isActive ? Colors.blueGrey : Colors.transparent,
        shape: const StadiumBorder(
          side: BorderSide(
            color: Colors.blueGrey,
          ),
        ),
      ),
    );
  }

  Widget _buildBiodata(Map<String, dynamic> patient) {
    return ListView(
      children: [
        ListTile(
          leading: const Icon(Icons.person, color: Colors.blueGrey),
          title: const Text(
            'Nama',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          subtitle: Text(patient['nama']),
        ),
        ListTile(
          leading: const Icon(Icons.male, color: Colors.blueGrey),
          title: const Text(
            'Jenis Kelamin',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          subtitle: Text(patient['jenis_kelamin'] == 'L' ? 'Laki-laki' : 'Perempuan'),
        ),
        ListTile(
          leading: const Icon(Icons.phone, color: Colors.blueGrey),
          title: const Text(
            'No. Telepon',
            style: TextStyle(
              fontFamily: 'Poppins',
              fontWeight: FontWeight.w500,
              fontSize: 14,
            ),
          ),
          subtitle: Text(patient['no_telp'] ?? 'Tidak tersedia'),
        ),
      ],
    );
  }

  Widget _buildKartuBantu() {
    return const Center(
      child: Text(
        'Fitur Kartu Bantu Pemeriksaan belum tersedia.',
        style: TextStyle(
          fontFamily: 'Poppins',
          fontWeight: FontWeight.w500,
          fontSize: 14,
          color: Colors.grey,
        ),
        textAlign: TextAlign.center,
      ),
    );
  }
}
