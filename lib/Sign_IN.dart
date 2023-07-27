
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:test/admin_page.dart';
import 'package:test/user_enters.dart';


class sign_in extends StatefulWidget{
  @override
  State<sign_in> createState() => _sign_inState();
}

class _sign_inState extends State<sign_in> {
  TextEditingController signinEmailCont = TextEditingController();
  TextEditingController signinPassCont = TextEditingController();
  bool checkbox = false;
  bool hidden = false;
  @override
  Widget build(BuildContext context) {

    return Scaffold(
        resizeToAvoidBottomInset: false,
        body:  Padding(
          padding: const EdgeInsets.all(20.0),
          child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Expanded(flex: 1, child: SizedBox(height: 20)),
                Center(
                  child: Image.asset(
                    'assets/images/img.png',
                    width: 190,
                    height: 190,
                  ),
                ),
                Expanded(flex: 1, child: SizedBox(height: 20)),
                SizedBox(height: 20),
                Padding(
                  padding: const EdgeInsets.only(left: 20, right: 20),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => user_enters()),
                      );
                    },
                    child: Text(
                      'Explore App',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 16.0,
                      ),
                    ),
                  ),
                ),
                SizedBox(height: 20),
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
                      Navigator.push(
                        context,
                        MaterialPageRoute(builder: (context) => admin_page()),
                      );
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
                SizedBox(height: 20),
                Expanded(flex: 1, child: SizedBox()),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: (){},
                      child: RichText(
                        text: TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(text: 'Have Queries?  ',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                              ),
                            ),
                            TextSpan(
                              text: 'Contact Us',
                              style: TextStyle(
                                color: Color.fromRGBO(219, 185, 88, 0.5),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                  ),
                ),

              ]
          ),
        )
    );

  }
}


