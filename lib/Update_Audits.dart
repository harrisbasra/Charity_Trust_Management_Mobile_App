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

  void _saveLinksToFirebase() async {
    String groceryLink = _groceryLinkController.text.trim();
    String stationaryLink = _stationaryLinkController.text.trim();
    String studentsLink = _studentsLinkController.text.trim();

    if (groceryLink.isNotEmpty) {
      await _updateDatabase(groceryLink, "grocery");
    }

    if (stationaryLink.isNotEmpty) {
      await _updateDatabase(stationaryLink, "stationary");
    }

    if (studentsLink.isNotEmpty) {
      await _updateDatabase(studentsLink, "students");
    }

    // Clear the text fields after saving
    _groceryLinkController.clear();
    _stationaryLinkController.clear();
    _studentsLinkController.clear();

    // Show a success message or perform any other action after saving the links
    ScaffoldMessenger.of(context).showSnackBar(SnackBar(
      content: Text('Links saved successfully!'),
      backgroundColor: Colors.green,
    ));
  }

  Future<void> _updateDatabase(String link, String category) async {
    final CollectionReference collectionRef = FirebaseFirestore.instance.collection(category);
    await collectionRef.add({'url': link});
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _groceryLinkController,
                    decoration: InputDecoration(
                      hintText: 'Enter the link of grocery images',
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _stationaryLinkController,
                    decoration: InputDecoration(
                      hintText: 'Enter the link of stationary images',
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
                  padding: const EdgeInsets.symmetric(horizontal: 16),
                  child: TextField(
                    controller: _studentsLinkController,
                    decoration: InputDecoration(
                      hintText: 'Enter the link of students list images',
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
              onPressed: _saveLinksToFirebase,
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
