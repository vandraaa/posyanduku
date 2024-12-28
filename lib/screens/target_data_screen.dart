import 'package:flutter/material.dart';
import 'package:prototype_posyandu/screens/target_data_detail_screen.dart';
import 'package:prototype_posyandu/utilities/constants.dart';
import 'package:prototype_posyandu/data/patient_service_data.dart';
import 'package:prototype_posyandu/widgets/card/patient_card.dart';

class TargetDataScreen extends StatefulWidget {
  const TargetDataScreen({super.key});

  @override
  State<TargetDataScreen> createState() => _TargetDataScreenState();
}

class _TargetDataScreenState extends State<TargetDataScreen> {
  String activeCategory = 'Semua';
  List<dynamic> patients = [];
  List<dynamic> filteredPatients = [];
  bool isLoading = false;
  TextEditingController searchController = TextEditingController();

  void _fetchData(Sasaran sasaran) async {
    setState(() {
      isLoading = true;
    });
    try {
      final patientService = PatientServiceData();
      final fetchedData = await patientService.getPatientData(sasaran);
      setState(() {
        patients = fetchedData;
        filteredPatients = fetchedData;
        isLoading = false;
      });
    } catch (e) {
      setState(() {
        isLoading = false;
      });
    }
  }

  void _searchPatients(String query) {
    setState(() {
      filteredPatients = patients.where((patient) {
        final name = patient['nama'].toLowerCase();
        final nik = patient['nik'].toLowerCase();
        final searchQuery = query.toLowerCase();

        return name.contains(searchQuery) || nik.contains(searchQuery);
      }).toList();
    });
  }

  @override
  void initState() {
    super.initState();
    _fetchData(Sasaran.balita);

    searchController.addListener(() {
      _searchPatients(searchController.text);
    });
  }

  @override
  void dispose() {
    searchController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                const Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Cari Data Sasaran',
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w600,
                          fontSize: 20,
                        ),
                      ),
                      Text(
                        targetDataDesc,
                        style: TextStyle(
                          fontFamily: 'Poppins',
                          fontWeight: FontWeight.w400,
                          fontSize: 12,
                        ),
                      ),
                    ]),
                Image.asset(
                  'assets/images/vector/doctor.png',
                  width: 110,
                  height: 110,
                ),
              ],
            ),
            const SizedBox(height: 16),
            TextField(
              controller: searchController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                hintText: 'Cari data berdasarkan nama atau NIK.....',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30.0),
                  borderSide: const BorderSide(color: Colors.grey),
                ),
              ),
            ),
            const SizedBox(height: 20),
            const Text(
              'Kategori',
              style: TextStyle(
                fontFamily: 'Poppins',
                fontWeight: FontWeight.w600,
                fontSize: 14,
              ),
            ),
            const SizedBox(height: 8),
            SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _buildCategoryChip('Semua', Sasaran.semua),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Bayi & Balita', Sasaran.balita),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Remaja', Sasaran.remaja),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Dewasa & Lansia', Sasaran.dewasa),
                  const SizedBox(width: 8),
                  _buildCategoryChip('Ibu Hamil', Sasaran.hamil),
                ],
              ),
            ),
            const SizedBox(height: 16),
            if (isLoading)
              const Center(child: CircularProgressIndicator())
            else if (filteredPatients.isEmpty)
              const Center(
                  child: Text('Data tidak ditemukan',
                      style: TextStyle(
                          fontFamily: 'Poppins', fontWeight: FontWeight.w400)))
            else
              Expanded(
                child: ListView.builder(
                  itemCount: filteredPatients.length,
                  itemBuilder: (context, index) {
                    return PatientCard(
                      patient: filteredPatients[index],
                      isSelected: false,
                      onSelect: () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => TargetDataDetailScreen(
                              patient: {
                                'nik': filteredPatients[index]['nik'],
                                'nama': filteredPatients[index]['nama'],
                                'jenis_kelamin': filteredPatients[index]
                                    ['jenis_kelamin'],
                                'kategori': activeCategory,
                                'no_telp': '081234567890',
                              },
                            ),
                          ),
                        );
                      },
                    );
                  },
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildCategoryChip(String category, Sasaran sasaran) {
    final isActive = category == activeCategory;
    return GestureDetector(
      onTap: () {
        setState(() {
          activeCategory = category;
        });
        _fetchData(sasaran);
      },
      child: Chip(
        label: Text(
          category,
          style: TextStyle(
              color: isActive ? Colors.white : Colors.blueGrey,
              fontFamily: 'Poppins'),
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
}
