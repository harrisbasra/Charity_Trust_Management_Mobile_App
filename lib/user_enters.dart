import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:test/MessageFromCEO.dart';
import 'package:test/ShowAudits.dart';
import 'package:test/Sponsor_A_Child.dart';
import 'package:test/splash_screen00.dart';
import 'package:test/zakatcalculator.dart';
import 'HijriCalendarPage.dart';
import 'package:intl/intl.dart';
import 'package:hijri/hijri_calendar.dart';
import 'Prayer_times.dart';
import 'ProductPage.dart';
import 'ProjectPage.dart';
import 'Quran.dart';


class user_enters  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
        key:scaffoldKey,
        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          child: Column(
            children: [
              Container(
                height: 300,
                decoration: const BoxDecoration(
                  image: DecorationImage(
                    image: AssetImage('assets/images/masjid.png'),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Column(
                  children: [
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 50, left: 20),
                          child: Container(
                            height: 40,
                            width: 40,
                            decoration: BoxDecoration(
                              color: Colors.white,
                              borderRadius: BorderRadius.circular(30),
                            ),
                            child: InkWell(
                              onTap: () {
                                scaffoldKey.currentState!.openDrawer();
                              },
                              child: const Icon(Icons.menu),
                            ),
                          ),
                        ),
                        const Expanded(child: SizedBox(width: 10)),
                        // Padding(
                        //   padding: const EdgeInsets.only(top: 50, right: 20),
                        //   child: Container(
                        //     decoration: BoxDecoration(
                        //       color: const Color.fromRGBO(185, 152, 121, 1),
                        //       borderRadius: BorderRadius.circular(20),
                        //     ),
                        //     child: const Padding(
                        //       padding: EdgeInsets.all(10.0),
                        //       child: Text("Sponsor a child", style: TextStyle(fontSize: 15, fontWeight: FontWeight.w400),),
                        //     ),
                        //   ),
                        // ),
                      ],
                    ),
                    Expanded(
                      child: Align(
                        alignment: Alignment.bottomLeft,
                        child: Padding(
                          padding: const EdgeInsets.all(16.0),
                          child: Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  getCurrentTime(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 40,
                                    fontWeight: FontWeight.w900,
                                  ),
                                ),
                              ),
                              const SizedBox(height: 8),
                              Padding(
                                padding: const EdgeInsets.only(left: 8.0),
                                child: Text(
                                  getHijriCalendarDate(),
                                  style: const TextStyle(
                                    color: Colors.white,
                                    fontSize: 20,
                                    fontWeight: FontWeight.bold,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),


              Padding(
                padding: const EdgeInsets.only(left: 20, right: 20),
                child: Column(
                  children: [
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                          alignment: Alignment.center,
                          child: Text("PROJECTS",
                            //textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          )
                      ),
                    ),
                    const SizedBox(height: 10,),
                    ClipRRect(
                      borderRadius: BorderRadius.circular(10),
                      child: Container(
                        color: const Color.fromRGBO(0, 0, 0, 0.3),
                        height: 260,
                        child: FutureBuilder<List<Project>>(
                          future: fetchProjectsFromDatabase(), // Fetch the projects from the database
                          builder: (context, snapshot) {
                            if (snapshot.connectionState == ConnectionState.waiting) {
                              return const Center(
                                child: CircularProgressIndicator(),
                              );
                            } else if (snapshot.hasError) {
                              return const Center(
                                child: Text('Error fetching projects'),
                              );
                            } else if (!snapshot.hasData) {
                              return const Center(
                                child: Text('No projects available'),
                              );
                            } else {
                              final projects = snapshot.data!;
                              return SingleChildScrollView(
                                child: Padding(
                                  padding: const EdgeInsets.all(8.0),
                                  child: Column(
                                    children: [
                                      for (var project in projects)
                                        ProjectCards(
                                          name: project.name,
                                          raisedAmount: project.raisedAmount,
                                          totalAmount: project.totalAmount,
                                          des: project.description,
                                        ),
                                    ],
                                  ),
                                ),
                              );
                            }
                          },
                        ),
                      ),
                    ),
                    const SizedBox(height: 15,),
                    const Padding(
                      padding: EdgeInsets.only(left: 8.0),
                      child: Align(
                          //alignment: Alignment.center,
                          child: Text("ACCESSORIES",
                            textAlign: TextAlign.center,
                            style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                          )
                      ),
                    ),
                    const SizedBox(height: 15,),
                    Row(
                      children: [
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(129, 58, 50,0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => ShowAudits()),
                                );
                              },
                              child: const Text(
                                "Audits",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(129, 58, 50,0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => NamazTimesPage()),
                                );
                              },
                              child: const Text(
                                "Prayers",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                        const SizedBox(width: 10),
                        Expanded(
                          child: Container(
                            height: 60,
                            decoration: BoxDecoration(
                              color: const Color.fromRGBO(129, 58, 50,0.8),
                              borderRadius: BorderRadius.circular(10),
                            ),
                            child: TextButton(
                              onPressed: () {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(builder: (context) => HijriCalender()),
                                );
                              },
                              child: const Text(
                                "Calender",
                                style: TextStyle(color: Colors.white, fontSize: 15),
                              ),
                            ),
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 15,),

                  ],
                ),
              ),
            ],
          ),
        ),
        drawer: Drawer(
        width: 280,
        child: Column(
          children: [
            const SizedBox(height: 30,),
            Container(
              padding: const EdgeInsets.all(16),
              color: Colors.white, // You can set your desired color here
              child:  Center(
                child: Image.asset(
                  'assets/images/img.png',
                  width: 110,
                  height: 110,
                ),
              ),
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.account_box_sharp),
              title: const Text('Introduction'),
              onTap: () {
                // Add your logic for the "Contact Us" button here
                Navigator.pop(context); // Close the drawer
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("CEO's Message"),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>CEOPage()));
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Sponsor a Child'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SponsorAChild()));
              },
            ),
            ListTile(
              leading: Icon(Icons.mail),
              title: Text('Contact Us'),
              onTap: () {
                // Add your logic for the "Contact Us" button here
                Navigator.pop(context); // Close the drawer
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.logout),
              title: Text('Logout'),
              onTap: () {
                Navigator.push(context, MaterialPageRoute(builder: (context)=>SplashScreen()));
              },
            ),
          ],
        ),
      ),
        bottomNavigationBar: Container(
          height: 70,
          child: Container(
            decoration: BoxDecoration(
              color: Color.fromRGBO(29, 53, 87,1),
              borderRadius: BorderRadius.only(topLeft: Radius.circular(10), topRight: Radius.circular(10), )
            ),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                GestureDetector(
                  onTap: () {},
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.home, size: 20, color: Colors.white,),
                      Text('Main Page', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => QuranApp()),
                    );

                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.book, size: 20, color: Colors.white,),
                      Text('Read Quran', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
                GestureDetector(
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(builder: (context) => ZakatCalculatorPage()),
                    );
                  },
                  child: const Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.calculate, size: 20, color: Colors.white,),
                      Text('Zakat', style: TextStyle(color: Colors.white)),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
    );
  }
  String getCurrentTime() {
    DateTime now = DateTime.now();
    String formattedTime = DateFormat('HH:mm').format(now);
    return formattedTime;
  }

  String getHijriCalendarDate() {
    HijriCalendar _today = HijriCalendar.now();

    return "${_today.hDay} ${_today.longMonthName.toString()} ${_today.hYear}";
  }
  Future<List<Project>> fetchProjectsFromDatabase() async {

    final snapshot = await FirebaseFirestore.instance.collection('projects').get();
    final projectsData = snapshot.docs.map((doc) => doc.data()).toList();


    return projectsData.map((data) => Project(
      name: data['projectName'].toString(),
      raisedAmount: data['alreadyCollected'].toString(),
      totalAmount: data['projectPrice'].toString(),
      description : data['projectDescription'].toString(),
    )).toList();
  }
}



