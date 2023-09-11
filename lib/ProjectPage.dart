import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/Bank_Page.dart';

class ProjectPageX extends StatelessWidget {
  final String Name;
  final String Raised;
  final String Total;
  final String des;


  ProjectPageX({required this.Name, required this.Raised, required this.Total, required this.des});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Column(
          children: [
            Stack(
              children: [
                Container(
                  height: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  color: Color.fromRGBO(255, 255, 255, 1.0),
                ),
                Positioned.fill(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height / 10,
                  child: Center(
                    child: Image.asset(
                      'assets/images/img.png',
                      height: 200,
                      width: 200,
                    ),
                  ),
                ),
                Positioned(
                  top: MediaQuery
                      .of(context)
                      .size
                      .height / 2,
                  child: Container(
                    width: MediaQuery
                        .of(context)
                        .size
                        .width,
                    padding: EdgeInsets.only(bottom: 20),
                    color: Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                ),
              ],
            ),
            SizedBox(height: 20),
            Expanded(
              flex: 1,
              child: Padding(
                padding: const EdgeInsets.only(left: 8.0, right: 8.0),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        Name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 40,),
                    Text(
                      maxLines: 3,
                      Raised,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.left,

                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 24),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      maxLines: 3,
                      Total,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.left,

                      style: TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 24),
                    ),
                    SizedBox(height: 10,),
                    Center(
                      child: Text(
                        maxLines: 3,
                        des,

                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,

                        style: TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 24),
                      ),
                    ),
                    Expanded(flex: 2, child: SizedBox(height: 150)),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 40,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(241, 59, 58, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                        onTap: () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => BankAccountsApp(), // Pass documentID to BookPage
                            ),
                          );
                        },
                        child: Center(
                          child: Text(
                            "Donate Charity",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
