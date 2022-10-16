import 'package:flutter/material.dart';
import 'package:motor_flutter_starter/pages/dashboard_page.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

class _InputPageState extends State<InputPage> {
  @override
  Widget build(BuildContext context) {
    const List<String> unit = <String>[
      '1',
      '2',
      '3',
      '4',
      '5',
      '6',
      '7',
      '8',
      '9',
      '10'
    ];
    const List<String> frequency = <String>['Once', 'Twice', 'Thrice'];

    bool isSwitched = true;
    String now = DateTime.now().toString().substring(0, 10);
    String unitDropdownValue = unit.first;
    String frequencyDropdownValue = frequency.first;

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
                    children: [
                      ElevatedButton(
                        onPressed: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (context) => const DashboardPage()));
                        },
                        style: ElevatedButton.styleFrom(
                          fixedSize: const Size(50, 50),
                          shape: const CircleBorder(),
                          backgroundColor: Colors.white,
                        ),
                        child: const Icon(
                          Icons.cancel,
                          color: Colors.black,
                          size: 30,
                        ),
                      ),
                      const SizedBox(width: 30),
                    ],
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
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(45, 20, 45, 20),
                              child: TextFormField(
                                decoration: const InputDecoration(
                                  border: UnderlineInputBorder(),
                                  labelText: 'Add the medicine name',
                                ),
                              ),
                            ),
                            //Icons - current time and dosage time
                            Padding(
                              padding:
                                  const EdgeInsets.fromLTRB(45, 20, 45, 20),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Date: Three Icons
                                    Row(
                                      children: [
                                        const Icon(
                                          Icons.lock_clock,
                                          color: Colors.black,
                                          size: 38,
                                        ),
                                        Text(
                                          now,
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Colors.purple,
                                      radius: 22,
                                      child: Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                        size: 22,
                                      ),
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Colors.purple,
                                      radius: 22,
                                      child: ImageIcon(
                                          AssetImage("assets/icons/moon.png"),
                                          size: 22),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
                                        style: ElevatedButton.styleFrom(
                                          backgroundColor: Colors.purple,
                                        ),
                                        child: const Text('All Day',
                                            style: TextStyle(fontSize: 17)))
                                  ]),
                            ),
                            //Dosage Input
                            Padding(
                              padding: const EdgeInsets.fromLTRB(45, 5, 45, 5),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Dosage: -- and freq dropdown
                                    const Text('Dosage',
                                        style: TextStyle(fontSize: 20)),
                                    DropdownButton<String>(
                                      value: unitDropdownValue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          unitDropdownValue = value!;
                                        });
                                      },
                                      items: unit.map<DropdownMenuItem<String>>(
                                          (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                    DropdownButton<String>(
                                      value: frequencyDropdownValue,
                                      icon: const Icon(Icons.arrow_drop_down),
                                      elevation: 16,
                                      style: const TextStyle(
                                          color: Colors.deepPurple),
                                      underline: Container(
                                        height: 2,
                                        color: Colors.deepPurpleAccent,
                                      ),
                                      onChanged: (String? value) {
                                        // This is called when the user selects an item.
                                        setState(() {
                                          frequencyDropdownValue = value!;
                                        });
                                      },
                                      items: frequency
                                          .map<DropdownMenuItem<String>>(
                                              (String value) {
                                        return DropdownMenuItem<String>(
                                          value: value,
                                          child: Text(value),
                                        );
                                      }).toList(),
                                    ),
                                  ]),
                            ),
                            // Total dosage
                            Padding(
                              padding: const EdgeInsets.fromLTRB(45, 5, 45, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: const [
                                    // Total dosage: -- dropdown
                                    Text('Total Dosage',
                                        style: TextStyle(fontSize: 20)),
                                    TextField(
                                      decoration: InputDecoration(
                                        hintText: '0',
                                        border: OutlineInputBorder(),
                                        constraints: BoxConstraints.tightFor(
                                            width: 80, height: 40),
                                      ),
                                    ),
                                  ]),
                            ),
                            // Alert toggle
                            Padding(
                              padding: const EdgeInsets.fromLTRB(45, 5, 45, 0),
                              child: Row(
                                  mainAxisAlignment:
                                      MainAxisAlignment.spaceBetween,
                                  children: [
                                    // Alert me to refill
                                    const Text('Alert me to refill',
                                        style: TextStyle(fontSize: 20)),
                                    Align(
                                      alignment: Alignment.centerRight,
                                      child: Switch(
                                          value: isSwitched,
                                          onChanged: (value) {
                                            setState(() {
                                              isSwitched = value;
                                            });
                                          }),
                                    ),
                                  ]),
                            ),
                            // Instructions input
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 5, 30, 5),
                              child: Container(
                                margin: const EdgeInsets.all(12),
                                height: 5 * 24.0,
                                child: const TextField(
                                  maxLines: 5,
                                  decoration: InputDecoration(
                                    hintText: "Enter a message",
                                    fillColor: Colors.white,
                                    filled: true,
                                    border: OutlineInputBorder(
                                        borderRadius: BorderRadius.all(
                                            Radius.circular(5.0)),
                                        borderSide:
                                            BorderSide(color: Colors.blue)),
                                  ),
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.fromLTRB(30, 5, 30, 20),
                              child: Row(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceAround,
                                children: [
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(50, 50),
                                      shape: const CircleBorder(),
                                      backgroundColor: Colors.blue,
                                    ),
                                    child: const Icon(Icons.water_drop,
                                        color: Colors.white, size: 25),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(50, 50),
                                      shape: const CircleBorder(),
                                      backgroundColor: Colors.blue,
                                    ),
                                    child: const ImageIcon(
                                        AssetImage("assets/icons/pills.png"),
                                        size: 25),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(50, 50),
                                      shape: const CircleBorder(),
                                      backgroundColor: Colors.blue,
                                    ),
                                    child: const ImageIcon(
                                        AssetImage("assets/icons/meds.png"),
                                        size: 25),
                                  ),
                                  ElevatedButton(
                                    onPressed: () {},
                                    style: ElevatedButton.styleFrom(
                                      fixedSize: const Size(50, 50),
                                      shape: const CircleBorder(),
                                      backgroundColor: Colors.blue,
                                    ),
                                    child: const ImageIcon(
                                        AssetImage("assets/icons/syringe.png"),
                                        size: 25),
                                  ),
                                ],
                              ),
                            ),
                            ElevatedButton(
                              onPressed: () {},
                              style: ElevatedButton.styleFrom(
                                fixedSize: const Size(200, 50),
                                backgroundColor: Colors.blue,
                              ),
                              child: const Text('Submit'),
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
