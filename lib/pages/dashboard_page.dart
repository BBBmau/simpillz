import 'package:flutter/material.dart';

class Data {
  String doseType;
  String dosageName;
  String dosageTime;
  String dosageAmount;
  Data(
      {this.doseType = '',
      this.dosageName = '',
      this.dosageTime = '',
      this.dosageAmount = ''});
}

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
        toolbarHeight: 80,
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
                      child: SingleChildScrollView(
                        child: Column(
                          mainAxisAlignment: MainAxisAlignment.start,
                          crossAxisAlignment: CrossAxisAlignment.center,
                          children: <Widget>[
                            const Padding(
                              padding: EdgeInsets.all(10.0),
                            ),
                            DosageCard(
                              data: Data(
                                  doseType: "liquid",
                                  dosageName: "Levothyroxine",
                                  dosageTime: "day",
                                  dosageAmount: "1ml dose before meal"),
                            ),
                            DosageCard(
                              data: Data(
                                  doseType: "pill",
                                  dosageName: "Oxycodone",
                                  dosageTime: "night",
                                  dosageAmount: "2 tablets after meal"),
                            ),
                          ],
                        ),
                      ),
                    ),
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

class DosageCard extends StatelessWidget {
  final Data data;
  const DosageCard({super.key, required this.data});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 10),
      child: TextButton(
        style: TextButton.styleFrom(
          padding: const EdgeInsets.all(20),
          shape:
              RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
          backgroundColor: Colors.blue,
        ),
        onPressed: (() => {}),
        child: Row(
          children: [
            const SizedBox(width: 5),
            const CircleAvatar(
              backgroundColor: Colors.white,
              radius: 22,
              child: Icon(
                Icons.water_drop,
                color: Colors.blue,
              ),
            ),
            const Align(
              widthFactor: 0.6,
              heightFactor: 1.8,
              alignment: Alignment.bottomRight,
              child: CircleAvatar(
                backgroundColor: Colors.indigo,
                radius: 15,
                child: Icon(
                  Icons.sunny,
                  size: 20,
                  color: Colors.yellow,
                ),
              ),
            ),
            const SizedBox(width: 10),
            Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(data.dosageName,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 18,
                        fontWeight: FontWeight.bold)),
                Text(data.dosageAmount,
                    style: const TextStyle(
                        color: Colors.white,
                        fontSize: 14,
                        fontWeight: FontWeight.normal)),
              ],
            ),
            const Expanded(
              child: Align(
                alignment: Alignment.centerRight,
                child: Icon(
                  Icons.more_vert,
                  color: Colors.white,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
