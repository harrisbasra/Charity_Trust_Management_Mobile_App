import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class Add_Project extends StatefulWidget {
  @override
  _AddProjectState createState() => _AddProjectState();
}

class _AddProjectState extends State<Add_Project> {
  final _projectNameController = TextEditingController();
  final _projectPriceController = TextEditingController();
  final _alreadyCollectedController = TextEditingController();
  final _projectDescriptionController = TextEditingController();
  final _projectDateLocationController = TextEditingController();
  final _projectImageLinkController = TextEditingController();

  @override
  void dispose() {
    _projectNameController.dispose();
    _projectPriceController.dispose();
    _alreadyCollectedController.dispose();
    _projectDescriptionController.dispose();
    _projectDateLocationController.dispose();
    _projectImageLinkController.dispose();
    super.dispose();
  }

  void _uploadDataToFirestore() async {
    final firestore = FirebaseFirestore.instance;

    // Get data from text fields
    final projectName = _projectNameController.text;
    final projectPrice = _projectPriceController.text;
    final alreadyCollected = _alreadyCollectedController.text;
    final projectDescription = _projectDescriptionController.text;
    final projectDateLocation = _projectDateLocationController.text;
    final projectImageLink = _projectImageLinkController.text;

    // Save data to Firestore
    await firestore.collection('projects').add({
      'projectName': projectName,
      'projectPrice': projectPrice,
      'alreadyCollected': alreadyCollected,
      'projectDescription': projectDescription,
      'projectDateLocation': projectDateLocation,
      'projectImageLink': projectImageLink,
    });

    // Show a success message or navigate to a new screen, etc.
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(
          'Upload Project',
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
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    "Add Project Name : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 10,),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    controller: _projectNameController,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
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
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    "Add Project Price : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    controller: _projectPriceController,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      prefixText: "Rs. ",
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
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    "Add Already Collected Price (If Any) : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    controller: _alreadyCollectedController,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      prefixText: "Rs. ",
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
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    "Add Project Description : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    controller: _projectDescriptionController,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
                      filled: true,
                      prefixText: "This Project is based on ",
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
                SizedBox(height: 16,),
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    "Add Project Date & Location : ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    controller: _projectDateLocationController,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
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
                Padding(
                  padding: const EdgeInsets.only(left: 16.0, right: 16),
                  child: Text(
                    "Add Project Image Link ",
                    style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                  ),
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                  child: TextField(
                    controller: _projectImageLinkController,
                    onTap: () {},
                    style: TextStyle(color: Colors.black),
                    decoration: InputDecoration(
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
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    onPressed: () {
                      // Add functionality for the "Cancel" button if needed.
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
                    onPressed: _uploadDataToFirestore,
                    style: ElevatedButton.styleFrom(
                        fixedSize: Size.fromHeight(70),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(0), // Set the borderRadius to 0 for rectangle shape
                        ),
                        primary: Color.fromRGBO(219, 185, 88, 1)
                    ),
                    child: Text('Upload', style: TextStyle(fontSize: 20, color: Colors.white),),
                  ),
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}
