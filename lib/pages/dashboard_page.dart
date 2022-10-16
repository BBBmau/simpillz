import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: const Icon(
          Icons.menu,
          color: Colors.white,
          size: 35,
        ),
        shadowColor: Colors.transparent,
        leadingWidth: 100,
        toolbarHeight: 100,
      ),
      body: SafeArea(
        child: Center(
          child: Stack(
            children: [
              // background gradient
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
              // Profile image column
              Column(
                children: [
                  const SizedBox(
                    height: 150,
                    child: Center(
                      child: SizedBox(
                        height: 115,
                        width: 115,
                        child: CircleAvatar(
                          backgroundImage:
                              AssetImage("assets/images/old_man.jpeg"),
                        ),
                      ),
                    ),
                  ),
                  const Text(
                    "John Doe",
                    style: TextStyle(
                        fontSize: 30,
                        color: Colors.white,
                        fontWeight: FontWeight.bold),
                  ),
                  const Text(
                    "3 left",
                    style: TextStyle(
                      fontSize: 15,
                      color: Colors.white,
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(16.0),
                  ),
                  Expanded(
                    child: Container(
                        decoration: const BoxDecoration(
                          color: Colors.white,
                          borderRadius: BorderRadius.only(
                            topRight: Radius.circular(40.0),
                            topLeft: Radius.circular(40.0),
                          ),
                        ),
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          children: <Widget>[
                            Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 20, vertical: 40),
                              child: TextButton(
                                style: TextButton.styleFrom(
                                  padding: const EdgeInsets.all(20),
                                  shape: RoundedRectangleBorder(
                                      borderRadius: BorderRadius.circular(15)),
                                  backgroundColor: Colors.grey,
                                ),
                                onPressed: (() => {}),
                                child: Row(
                                  children: const [
                                    SizedBox(width: 20),
                                    Expanded(
                                        child: Text(
                                      "Levothyroxine",
                                      style: TextStyle(color: Colors.white),
                                    )),
                                    Icon(
                                      Icons.more_vert,
                                      color: Colors.white,
                                    ),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        )),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
