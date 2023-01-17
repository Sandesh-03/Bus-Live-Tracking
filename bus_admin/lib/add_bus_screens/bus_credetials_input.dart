import 'package:bus_admin/add_bus_screens/add_route.dart';
import 'package:bus_admin/globals.dart';
import 'package:flutter/material.dart';

class CredInputScreen extends StatefulWidget {
  const CredInputScreen({Key? key}) : super(key: key);

  @override
  State<CredInputScreen> createState() => _CredInputScreenState();
}

class _CredInputScreenState extends State<CredInputScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.vertical(
            bottom: Radius.circular(10),
          ),
        ),

        backgroundColor: Colors.deepOrange,
        title: Text("Enter your bus details!"),
      ),
      body: GetInfo(),
      backgroundColor: Colors.white,
    );
  }
}

class GetInfo extends StatefulWidget {
  const GetInfo({Key? key}) : super(key: key);

  @override
  State<GetInfo> createState() => _GetInfoState();
}

class _GetInfoState extends State<GetInfo> {
  TextEditingController BusSrNoController = TextEditingController();
  TextEditingController BusVehicleNoController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.vertical,
      child: Expanded(
          child: Container(
        child: Column(
          children: [
            Container(
              child:
                  Image.asset("assets/images/img.png", height: 200, width: 200),
            ),
            Card(
              child: Padding(

                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value)
                  {
                    BusSrNo=value;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Bus Sr No',
                    hintText: 'Enter your Bus Sr.No here',
                  ),
                ),
              ),
            ),
            Card(
              child: Padding(
                padding: const EdgeInsets.all(8.0),
                child: TextField(
                  onChanged: (value){
                    BusVehicleNo=value;
                  },
                  decoration: InputDecoration(
                    fillColor: Colors.black,
                    // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                    labelText: 'Bus vehicle No',
                    hintText: 'Enter your bus vehicle No here',
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
              child: GestureDetector(
                onTap: () {
                  Navigator.push(context,
                      MaterialPageRoute(builder: (context) => RoutAdd()));
                },
                child: Container(
                  width: 200,
                  height: 50,
                  decoration: BoxDecoration(
                    color: Colors.deepOrange,
                    borderRadius: BorderRadius.circular(50),
                  ),
                  child: Center(child: Text('Next ')),
                ),
              ),
            )
          ],
        ),
      )),
    );
  }
}
