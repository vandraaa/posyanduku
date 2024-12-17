class ClusterServiceData {
  final String imagePath;
  final String title;

  ClusterServiceData({required this.imagePath, required this.title});
}

final List<ClusterServiceData> clusterServices = [
  ClusterServiceData(
    imagePath: 'assets/images/cluster/bayi.jpg',
    title: 'Bayi & Balita',
  ),
  ClusterServiceData(
    imagePath: 'assets/images/cluster/remaja.webp',
    title: 'Remaja',
  ),
  ClusterServiceData(
    imagePath: 'assets/images/cluster/dewasalansia.webp',
    title: 'Dewasa & Lansia',
  ),
  ClusterServiceData(
    imagePath: 'assets/images/cluster/ibuhamil.jpg',
    title: 'Ibu hamil',
  ),
];
