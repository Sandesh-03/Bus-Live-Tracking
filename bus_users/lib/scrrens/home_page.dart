import 'package:bus_user/constantWidgits.dart';
import 'package:bus_user/scrrens/available_buses.dart';
import 'package:flutter/material.dart';

import '../constants.dart';
import '../globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final validationKey = GlobalKey<FormState>();
  TextEditingController kSource = TextEditingController();
  TextEditingController kDestinartion = TextEditingController();
  TextEditingController kTemp = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Row(
          children: const [
            Padding(
              padding: EdgeInsets.all(10.0),
              child: Icon(Icons.directions_bus),
            ),
            Padding(
              padding: EdgeInsets.all(8.0),
              child: Text(
                "Search Bus for You",
                style: TextStyle(fontSize: 24),
              ),
            ),
          ],
        ),
        shape: const RoundedRectangleBorder(
            borderRadius: BorderRadius.only(
                bottomRight: Radius.circular(15),
                bottomLeft: Radius.circular(15))),
      ),
      body: Form(
        key: validationKey,
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: kTextFormField(
                lable: 'From',
                kController: kSource,
                icon: const Icon(Icons.shortcut_outlined),
                validator: (val) {
                  if (val == null || val == "") {
                    return "this fild shoud must be filled";
                  }
                },
              ),
            ),
            IconButton(
              onPressed: () {
                setState(() {
                  kTemp = kSource;
                  kSource = kDestinartion;
                  kDestinartion = kTemp;
                });
              },
              icon: const Icon(
                Icons.swap_vert_circle_rounded,
                size: 40,
                color: kPrimaryColour,
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: kTextFormField(
                lable: 'Destination',
                kController: kDestinartion,
                suffixIcon: const Icon(Icons.subdirectory_arrow_left_outlined),
                validator: (val) {
                  if (val == null || val == "") {
                    return "this fild shoud must be filled";
                  }
                },
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
              child: GestureDetector(
                onTap: () {
                  if (validationKey.currentState!.validate()) {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const AvailableBus()));
                  }
                  searchReasult.clear();
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(50),
                    color: kPrimaryColour,
                  ),
                  child: const Center(
                      child: Text(
                    'Search bus',
                    style: TextStyle(fontSize: 20, color: Colors.white),
                  )),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}
