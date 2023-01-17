import 'package:bus_admin/add_bus_screens/bus_credetials_input.dart';
import 'package:bus_admin/bus_info_screen/bus_info.dart';
import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import 'globals.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {

  @override
  Widget build(BuildContext context) {
    return Scaffold(


      floatingActionButton: FloatingActionButton.extended(
        backgroundColor: Colors.white70,
        onPressed: () {
          Navigator.push(context,
              MaterialPageRoute(builder: (context) => CredInputScreen()));
        },
        icon: const Icon(Icons.add,color: Colors.deepOrange,),
        label: const Text(
          'Add Bus',
          style: TextStyle(
            color: Colors.black
          ),
        ),

      ),
      appBar: AppBar(
          shape: RoundedRectangleBorder(
      borderRadius: BorderRadius.vertical(
      bottom: Radius.circular(10),
    ),
    ),
        backgroundColor: Colors.deepOrange,
        title: Row(
          children: [
            Padding(
              padding: const EdgeInsets.all(8.0),
              child: Icon(Icons.home,color: Colors.white,),
            ),
            Text("Home", style: TextStyle(color: Colors.white)),


          ],
        ),
      ),
      body: StreamBuilder(
        stream:FirebaseFirestore.instance.collection("bus").snapshots(),
        builder: (context, snapshot) {
       if(snapshot.hasData)
         {
           return ListView.builder(
               itemCount: snapshot.requireData.docs.length,
               itemBuilder: (context, index) {
                 if(snapshot.requireData==null)
                   {
                     return Scaffold(

                     );
                   }

                 return Padding(
                   padding: const EdgeInsets.all(11.0),
                   child: Card(
                       child: InkWell(
                         onTap: () {

                           var id_list=snapshot.data!.docs[index]['rout'];
                           Navigator.push(context,
                               MaterialPageRoute(builder: (context) => BusInfo(data: id_list, )));
                         },
                         child: Material(
                           elevation: 10,
                           color: Colors.white,
                           child: ListTile(
                             textColor: Colors.black,
                             focusColor: Colors.white,


                             shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(15)),
                             title: Text(
                               snapshot.data!.docs[index]['Num'],
                               style: TextStyle(color: Colors.black),
                             ),
                             tileColor: Colors.white70,
                           ),
                         ),
                       )),
                 );
               });

         }
       return Center(child: CircularProgressIndicator());
        }
      ),
      backgroundColor: Colors.white,
    );
  }
}

