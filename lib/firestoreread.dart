import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

class FirestoreRead extends StatefulWidget {
  @override
  _FirestoreReadState createState() => _FirestoreReadState();
}

class _FirestoreReadState extends State<FirestoreRead> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Read Mode'),
      ),
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection('NewData').snapshots(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(child: LinearProgressIndicator());
          }
          else
            {
              return new ListView(
                children: snapshot.data.docs.map((DocumentSnapshot snapshotdocument)
                {
                  return Card(
                    child: ListTile(
                      title: Text(snapshotdocument.data()['data']),
                    ),
                  );

                }).toList()
              );
            }
        },
      ),
    );
  }
}
