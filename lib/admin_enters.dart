import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:test/Update_Audits.dart';
import 'package:test/UploadProject.dart';

import 'RequestsPage.dart';

class admin_enters extends StatelessWidget{
  final TextEditingController oldPasswordController = TextEditingController();
  final TextEditingController newPasswordController = TextEditingController();
  final TextEditingController confirmNewPasswordController =
  TextEditingController();

  void updatePasswordInFirestore(String newPassword, BuildContext context) async {
    CollectionReference authCollection = FirebaseFirestore.instance.collection('auth');

    try {
      QuerySnapshot querySnapshot = await authCollection.get();

      if (querySnapshot.docs.isNotEmpty) {
        DocumentSnapshot documentSnapshot = querySnapshot.docs.first;
        String documentId = documentSnapshot.id;

        await authCollection.doc(documentId).update({
          'pass': newPassword,
        });
        oldPasswordController.clear();
        newPasswordController.clear();
        confirmNewPasswordController.clear();

        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Passwords Updated Successfully"),
        ));
      } else {
        print('No document found in the "auth" collection.');
      }
    } catch (error) {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text("Error Updating : Connect to Internet & Try Again"),
      ));
    }
  }

  // Function to handle password change button press
  Future<void> handleChangePassword(BuildContext context) async {
    String oldPassword = oldPasswordController.text;
    String newPassword = newPasswordController.text;
    String confirmNewPassword = confirmNewPasswordController.text;

    //..
    final passDoc = await FirebaseFirestore.instance.collection('auth').doc('aVvbYvl1inzv0vZDFvAT').get(); // Replace 'your_document_id' with the actual document ID
    final storedPassword = passDoc['pass'] as String;
    //..
    if (oldPassword == storedPassword) {
      if(newPassword == confirmNewPassword){
        updatePasswordInFirestore(newPassword, context);
      }
      else{
        ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
          content: Text("Passwords are not same"),
        ));
      }
    } else {
      ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
        content: Text('Enter Correct Password'),
      ));
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADMIN PORTAL'),
        actions: [
          Padding(
            padding: const EdgeInsets.only(right: 8.0),
            child: IconButton(
              iconSize: 30,
              icon: const Icon(Icons.add),
              onPressed: () {
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => Add_Project()),
                );
              },
            ),
          ),
        ],
      ),
      body:  SingleChildScrollView(
        padding: EdgeInsets.all(20.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: [
            Text("Update Monthly Info: ", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w500),),
            SizedBox(height: 10,),
            // Second Section: Two Square Buttons in a Row
            Row(
              children: [
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(120, 45, 27, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      minimumSize: Size(double.infinity, 120),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => Update_Audits()),
                      );
                    },
                    child: Text(
                      'Update Audits',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(width: 10),
                Expanded(
                  child: ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      primary: Color.fromRGBO(239, 164, 10, 1),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(10),
                      ),
                      padding: EdgeInsets.symmetric(horizontal: 20.0),
                      minimumSize: Size(double.infinity, 120),
                    ),
                    onPressed: () {
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => UpdateProjectsPage()),
                      );
                    },
                    child: Text(
                      'Update Projects',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
              ],
            ),

            Divider(height: 80, thickness: 8),

            Container(
              decoration: BoxDecoration(
              border: Border.all(
                color: Colors.black,
                  width: 2,
                ),
                borderRadius: BorderRadius.circular(5.0),
              ),
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Column(
                  children: [
                    Text(
                      "Security Concerns: ",
                      style:
                      TextStyle(fontSize: 15, fontWeight: FontWeight.w500),
                    ),
                    SizedBox(
                      height: 10,
                    ),

                    // Third Section: Password Changing System
                    TextField(
                      controller: oldPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter Old Passcode',
                        filled: true,
                        fillColor: Colors.white38,
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
                    SizedBox(height: 10,),
                    TextField(
                      controller: newPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Enter New Password',
                        filled: true,
                        fillColor: Colors.white38,
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
                    SizedBox(height: 10,),
                    TextField(
                      controller: confirmNewPasswordController,
                      obscureText: true,
                      decoration: InputDecoration(
                        hintText: 'Retype New Password',
                        filled: true,
                        fillColor: Colors.white38,
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
                    SizedBox(height: 10,),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        primary: Color.fromRGBO(40, 175, 139, 1),
                        shape: RoundedRectangleBorder(
                          borderRadius: BorderRadius.circular(5.0),
                        ),
                        padding: EdgeInsets.symmetric(horizontal: 20.0),
                        minimumSize: Size(double.infinity, 45),
                      ),
                      onPressed: (){
                        handleChangePassword(context);
                      },
                      child: Text(
                        'Save',
                        style: TextStyle(
                          color: Colors.white,
                          fontSize: 16.0,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}