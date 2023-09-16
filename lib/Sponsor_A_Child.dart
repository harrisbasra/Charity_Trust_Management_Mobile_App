import 'package:flutter/material.dart';

class SponsorAChild extends StatefulWidget {
  @override
  _SponsorAChildState createState() => _SponsorAChildState();
}

class _SponsorAChildState extends State<SponsorAChild> {

  @override
  Widget build(BuildContext context) {
    var nameController = TextEditingController();
    var contactcontroller = TextEditingController();
    var numberofChildrenController = TextEditingController();
    var remarkscontroller = TextEditingController();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Sponsor A Child'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Enter Your Name: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: nameController,
                  onTap: () {

                  },
                  style: TextStyle(color: Colors.black),


                  decoration: InputDecoration(
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
              SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Enter Contact details: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: contactcontroller,
                  onTap: () {

                  },
                  style: TextStyle(color: Colors.black),
                  decoration: InputDecoration(
                    prefixText: "",

                    fillColor: Colors.white38, // Background color
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: const BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              const SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Enter No. Of Children to Sponsor: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              const SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: numberofChildrenController,
                  onTap: () {

                  },
                  style: const TextStyle(color: Colors.black),

                  decoration: InputDecoration(

                    prefixText: "",
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
              SizedBox(height: 20,),
              const Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Any Remarks (Optional)', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: remarkscontroller,
                  onTap: () {

                  },
                  style: TextStyle(color: Colors.black),
                  maxLines: 5,
                  decoration: InputDecoration(
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
              SizedBox(height: 30,),
              Padding(
                padding: const EdgeInsets.only(left: 10, right: 10),
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
                    setState(() {

                    });
                  },
                  child: const Text(
                    'Sponsor',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
