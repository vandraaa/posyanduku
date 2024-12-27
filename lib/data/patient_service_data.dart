import 'dart:convert';
import 'package:http/http.dart' as http;
import 'package:prototype_posyandu/utilities/constants.dart';

enum Sasaran { semua, dewasa, remaja, balita, hamil }

extension SasaranExtension on Sasaran {
  String get name {
    switch (this) {
      case Sasaran.semua:
        return 'dewasa';
      case Sasaran.dewasa:
        return 'dewasa';
      case Sasaran.remaja:
        return 'remaja';
      case Sasaran.balita:
        return 'balita';
      case Sasaran.hamil:
        return 'hamil';
    }
  }
}

class PatientServiceData {
  Future<dynamic> getPatientData(Sasaran sasaran) async {
    try {
      final url = Uri.parse('$baseUrlApi/sasaran?sasaran=${sasaran.name}');
      final headers = {
        'Content-Type': 'application/json',
        'Accept': 'application/json',
      };

      final response = await http.get(url, headers: headers);

      if (response.statusCode == 200) {
        return json.decode(response.body);
      } else {
        throw Exception('Failed to load data: ${response.statusCode}');
      }
    } catch (e) {
      print('Error fetching data for sasaran $sasaran: $e');
      throw e;
    }
  }
}
