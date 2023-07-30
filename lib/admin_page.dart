import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import 'admin_enters.dart';

class admin_page extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    final TextEditingController Password = TextEditingController();
    return Scaffold(
      appBar:AppBar(
        title: Text('Verification'),
        actions: [

        ],
      ),
      body: Column(
        children: [
          SizedBox(height: 40,),
          const Padding(
            padding: EdgeInsets.only(left: 15.0,right: 10.0),
            child: Align( alignment: Alignment.centerLeft, child: Text('Enter PassCode: ', style: TextStyle(fontSize: 20), textAlign: TextAlign.left,)),
          ),
          SizedBox(height: 15,),
          Padding(
            padding: const EdgeInsets.only(left: 10.0,right: 10.0),
            child: TextField(
              onTap: () {

              },
              controller: Password,
              style: TextStyle(color: Colors.black),
              enableInteractiveSelection: false,
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'Enter Admin Passcode',
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
          Expanded(flex: 1, child: SizedBox(height: 10,),),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: ElevatedButton(
              style: ElevatedButton.styleFrom(
                primary: Color.fromRGBO(219, 185, 88, 1),
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(5.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 20.0),
                minimumSize: Size(double.infinity, 45),
              ),
              onPressed: (){
                if(Password.text=="ABC"){
                  Navigator.push(
                    context,
                    MaterialPageRoute(builder: (context) => admin_enters()),
                  );
                }
                else{
                  ScaffoldMessenger.of(context).showSnackBar(const SnackBar(
                    content: Text("Invalid Password"),
                  ));
                }
              },
              child: Text(
                'Administrator Privilages',
                style: TextStyle(
                  color: Colors.white,
                  fontSize: 16.0,
                ),
              ),
            ),
          ),
          SizedBox(height: 20,),
        ],
      ),
    );
  }

}