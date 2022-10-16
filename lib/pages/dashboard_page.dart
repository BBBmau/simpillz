import 'package:flutter/material.dart';

class Data {
  String dosageType;
  String dosageName;
  String dosageTime;
  String dosageAmount;
  Data(
      {this.dosageType = '',
      this.dosageName = '',
      this.dosageTime = '',
      this.dosageAmount = ''});
}

bool isAuthenticated = false;

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
                    height: 115,
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
                  const Padding(
                    padding: EdgeInsets.all(8.0),
                    child: Text(
                      "John Doe",
                      style: TextStyle(
                          fontSize: 30,
                          color: Colors.white,
                          fontWeight: FontWeight.bold),
                    ),
                  ),
                  const Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "3 left",
                      style: TextStyle(
                        fontSize: 17,
                        color: Colors.white,
                      ),
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: isAuthenticated
                        ? const [
                            CircleAvatar(
                              backgroundColor: Colors.white,
                              radius: 25,
                              child: Icon(
                                Icons.add,
                                color: Colors.black,
                                size: 30,
                              ),
                            ),
                            SizedBox(width: 30),
                          ]
                        : [],
                  ),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
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
                                  dosageType: "liquid",
                                  dosageName: "Levothyroxine",
                                  dosageTime: "day",
                                  dosageAmount: "1ml dose before meal"),
                            ),
                            DosageCard(
                              data: Data(
                                  dosageType: "pill",
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
    // TODO: Add the actual drug and dosage time icons
    IconData? drugIcon;
    if (data.dosageType == "liquid") {
      drugIcon = Icons.water_drop;
    } else if (data.dosageType == "injection") {
      drugIcon = Icons.abc_sharp;
    } else if (data.dosageType == "pill") {
      drugIcon = Icons.tablet;
    } else if (data.dosageType == "tablet") {
      drugIcon = Icons.tablet;
    }

    IconData? timeIcon;
    Color? colorIcon;
    if (data.dosageTime == "day") {
      timeIcon = Icons.sunny;
      colorIcon = Colors.yellow;
    } else if (data.dosageTime == "night") {
      timeIcon = Icons.money_off;
      colorIcon = Colors.black;
    }

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
              CircleAvatar(
                backgroundColor: Colors.white,
                radius: 22,
                child: Icon(
                  drugIcon,
                  color: Colors.blue,
                ),
              ),
              Align(
                widthFactor: 0.6,
                heightFactor: 1.8,
                alignment: Alignment.bottomRight,
                child: CircleAvatar(
                  backgroundColor: Colors.indigo,
                  radius: 15,
                  child: Icon(
                    timeIcon,
                    size: 20,
                    color: colorIcon,
                  ),
                ),
              ),
              const SizedBox(width: 20),
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
              Expanded(
                child: Align(
                  alignment: Alignment.centerRight,
                  child: isAuthenticated
                      ? const Icon(
                          Icons.more_vert,
                          color: Colors.white,
                        )
                      : null,
                ),
              ),
            ],
          )),
    );
  }
}
