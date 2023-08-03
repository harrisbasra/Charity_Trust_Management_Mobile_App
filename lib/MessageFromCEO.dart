import 'package:flutter/material.dart';

class CEOPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Message From CEO'),
      ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Container(
                width: 160,
                height: 160,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  border: Border.all(
                    color: Color.fromRGBO(219, 188, 85, 1),
                    width: 8,
                  ),
                ),
                child: ClipOval(
                  child: Image.asset(
                    'assets/images/user.png', // Replace this with the CEO's picture
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              SizedBox(height: 20),
              Card(
                elevation: 20,
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    'Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed magna nisi, pulvinar a eros a, egestas ultricies nisl. Nam tempor enim eget nibh mattis, id vestibulum felis convallis. Sed finibus nibh nec diam varius tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin eget libero justo. Nunc vel diam vel risus tincidunt posuere. Morbi non metus sed enim porta tempor vel eu leo. Aenean nibh neque, porta quis ante at, finibus viverra erat. Duis condimentum convallis viverra. Morbi efficitur egestas arcu ut scelerisque. Vivamus risus enim, euismod vitae pharetra ut, lobortis id erat.',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),
              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20, bottom: 10, top: 10),
                child: ElevatedButton(
                  style: ElevatedButton.styleFrom(
                    primary: Color.fromRGBO(40, 175, 139, 1),
                    //primary: Color.fromRGBO(0, 0, 0, 1),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(5.0),
                    ),
                    padding: EdgeInsets.symmetric(horizontal: 20.0),
                    minimumSize: Size(double.infinity, 45),
                  ),
                  onPressed: (){
                    Navigator.pop(context);
                  },
                  child: Text(
                    'Endorse',
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
