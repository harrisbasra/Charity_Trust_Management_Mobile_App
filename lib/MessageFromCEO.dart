import 'package:flutter/material.dart';

class CEOPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // appBar: AppBar(
      //   title: Text('Message From CEO'),
      // ),
      body: SingleChildScrollView(
        child: Center(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              SizedBox(height: 40,),
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
                    'assets/images/isx.jpg',
                    fit: BoxFit.cover,
                    width: 150,
                    height: 150,
                  ),
                ),
              ),
              const SizedBox(height: 20),
              const Card(
                elevation: 20,
                margin: EdgeInsets.all(20),
                child: Padding(
                  padding: EdgeInsets.all(20),
                  child: Text(
                    '''In a world where kindness often feels scarce, JUFT stands as a beacon of hope and compassion. As the CEO of this remarkable charity, I've had the privilege of witnessing firsthand the incredible impact our projects have on the lives of those in need. For years, we have been extending a helping hand to the most vulnerable members of our community, providing them with education, clean water, sustenance, and a chance at a brighter future. Our journey has been one of unwavering commitment and tireless dedication, and it's a journey that continues to grow stronger with each passing day.
                    \nI urge you to join us in this incredible mission. Together, we can transform lives and make a lasting difference. Your support, whether big or small, is a powerful catalyst for change. Let's write a new chapter of hope, compassion, and empowerment. Join us in making a positive change that echoes for generations to come.''',
                    textAlign: TextAlign.justify,
                    style: TextStyle(
                      fontStyle: FontStyle.italic,
                      fontSize: 18,
                    ),
                  ),
                ),
              ),

            ],
          ),
        ),
      ),
      bottomNavigationBar: Padding(
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
          child: const Text(
            'Endorse',
            style: TextStyle(
              color: Colors.white,
              fontSize: 16.0,
            ),
          ),
        ),
      ),
    );
  }
}
