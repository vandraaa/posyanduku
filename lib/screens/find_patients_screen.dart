import 'package:flutter/material.dart';
import 'package:prototype_posyandu/data/patient_service_data.dart';
import 'package:prototype_posyandu/screens/form_screen.dart';
import 'package:prototype_posyandu/widgets/patient/patient_card.dart';

class FindPatientsScreen extends StatefulWidget {
  const FindPatientsScreen({super.key});

  @override
  State<FindPatientsScreen> createState() => _FindPatientsScreenState();
}

class _FindPatientsScreenState extends State<FindPatientsScreen> {
  int _selectedTabIndex = 0;
  final TextEditingController _searchController = TextEditingController();
  final PatientServiceData _service = PatientServiceData();
  List<dynamic> _patients = [];
  List<dynamic> _filteredPatients = [];
  bool _isLoading = false;
  String? _errorMessage;
  Map<String, dynamic>? selectedPatient;

  @override
  void initState() {
    super.initState();
    _fetchPatients();

    _searchController.addListener(_filterPatients);
  }

  Future<void> _fetchPatients() async {
    setState(() {
      _isLoading = true;
      _errorMessage = null;
    });
    try {
      final data = await _service.getPatientData(Sasaran.dewasa);
      setState(() {
        _patients = data;
        _filteredPatients = data;
      });
    } catch (e) {
      setState(() {
        _errorMessage = 'Gagal mengambil data pasien.';
      });
    } finally {
      setState(() {
        _isLoading = false;
      });
    }
  }

  void _filterPatients() {
    final query = _searchController.text.toLowerCase();
    if (query.isEmpty) {
      setState(() {
        _filteredPatients = _patients;
      });
    } else {
      setState(() {
        _filteredPatients = _patients.where((patient) {
          final value = _selectedTabIndex == 0
              ? patient['nikk'].toString()
              : patient['nama'].toString().toLowerCase();
          return value.contains(query);
        }).toList();
      });
    }
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
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                _buildTabButton('NIK', 0),
                _buildTabButton('Nama', 1),
              ],
            ),
            const SizedBox(height: 20),
            Text('Cari ${_selectedTabIndex == 0 ? 'NIK' : 'Nama'}',
                style: const TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 24,
                    fontWeight: FontWeight.w600)),
            Text(
              _selectedTabIndex == 0
                  ? 'Masukkan NIK untuk mencari data pasien'
                  : 'Masukkan Nama lengkap pasien untuk pencarian',
              style: const TextStyle(
                fontFamily: 'Poppins',
                fontSize: 14,
                fontWeight: FontWeight.w400,
                color: Colors.grey,
              ),
            ),
            const SizedBox(height: 16),
            TextField(
              controller: _searchController,
              decoration: InputDecoration(
                hintStyle: const TextStyle(
                  fontFamily: 'Poppins',
                  fontWeight: FontWeight.w400,
                  fontSize: 12,
                ),
                hintText: _selectedTabIndex == 0
                    ? 'Cari berdasarkan NIK'
                    : 'Cari berdasarkan Nama',
                prefixIcon: const Icon(Icons.search),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(30),
                ),
              ),
              keyboardType: _selectedTabIndex == 0
                  ? TextInputType.number
                  : TextInputType.text,
            ),
            const SizedBox(height: 16),
            if (_isLoading)
              const Center(
                  child: Column(
                children: [
                  SizedBox(height: 30),
                  CircularProgressIndicator(),
                  SizedBox(height: 16),
                  Text(
                    'Mengambil data pasien...',
                    style: TextStyle(
                      fontFamily: 'Poppins',
                      fontSize: 16,
                      fontWeight: FontWeight.w400,
                      color: Colors.grey,
                    ),
                  ),
                ],
              ))
            else if (_errorMessage != null)
              Center(
                child: Text(
                  _errorMessage!,
                  style: const TextStyle(color: Colors.red),
                ),
              )
            else
              Expanded(
                child: _filteredPatients.isEmpty
                    ? const Center(
                        child: Text(
                          'Data pasien tidak ditemukan.',
                          style: TextStyle(
                            fontFamily: 'Poppins',
                            fontSize: 16,
                            fontWeight: FontWeight.w400,
                            color: Colors.grey,
                          ),
                        ),
                      )
                    : ListView.builder(
                        itemCount: _filteredPatients.length,
                        itemBuilder: (context, index) {
                          final patient = _filteredPatients[index];
                          return PatientCard(
                            patient: patient,
                            isSelected: selectedPatient?['nik'] ==
                                patient['nik'].toString(),
                            onSelect: () {
                              setState(() {
                                selectedPatient = patient;
                              });
                            },
                          );
                        },
                      ),
              ),
            const SizedBox(height: 16),
            if (!_isLoading)
              ElevatedButton(
                onPressed: selectedPatient != null
                    ? () {
                        Navigator.push(
                          context,
                          MaterialPageRoute(
                            builder: (context) => FormScreen(
                              patientData: selectedPatient,
                            ),
                          ),
                        );
                      }
                    : null,
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  padding: const EdgeInsets.symmetric(vertical: 16),
                  shape: RoundedRectangleBorder(
                    borderRadius: BorderRadius.circular(12),
                  ),
                ),
                child: const Text(
                  'Next',
                  style: TextStyle(
                    color: Colors.white,
                    fontFamily: 'Poppins',
                    fontWeight: FontWeight.w500,
                    fontSize: 18,
                  ),
                ),
              ),
          ],
        ),
      ),
    );
  }

  Widget _buildTabButton(String title, int index) {
    return GestureDetector(
      onTap: () {
        setState(() {
          _selectedTabIndex = index;
          _searchController.clear();
          _filterPatients();
        });
      },
      child: Column(
        children: [
          Text(
            title,
            style: TextStyle(
              fontSize: 16,
              fontWeight: FontWeight.bold,
              color:
                  _selectedTabIndex == index ? Colors.blueAccent : Colors.grey,
              fontFamily: 'Poppins',
            ),
          ),
          const SizedBox(height: 5),
          Container(
            height: 2,
            width: 50,
            color: _selectedTabIndex == index
                ? Colors.blueAccent
                : Colors.transparent,
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _searchController.removeListener(_filterPatients);
    _searchController.dispose();
    super.dispose();
  }
}
