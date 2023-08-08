import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Update_Audits extends StatefulWidget {
  @override
  _UpdateAuditState createState() => _UpdateAuditState();
}

class _UpdateAuditState extends State<Update_Audits> {
  TextEditingController _groceryLinkController = TextEditingController();
  TextEditingController _stationaryLinkController = TextEditingController();
  TextEditingController _studentsLinkController = TextEditingController();

  void _saveLinksToFirebase() {
    final groceryLink = _groceryLinkController.text.trim();
    final stationaryLink = _stationaryLinkController.text.trim();
    final studentsLink = _studentsLinkController.text.trim();

    if (groceryLink.isNotEmpty) {
      FirebaseFirestore.instance.collection('grocery').add({
        'link': groceryLink,
      });
    }

    if (stationaryLink.isNotEmpty) {
      FirebaseFirestore.instance.collection('stationary').add({
        'link': stationaryLink,
      });
    }

    if (studentsLink.isNotEmpty) {
      FirebaseFirestore.instance.collection('students').add({
        'link': studentsLink,
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Update Audits',
          style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () {
            Navigator.pop(context);
          },
        ),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    'Grocery Images Link:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    onTap: () {

                    },
                    controller: _groceryLinkController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Enter Grocery Image Link',
                      filled: true,
                      fillColor: Colors.white38, // Background color
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Divider(height: 80, thickness: 8),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    'Stationary Images Link:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    onTap: () {

                    },
                    controller: _stationaryLinkController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Enter Stationary Image Link',
                      filled: true,
                      fillColor: Colors.white38, // Background color
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
                Divider(height: 80, thickness: 8),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 16, right: 16),
                  child: Text(
                    'Students List Images Link:',
                    style: TextStyle(fontWeight: FontWeight.bold),
                  ),
                ),
                SizedBox(height: 8),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    onTap: () {

                    },
                    controller: _studentsLinkController,
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      hintText: 'Enter Student List Image Link',
                      filled: true,
                      fillColor: Colors.white38, // Background color
                      focusedBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                      enabledBorder: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(10.0),
                        borderSide: BorderSide(color: Colors.black),
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 16),
              ],
            ),
            SizedBox(height: 30,),
          ],
        ),
      ),
      bottomNavigationBar: Row(
        children: [
          Expanded(
            child: ElevatedButton(
              onPressed: () {
                // Handle the cancel button press
              },
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
              ),
              child: Text('Cancel', style: TextStyle(fontSize: 20, color: Colors.black),),
            ),
          ),
          Expanded(
            child: ElevatedButton(
              onPressed:_saveLinksToFirebase,
              style: ElevatedButton.styleFrom(
                fixedSize: Size.fromHeight(70),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(0),
                ),
                primary: Color.fromRGBO(219, 185, 88, 1),
              ),
              child: Text('Save Links', style: TextStyle(fontSize: 20, color: Colors.white),),
            ),
          ),
        ],
      ),
    );
  }
}
