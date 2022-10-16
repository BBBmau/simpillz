import 'package:flutter/material.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              Container(
                decoration: const BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.center,
                    end: Alignment.bottomCenter,
                    colors: [
                      Colors.blue,
                      Colors.lightGreen,
                    ],
                  ),
                ),
              ),
              const Center(
                child: SizedBox(
                  height: 115,
                  width: 115,
                  child: CircleAvatar(
                    backgroundImage: AssetImage("assets/images/old_man.jpeg"),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
