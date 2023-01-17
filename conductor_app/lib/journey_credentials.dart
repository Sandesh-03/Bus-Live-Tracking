import 'package:flutter/material.dart';

class AddCredentials extends StatefulWidget {
  const AddCredentials({Key? key}) : super(key: key);

  @override
  State<AddCredentials> createState() => _AddCredentialsState();
}

class _AddCredentialsState extends State<AddCredentials> {
  bool _value = false;
  int val = -1;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Add journey credentials!"),),
      body: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 8, 8, 8),
            child: ListTile(
              title: Row(
                children: [
                  Text("A",style: TextStyle(fontSize: 20),),
                  Icon(Icons.arrow_forward),
                  Text("B",style:TextStyle(fontSize: 20),),
                ],
              ),
              leading: Radio(
                value: 1,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value!;
                  });
                },
                activeColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(120, 8, 8, 8),
            child: ListTile(
              title: Row(
                children: [
                  Text("B",style: TextStyle(fontSize: 20)),
                  Icon(Icons.arrow_forward),
                  Text("A",style: TextStyle(fontSize: 20))
                ],
              ),
              leading: Radio(
                value: 2,
                groupValue: val,
                onChanged: (value) {
                  setState(() {
                    val = value!;
                  });
                },
                activeColor: Colors.green,
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.fromLTRB(8, 50, 8, 8),
            child: GestureDetector(
              onTap: () {},
              child: Container(
                width: 200,
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(50),
                  color: Colors.black54,
                ),
                child: Center(child: Text('Start journey')),
              ),

            ),
          )
        ],
      )
    );

  }
}
