import 'package:flutter/material.dart';
import 'package:hijri/hijri_calendar.dart';
import 'package:intl/intl.dart';
import 'package:jhijri_picker/_src/_jWidgets.dart';
import 'package:test/user_enters.dart';
import 'package:test/zakatcalculator.dart';

import 'Quran.dart';

class HijriCalender extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    final GlobalKey<ScaffoldState> _scaffoldKey = GlobalKey<ScaffoldState>();
    return Scaffold(
      key:_scaffoldKey,
      body: Column(
        children: [
          Container(
            height: 300,
            decoration: BoxDecoration(
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
                            _scaffoldKey.currentState!.openDrawer();
                          },
                          child: Icon(Icons.menu),
                        ),
                      ),
                    ),
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
                              style: TextStyle(
                                color: Colors.white,
                                fontSize: 40,
                                fontWeight: FontWeight.w900,
                              ),
                            ),
                          ),
                          SizedBox(height: 8),
                          Padding(
                            padding: const EdgeInsets.only(left: 8.0),
                            child: Text(
                              getHijriCalendarDate(),
                              style: TextStyle(
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
          SizedBox(height: 20,),
          Padding(
            padding: const EdgeInsets.only(left: 8.0),
            child: Align(
                alignment: Alignment.center,
                child: Text("ISLAMIC CALENDER",
                  //textAlign: TextAlign.center,
                  style: TextStyle(fontSize: 20, fontWeight: FontWeight.w400),
                )
            ),
          ),
          SizedBox(height: 5,),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 10),
                JGlobalDatePicker(
                  widgetType: WidgetType.JContainer,
                  pickerType: PickerType.JHijri,
                  buttons: const SizedBox(),
                  primaryColor: Colors.blue,
                  calendarTextColor: Colors.black,
                  backgroundColor: Color.fromRGBO(255, 250, 255, 1),
                  borderRadius: const Radius.circular(10),
                  startDate: JDateModel(dateTime: DateTime.parse("1984-12-24")),
                  selectedDate: JDateModel(dateTime: DateTime.now()),
                  endDate: JDateModel(dateTime: DateTime.parse("2030-09-20")),
                  pickerMode: DatePickerMode.day,
                  pickerTheme: Theme.of(context),
                  onChange: (val) {
                    debugPrint(val.toString());
                  },
                )
              ],
            ),
          ),
        ],
      ),
      drawer: Drawer(
        width: 280,
        child: Column(
          children: [
            SizedBox(height: 30,),
            Container(
              padding: EdgeInsets.all(16),
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
              title: Text('Introduction'),
              onTap: () {
                // Add your logic for the "Contact Us" button here
                Navigator.pop(context); // Close the drawer
              },
            ),
            Divider(),
            ListTile(
              leading: Icon(Icons.monetization_on_rounded),
              title: Text("View All Projects"),
              onTap: () {
                // Add your logic for the "CEO's Message" button here
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.info),
              title: Text('About Us'),
              onTap: () {
                // Add your logic for the "About Us" button here
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.message),
              title: Text("CEO's Message"),
              onTap: () {
                // Add your logic for the "CEO's Message" button here
                Navigator.pop(context); // Close the drawer
              },
            ),
            ListTile(
              leading: Icon(Icons.group),
              title: Text('Board of Governors'),
              onTap: () {
                // Add your logic for the "Board of Governors" button here
                Navigator.pop(context); // Close the drawer
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
                // Add your logic for the "Logout" button here
                Navigator.pop(context); // Close the drawer
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
                child: Column(
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
                child: Column(
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
}