class ProjectCards extends StatelessWidget {
  final String name;
  final String raisedAmount;
  final String totalAmount;
  final String des;

  ProjectCards({
    required this.name,
    required this.raisedAmount,
    required this.totalAmount,
    required this.des,
  });

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Card(
          elevation: 10,
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.center,
              children: [
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      name,
                      overflow: TextOverflow.ellipsis,
                      softWrap: true,
                      maxLines: 1,
                      style: const TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    const SizedBox(height: 8),
                    Text(
                      raisedAmount,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Color(0xFF28AF8B), // RGB Color (40, 175, 139)
                      ),
                    ),
                    Text(
                      totalAmount,
                      style: const TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                InkWell(
                  onTap: (){
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => ProjectPageX(name: name, raised: raisedAmount, total: totalAmount, des: des), // Pass documentID to BookPage
                      ),
                    );
                  },
                  child: const CircleAvatar(
                    radius: 18,
                    backgroundColor: Color.fromRGBO(29, 53, 87,0.8), // RGB Color (40, 175, 139)
                    child: Icon(
                      Icons.arrow_forward,
                      color: Colors.white,
                    ),
                  ),
                ),
              ],
            ),
          ),
        ),
        const SizedBox(height: 10,)
      ],
    );
  }



}
class Project {
  final String name;
  final String raisedAmount;
  final String totalAmount;
  final String description;

  Project({
    required this.name,
    required this.raisedAmount,
    required this.totalAmount,
    required this.description,
  });
}