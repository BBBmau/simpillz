import 'package:flutter/material.dart';
import 'package:motor_flutter_starter/main.dart';
import 'package:motor_flutter_starter/pages/dashboard_page.dart';
import 'package:motor_flutter/motor_flutter.dart';

class InputPage extends StatefulWidget {
  const InputPage({super.key});

  @override
  State<InputPage> createState() => _InputPageState();
}

//TextEditingController alertController = TextEditingController();
TextEditingController doseController = TextEditingController();
TextEditingController frequencyController = TextEditingController();
TextEditingController instructionsController = TextEditingController();
TextEditingController nameController = TextEditingController();
TextEditingController timeController = TextEditingController();
TextEditingController totalDosageController = TextEditingController();
TextEditingController typeController = TextEditingController();

class _InputPageState extends State<InputPage> {
  // called everytime we make a change to the bucket
  void updateCounter() async {
    return await patient.BUCKET.listItems().then((value) {
      setState(() {
        patient.bucketSize = value.length;
      });
    });
  }

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

    final ButtonStyle raisedButtonStyle = ElevatedButton.styleFrom(
      minimumSize: const Size(80, 50),
      padding: const EdgeInsets.symmetric(horizontal: 16),
      shape: const RoundedRectangleBorder(
        borderRadius: BorderRadius.all(Radius.circular(2)),
      ),
    );

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
                  Padding(
                    padding: EdgeInsets.all(4.0),
                    child: Text(
                      "${patient.bucketSize} left",
                      style: const TextStyle(
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
                                  builder: (context) => DashboardPage(
                                        patient: patient,
                                      )));
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
                                controller: nameController,
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
                                          size: 35,
                                        ),
                                        Text(
                                          now,
                                          style: const TextStyle(fontSize: 17),
                                        ),
                                      ],
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 22,
                                      child: Icon(
                                        Icons.sunny,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    const CircleAvatar(
                                      backgroundColor: Colors.black,
                                      radius: 22,
                                      child: Icon(
                                        Icons.access_alarm_rounded,
                                        color: Colors.white,
                                        size: 35,
                                      ),
                                    ),
                                    ElevatedButton(
                                        onPressed: () {},
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
                                  children: [
                                    // Total dosage: -- dropdown
                                    const Text('Total Dosage',
                                        style: TextStyle(fontSize: 20)),
                                    TextField(
                                      controller: totalDosageController,
                                      decoration: const InputDecoration(
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
                                padding:
                                    const EdgeInsets.fromLTRB(30, 5, 30, 5),
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  height: 5 * 24.0,
                                  child: TextField(
                                    controller: instructionsController,
                                    maxLines: 5,
                                    decoration: const InputDecoration(
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
                                )),
                            // submit button
                            Padding(
                                padding:
                                    const EdgeInsets.fromLTRB(30, 5, 30, 5),
                                child: Container(
                                  margin: const EdgeInsets.all(12),
                                  height: 5 * 24.0,
                                  child: ElevatedButton(
                                    style: raisedButtonStyle,
                                    onPressed: () {
                                      final doc =
                                          patient.schema.newDocument("drug");
                                      doc.set(
                                          "dose", int.parse(unitDropdownValue));
                                      doc.set("alert", isSwitched);
                                      doc.set("frequency",
                                          int.parse(frequencyDropdownValue));
                                      doc.set("instructions",
                                          instructionsController.text);
                                      doc.set("name", nameController.text);
                                      // doc.set("time", value)
                                      doc.set("totalDosage",
                                          int.parse(frequencyController.text));
//doc.set("type", value)
                                    },
                                    child: const Text("Submit",
                                        textScaleFactor: 1.2),
                                  ),
                                )),
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
