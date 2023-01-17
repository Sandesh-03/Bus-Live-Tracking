import 'package:bus_admin/globals.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class BusInfo extends StatefulWidget {
  List data;

  BusInfo({
  required this.data,
});
@override
  State<BusInfo> createState() => _BusInfoState();
}

class _BusInfoState extends State<BusInfo> {
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
        title: Text("Bus Info"),
      ),
      body:StreamBuilder(
        stream:FirebaseFirestore.instance.collection('bus').snapshots() ,
        builder: (contex, snp)
        {
         if(snp.hasData)
           {
           return  ListView.builder(
                itemCount: station_list.length,
                itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.fromLTRB(15, 0, 0, 4),
                child: Material(
                  elevation: 20,
                  child: ListTile(
                    leading: Icon(
                      Icons.arrow_downward_sharp,
                      color: Colors.black,
                    ),
                    title: Text(
                      "${id_list}",
                      style: TextStyle(color: Colors.black),
                    ),
                    shape: Border(
                        left: BorderSide(color: Colors.white),
                        bottom: BorderSide(color: Colors.white)),
                    tileColor: Colors.black,
                  ),
                ),
              );
            }
                ));
           }
         return CircularProgressIndicator();
        },
      ),
      );


  }
}
