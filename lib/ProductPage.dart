import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';


class ProjectPage extends StatelessWidget {
  final String project_name;

  ProjectPage({required this.project_name});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
            children: [
              Stack(
                children: [
                  Container(
                    height: MediaQuery.of(context).size.height / 2,
                    color: Color.fromRGBO(34, 40, 98, 1),
                  ),
                  Positioned.fill(
                    top: MediaQuery.of(context).size.height / 10,
                    child: Center(
                      child: Image.asset(
                        'assets/images/book.png',
                        height: 200,
                        width: 200,
                      ),
                    ),
                  ),
                  Positioned(
                    top: MediaQuery.of(context).size.height / 2,
                    child: Container(
                      width: MediaQuery.of(context).size.width,
                      padding: EdgeInsets.only(bottom: 20),
                      color: Color.fromRGBO(34, 40, 98, 1),
                    ),
                  ),
                ],
              ),
              SizedBox(height: 20),
              Expanded(
                flex: 1,
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.only(left: 20, right: 20),
                      child: Text(
                        project_name,
                        maxLines: 3,
                        overflow: TextOverflow.ellipsis,
                        softWrap: true,
                        textAlign: TextAlign.left,
                        style: TextStyle(color: Colors.black, fontSize: 24),
                      ),
                    ),
                    SizedBox(height: 10,),
                    Text(
                      maxLines: 3,
                      "Lorem ipsum dolor sit amet, consectetur adipiscing elit. Sed magna nisi, pulvinar a eros a, egestas ultricies nisl. Nam tempor enim eget nibh mattis, id vestibulum felis convallis. Sed finibus nibh nec diam varius tristique. Pellentesque habitant morbi tristique senectus et netus et malesuada fames ac turpis egestas. Proin eget libero justo. Nunc vel diam vel risus tincidunt posuere. Morbi non metus sed enim porta tempor vel eu leo. Aenean nibh neque, porta quis ante at, finibus viverra erat. Duis condimentum convallis viverra. Morbi efficitur egestas arcu ut scelerisque. Vivamus risus enim, euismod vitae pharetra ut, lobortis id erat.",
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      textAlign: TextAlign.left,

                      style: TextStyle(color: Color.fromRGBO(0, 0, 0, 0.5), fontSize: 18),
                    ),
                    Expanded(flex: 2, child: SizedBox(height: 150)),
                    Container(
                      width: MediaQuery.of(context).size.width - 40,
                      height: 60,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(241, 59, 58, 1),
                        borderRadius: BorderRadius.circular(30),
                      ),
                      child: InkWell(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => ReadBookPage(bookId: ID, USER: USER), // Pass documentID to BookPage
                          //   ),
                          // );
                        },
                        child: Center(
                          child: Text(
                            "Donate",
                            style: TextStyle(color: Colors.white, fontSize: 18),
                          ),
                        ),
                      ),
                    ),
                    SizedBox(height: 10,)
                  ],
                ),
              ),
            ],
        )
    );
  }
}
