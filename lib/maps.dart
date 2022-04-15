import 'package:flutter/material.dart';
import 'package:google_maps_flutter/google_maps_flutter.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:firebase_core/firebase_core.dart';
import 'firebase_options.dart';

class Screen2 extends StatefulWidget {
  @override
  _Screen2State createState() => _Screen2State();
}

class _Screen2State extends State<Screen2> {
  FirebaseDatabase database = FirebaseDatabase.instance;
  DatabaseReference ref = FirebaseDatabase.instance.ref("/");
  int count=0;
  void Print() async
  {
    DatabaseEvent event = await ref.once();
     ///var spots=event.snapshot.value;
     var spots= Map<String, dynamic>.from(event.snapshot.value as Map<dynamic, dynamic>);
     print(spots["p1"]);
  }
  @override
  Widget build(BuildContext context) {
    Marker _marker =
    Marker(markerId: MarkerId("id"), position: LatLng(29.85, 77.88),
        onTap: ()
        {
          Print();
          Navigator.push(context, MaterialPageRoute(builder: (context)=>Screen3()));
        }
    );
    Marker _marker2 =
    Marker(markerId: MarkerId("id2"), position: LatLng(26.2124, 78.1772));
    return Scaffold(
        appBar: AppBar(
          title: Text('Map'),
        ),
        body: Column(
          children: [
            Expanded(
                child: GoogleMap(
              initialCameraPosition:
                  CameraPosition(target: LatLng(29.85, 77.88), zoom: 10),
              markers: {_marker, _marker2},
            ))
          ],
        ));
  }
}

class Screen3 extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      body: Container(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Container(
              color: Colors.grey.shade500,
              child:Padding(
                padding: const EdgeInsets.all(8.0),
                child: Text('2 spots available'),
              )
            ),
            SizedBox(
              height: 30,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Container(
                  color: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Book'),
                  ),
                ),
                Container(
                  color: Colors.green.shade50,
                  child: Padding(
                    padding: const EdgeInsets.all(8.0),
                    child: Text('Find other spot'),
                  ),
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}

