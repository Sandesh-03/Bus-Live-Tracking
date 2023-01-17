import 'package:bus_user/globals.dart';
import 'package:bus_user/scrrens/Busdetails.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class AvailableBus extends StatefulWidget {
  const AvailableBus({Key? key}) : super(key: key);

  @override
  State<AvailableBus> createState() => _AvailableBusState();
}

class _AvailableBusState extends State<AvailableBus> {
  @override
  List searchResult = [];

  void searchFromFirebase(String query) async {
    final result = await FirebaseFirestore.instance
        .collection('bus')
        .where('rout', arrayContains: query)
        .get();

    setState(() {
      searchResult = result.docs.map((e) => e.data()).toList();
    });
  }

  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text("buses From$from_station to $to_station}"),
        ),
        body: ListView.builder(
          itemBuilder: (ctx, idx) {
            return Card(
              elevation: 4,
              child: ListTile(
                onTap: () {
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => const BusDetails()));
                },
                leading: const Icon(Icons.train),
                dense: false,
                title: const Text("hadapsar"),
              ),
            );
          },
          itemCount: 1,
        ));
  }
}
