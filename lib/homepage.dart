import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firestore_crud/firestoreread.dart';
import 'main.dart';
import 'package:flutter/material.dart';



class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage>
{

  TextEditingController textEditingController = new TextEditingController();


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        onPressed: () async
        {
          await FirebaseFirestore.instance.collection('NewData').add(
            {
            'data' :textEditingController.text
            }
          );
        },
        backgroundColor: Colors.black,
        child: Icon(Icons.update, color: Colors.white),
      ),
      appBar: AppBar(
        backgroundColor: Colors.black,
        title: Text('Create Mode'),
        actions: [
          FlatButton.icon(
            icon: Icon(Icons.chrome_reader_mode, color: Colors.white),
            label: Text(
              'Read Mode',
              style: TextStyle(color: Colors.white),
            ),
            onPressed: () {
              Navigator.pushReplacement(context,
                  MaterialPageRoute(builder: (context) => FirestoreRead()));
            },
          )
        ],
      ),

      body: Container(
        child: Padding(
          padding: const EdgeInsets.only(top: 150.0,left: 20.0,right: 20.0),
          child: TextField(
            controller: textEditingController,
            decoration: InputDecoration(
              hintText: 'Start Typing.......',
              hintStyle: TextStyle(
                fontWeight: FontWeight.bold
              )
            ),
          ),
        ),
      ),

    );
  }
}
