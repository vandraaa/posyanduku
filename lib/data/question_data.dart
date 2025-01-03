import 'package:flutter/material.dart';

const List<Map<String, dynamic>> step1Questions = [
  {
    'questionText': 'Berat badan (kg)',
    'hintInputText': 'Masukkan berat badan (kg)',
    'key': 'question1',
    'isRadio': false,
    'keyboardType': TextInputType.number,
  },
  {
    'questionText': 'Tinggi badan (cm)',
    'hintInputText': 'Masukkan tinggi badan (cm)',
    'key': 'question2',
    'isRadio': false,
    'keyboardType': TextInputType.number,
  },
  {
    'questionText': 'Usia',
    'hintInputText': 'Masukkan usia',
    'key': 'question3',
    'isRadio': false,
    'keyboardType': TextInputType.number,
  },
  {
    'questionText': 'Tekanan darah (mmHg)',
    'hintInputText': 'Masukkan tekanan darah (mmHg)',
    'key': 'question4',
    'isRadio': false,
    'keyboardType': TextInputType.number,
  },
  {
    'questionText': 'Gula darah (mmHg)',
    'hintInputText': 'Masukkan gula darah (mmHg)',
    'key': 'question5',
    'isRadio': false,
    'keyboardType': TextInputType.number,
  },
];

// option step 2
const List<Map<String, String>> questionnareOptions = [
  {
    'key': 'ppok',
    'title': 'Kuisioner PPOK',
    'description':
        'Mendeteksi gejala dan risiko PPOK seperti batuk kronis dan sesak napas.',
  },
  {
    'key': 'tbc',
    'title': 'Skrining Gejala TBC',
    'description':
        'Identifikasi gejala awal TBC seperti batuk lama dan penurunan berat badan.',
  },
  {
    'key': 'gangguan-jiwa',
    'title': 'Pemeriksaan Gangguan Jiwa',
    'description':
        'Menilai gejala stres, depresi, dan kecemasan untuk kesehatan mental.',
  },
];

// question for category
List<Map<String, dynamic>> questionsForCategory(String category) {
  switch (category) {
    case 'ppok':
      return [
        {
          'questionText': 'Seberapa sering Anda mengalami batuk dalam sehari?',
          'key': 'question1',
          'options': [
            'Tidak pernah',
            'Kadang-kadang (1-2 kali sehari)',
            'Sering (3-5 kali sehari)',
            'Sangat sering (lebih dari 5 kali sehari)',
          ],
        },
        {
          'questionText':
              'Apakah Anda pernah mengalami sesak napas? Jika ya, kapan biasanya terjadi?',
          'key': 'question2',
          'options': [
            'Tidak pernah',
            'Saat aktivitas berat (misalnya berolahraga)',
            'Saat aktivitas ringan (misalnya berjalan di dataran)',
            'Saat istirahat',
          ],
        },
        {
          'questionText': 'Bagaimana Anda menggambarkan produksi dahak Anda setiap hari?',
          'key': 'question3',
          'options': [
            'Tidak ada dahak',
            'Dahak ringan (bening dan jarang)',
            'Dahak sedang (kuning/hijau dan sering)',
            'Dahak berat (banyak dan sulit dikeluarkan)',
          ],
        },
      ];
    case 'tbc':
      return [
        {
          'questionText': 'Apakah Anda mengalami batuk yang berlangsung lebih dari 2 minggu?',
          'key': 'question1',
          'options': [
            'Tidak pernah',
            'Kurang dari 2 minggu',
            'Lebih dari 2 minggu tetapi kurang dari 1 bulan',
            'Lebih dari 1 bulan',
          ],
        },
        {
          'questionText': 'Apakah Anda mengalami penurunan berat badan yang tidak diketahui penyebabnya?',
          'key': 'question2',
          'options': [
            'Tidak pernah',
            'Penurunan kurang dari 2 kg',
            'Penurunan antara 2-5 kg',
            'Penurunan lebih dari 5 kg',
          ],
        },
        {
          'questionText': 'Apakah Anda pernah mengalami demam yang berkepanjangan?',
          'key': 'question3',
          'options': [
            'Tidak pernah',
            'Demam selama kurang dari 1 minggu',
            'Demam selama 1-2 minggu',
            'Demam lebih dari 2 minggu',
          ],
        },
      ];
    case 'gangguan-jiwa':
      return [
        {
          'questionText': 'Apakah Anda merasa cemas atau stres dalam kehidupan sehari-hari?',
          'key': 'question1',
          'options': [
            'Tidak pernah',
            'Kadang-kadang',
            'Sering',
            'Sangat sering',
          ],
        },
        {
          'questionText': 'Apakah Anda merasa depresi atau kehilangan minat dalam kegiatan yang biasa Anda nikmati?',
          'key': 'question2',
          'options': [
            'Tidak pernah',
            'Kadang-kadang',
            'Sering',
            'Sangat sering',
          ],
        },
        {
          'questionText': 'Apakah Anda pernah mengalami kesulitan tidur (insomnia)?',
          'key': 'question3',
          'options': [
            'Tidak pernah',
            'Kadang-kadang',
            'Sering',
            'Sangat sering',
          ],
        },
      ];
    default:
      return [];
  }
}
