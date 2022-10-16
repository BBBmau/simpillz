import 'package:flutter/material.dart';
import 'input_page.dart';

class Data {
  String dosageType;
  String dosageName;
  String dosageTime;
  String dosageAmount;
  bool dosageTaken = false;
  Data(
      {this.dosageType = '',
      this.dosageName = '',
      this.dosageTime = '',
      this.dosageAmount = '',
      this.dosageTaken = false});
}

bool isPrimaryCaretaker = true;
final List drugs = [
  ["liquid", "Levothyroxine", "day", "1ml dose before meal", false],
  ["pill", "Oxycodone", "night", "2 tablets after meal", false]
];

// final List<String> drugs = [
//   "liquid",
//   "Levothyroxine",
//   "day",
//   "1ml dose before meal"
// ];

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
                  Row(mainAxisAlignment: MainAxisAlignment.end, children: [
                    if (isPrimaryCaretaker)
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const InputPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(50, 50),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                        ),
                        child: const Icon(
                          Icons.add,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                    const SizedBox(width: 30),
                  ]),
                  const Padding(
                    padding: EdgeInsets.all(10.0),
                  ),
                  Expanded(
                    child: Container(
                      padding: const EdgeInsets.only(top: 10),
                      decoration: const BoxDecoration(
                        color: Colors.white,
                        borderRadius: BorderRadius.only(
                          topRight: Radius.circular(40.0),
                          topLeft: Radius.circular(40.0),
                        ),
                      ),
                      child: ListView.builder(
                        itemCount: drugs.length,
                        itemBuilder: (context, index) {
                          final drugType = drugs[index][0];
                          final drugName = drugs[index][1];
                          final drugTime = drugs[index][2];
                          final drugAmount = drugs[index][3];
                          var dosageTaken = drugs[index][4];
                          return Dismissible(
                            key: Key(drugName),
                            confirmDismiss: (DismissDirection direction) async {
                              if (direction == DismissDirection.startToEnd) {
                                setState(() {
                                  drugs[index][4] = true;
                                  dosageTaken = true;
                                });
                              } else {
                                Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                        builder: (context) =>
                                            const InputPage()));
                              }
                              return false;
                            },
                            child: Padding(
                              padding: const EdgeInsets.symmetric(
                                  horizontal: 30, vertical: 10),
                              child: DosageCard(
                                data: Data(
                                    dosageType: drugType,
                                    dosageName: drugName,
                                    dosageTime: drugTime,
                                    dosageAmount: drugAmount,
                                    dosageTaken: dosageTaken),
                              ),
                            ),
                          );
                        },
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
    var drugIcon;
    if (data.dosageType == "liquid") {
      drugIcon = Icon(Icons.water_drop,
          color: data.dosageTaken ? Colors.green : Colors.blue, size: 25);
    } else if (data.dosageType == "injection") {
      drugIcon =
          const ImageIcon(AssetImage("assets/icons/syringe.png"), size: 25);
    } else if (data.dosageType == "pill") {
      drugIcon = const ImageIcon(AssetImage("assets/icons/meds.png"), size: 25);
    } else if (data.dosageType == "tablet") {
      drugIcon =
          const ImageIcon(AssetImage("assets/icons/pills.png"), size: 25);
    }

    var timeIcon;
    Color? colorIcon;
    if (data.dosageTime == "day") {
      colorIcon = Colors.yellow;
      timeIcon = Icon(
        Icons.sunny,
        size: 20,
        color: colorIcon,
      );
    } else if (data.dosageTime == "night") {
      colorIcon = Colors.white;
      timeIcon = const ImageIcon(AssetImage("assets/icons/moon.png"), size: 18);
    }

    return TextButton(
      style: TextButton.styleFrom(
        padding: const EdgeInsets.all(20),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
        backgroundColor: data.dosageTaken ? Colors.green : Colors.blue,
      ),
      onPressed: (() => {}),
      child: Row(
        children: [
          const SizedBox(width: 5),
          CircleAvatar(
            backgroundColor: Colors.white,
            radius: 22,
            child: drugIcon,
          ),
          Align(
            widthFactor: 0.6,
            heightFactor: 1.8,
            alignment: Alignment.bottomRight,
            child: CircleAvatar(
                backgroundColor: Colors.deepPurpleAccent,
                radius: 15,
                child: timeIcon),
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
              child: isPrimaryCaretaker
                  ? const Icon(
                      Icons.arrow_back_ios,
                      color: Colors.white,
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
