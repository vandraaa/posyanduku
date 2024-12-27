import 'package:flutter/material.dart';
import 'package:prototype_posyandu/widgets/home/main_services.dart';
import 'package:prototype_posyandu/widgets/home/connection_status_bar.dart';
import 'package:prototype_posyandu/widgets/home/target_stats_slider.dart';
import 'package:prototype_posyandu/widgets/navbar/bottom_navbar.dart';
import '../widgets/home/user_welcome.dart';
import '../utilities/internet_checker.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  bool isOnline = true;
  bool isChecked = false;
  int _currentIndex = 0;

  @override
  void initState() {
    super.initState();
    checkConnectivity((isConnected) {
      setState(() {
        isOnline = isConnected;
        isChecked = true;
      });
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: const Size.fromHeight(30),
        child: AppBar(
          automaticallyImplyLeading: false,
          backgroundColor: Colors.transparent,
          elevation: 0,
          flexibleSpace: SafeArea( 
            child: ConnectionStatusBar(
              isOnline: isOnline,
              isChecked: isChecked,
            ),
          ),
        ),
      ),
      body: const SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding: EdgeInsets.fromLTRB(16, 12, 16, 12),
              child: UserWelcome(),
            ),
            Padding(
              padding: EdgeInsets.all(16.0),
              child: TargetStatsSlider(),
            ),
            Padding(
              padding: EdgeInsets.fromLTRB(16, 15, 16, 15),
              child: MainServices(),
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavBar(
        currentIndex: _currentIndex,
        onTap: (index) => setState(() => _currentIndex = index),
      )
    );
  }
}
