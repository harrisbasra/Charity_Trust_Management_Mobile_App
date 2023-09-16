import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:test/Bank_Page.dart';

class ProjectPageX extends StatelessWidget {
  final String name;
  final String raised;
  final String total;
  final String des;


  ProjectPageX({required this.name, required this.raised, required this.total, required this.des});

  @override
  Widget build(BuildContext context) {
    String imagePath = 'assets/images/img.png'; // Default image path
    bool surbex = false;
    if (name == "Al Jannat Home") {
      imagePath = 'assets/images/csr.jpg';
      surbex = true;
    } else if (name == "Apna Rozgar Scheme") {
      imagePath = 'assets/images/bhk.jpg';
      surbex = true;
    } else if (name == "Disaster Relief") {
      imagePath = 'assets/images/uaq.jpg';
      surbex = true;
    }

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
                  color: const Color.fromRGBO(255, 255, 255, 1.0),
                ),
                Positioned.fill(
                  // top: MediaQuery
                  //     .of(context)
                  //     .size
                  //     .height / 10,
                  child: Center(
                    child: Image.asset(
                      imagePath,
                      height: surbex==true? MediaQuery.of(context).size.height:200,
                      width: surbex==true? MediaQuery.of(context).size.width:200,
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
                    padding: const EdgeInsets.only(bottom: 20),
                    color: const Color.fromRGBO(255, 255, 255, 1.0),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
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
                        name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: const TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                    const SizedBox(height: 40,),
                    Text(
                      maxLines: 3,
                      raised,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.left,

                      style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 24),
                    ),
                    const SizedBox(height: 10,),
                    Text(
                      maxLines: 3,
                      total,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.left,

                      style: const TextStyle(
                          color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 24),
                    ),
                    const SizedBox(height: 10,),
                    Center(
                      child: Text(
                        maxLines: 3,
                        des,

                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.center,

                        style: const TextStyle(
                            color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 24),
                      ),
                    ),
                    const Expanded(flex: 2, child: SizedBox(height: 150)),
                    Container(
                      width: MediaQuery
                          .of(context)
                          .size
                          .width - 40,
                      height: 60,
                      decoration: BoxDecoration(
                        color: const Color.fromRGBO(241, 59, 58, 1),
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
                        child: const Center(
                          child: Text(
                            "Donate Charity",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 10,)
                  ],
                ),
              ),
            ),
          ],
        )
    );
  }
}
