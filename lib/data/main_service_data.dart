import 'package:flutter/material.dart';
import 'package:prototype_posyandu/screens/examination_cluster_screen.dart';
import 'package:prototype_posyandu/screens/target_data_screen.dart';

class MainServiceData {
  final String imagePath;
  final String title;
  final Widget? navigation;

  MainServiceData({required this.imagePath, required this.title, this.navigation});
}

final List<MainServiceData> mainServices = [
  MainServiceData(
    imagePath: 'assets/images/main_service/pemeriksaan.jpeg',
    title: 'Pemeriksaan',
    navigation: const ExaminationClusterScreen()
  ),
  MainServiceData(
    imagePath: 'assets/images/main_service/sasaran.jpg',
    title: 'Data Sasaran',
    navigation: const TargetDataScreen()
  ),
  MainServiceData(
    imagePath: 'assets/images/main_service/rekap_pemeriksaan.jpg',
    title: 'Rekap Pemeriksaan',
  ),
  MainServiceData(
    imagePath: 'assets/images/main_service/edukasi.jpeg',
    title: 'Edukasi',
  ),
];
