import 'package:bus_admin/globals.dart';
import 'package:bus_admin/homePage.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
class RoutAdd extends StatefulWidget {
  const RoutAdd({super.key});

  @override
  State<RoutAdd> createState() => _RoutAddState();
}

class _RoutAddState extends State<RoutAdd> {
  @override
  Widget build(BuildContext context) {
    return Material(
      child: Scaffold(

        appBar: AppBar(
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.vertical(
              bottom: Radius.circular(10),
            ),
          ),

          title: Text(
            "Add Routes",
          ),
          backgroundColor: Colors.deepOrange,
          actions: [
            TextButton(
              onPressed: () async{
               await FirebaseFirestore.instance.collection('bus').add(
                   {
                     'Num':BusVehicleNo,
                     'sr':BusSrNo,
                     'rout':station_list,
                     'link':station_map,
                     'straight':straight
                   }
               );
               print('object');
                Navigator.pop(context);
                Navigator.pop(context);
                BusSrNo=0;
                BusVehicleNo=0;
                station_list.clear();
                station_map.clear();
              },
              child: Row(
                children: [
                  Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text("Confirm"),
                  ),
                  Icon(Icons.check)
                ],
              ),
              style: TextButton.styleFrom(
                   foregroundColor: Colors.white),
            )
          ],
        ),
        floatingActionButton: FloatingActionButton(
          backgroundColor: Colors.deepOrange,
            onPressed: () {
              showDialog(
                  context: context,
                  builder: ((BuildContext context) {
                    return SimpleDialog(
                      title: Padding(
                        padding: const EdgeInsets.fromLTRB(15, 8, 17, 8),
                        child: Row(
                          children: [
                            Text("Add Route"),
                            SizedBox(
                              width: 10,
                            )
                          ],
                        ),
                      ),
                      children: [
                        Column(
                          children: [
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value)
                                {
                                  station=value;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  labelText: 'Bus Stop Name',
                                  hintText: 'Bus Stop Name',
                                ),
                              ),
                            ),
                            SizedBox(
                              height: 10,
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value)
                                {
                                  link=value;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  labelText: 'Location',
                                  hintText: 'Link from google maps',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: TextField(
                                onChanged: (value)
                                {
                                  time=value;
                                },
                                decoration: InputDecoration(
                                  fillColor: Colors.black,
                                  // border: OutlineInputBorder(borderRadius: BorderRadius.circular(8)),
                                  labelText: 'Time',
                                  hintText: 'Time for next stop(in mins)',
                                ),
                              ),
                            ),
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Container(

                                child: TextButton(

                                  onPressed: () {
                                    Navigator.pop(context);
                                   setState(() {
                                     station_list.add(station);
                                     time_list.add(time);
                                   });
                                   parseurl(link, station);
                                   print('${station_list[0].toString()}');
                                    station="";
                                    link="";
                                    print(station_map);
                                  },
                                  child: Text("Add"),

                                ),

                              ),
                            )
                          ],
                        )
                      ],
                    );
                  }));
            },
            child: Icon(Icons.add)),
        body: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView.builder(
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
                      "${station_list[index]}",
                      style: TextStyle(color: Colors.black),
                    ),
                    shape: Border(
                        left: BorderSide(color: Colors.black),
                        bottom: BorderSide(color: Colors.black)),
                    tileColor: Colors.white,
                  ),
                ),
              );
            }),
            itemCount:station_list.length,
          ),
        ),
        backgroundColor: Colors.white,
      ),
    );
  }
}
