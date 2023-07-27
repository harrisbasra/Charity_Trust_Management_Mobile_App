import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

List<String> names = ['Item 1', 'Item 2', 'Item 3'];
List<String> raised = ['10', '20', '30', '40', '50', '60'];
List<String> total = ['20', '30', '40', '50', '60', '70'];

class user_enters  extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(

        backgroundColor: Colors.white,
        body: SingleChildScrollView(
          padding: EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            children: [
              SizedBox(height: 50,),
              Center(
                child: Image.asset(
                  'assets/images/img.png',
                  width: 110,
                  height: 110,
                ),
              ),
              Row(
                children: [
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(40, 175, 139, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle first button tap
                        },
                        child: Text(
                          "About Us",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                  SizedBox(width: 10),
                  Expanded(
                    child: Container(
                      height: 120,
                      decoration: BoxDecoration(
                        color: Color.fromRGBO(99, 101, 100, 1),
                        borderRadius: BorderRadius.circular(10),
                      ),
                      child: TextButton(
                        onPressed: () {
                          // Handle second button tap
                        },
                        child: Text(
                          "Audits",
                          style: TextStyle(color: Colors.white, fontSize: 20),
                        ),
                      ),
                    ),
                  ),
                ],
              ),

              SizedBox(height: 20),
              
              Padding(
                padding: const EdgeInsets.only(left: 8.0),
                child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text("Projects: ",
                      style: TextStyle(fontSize: 20, fontWeight: FontWeight.w600),
                    )
                ),
              ),
              SizedBox(height: 10,),
              // for (int i = 0; i < 5; i++)
              //   ProjectCards(name: names[i],totalAmount: total[i],raisedAmount: raised[i],),
              ProjectCards(name: "p1", raisedAmount: "100", totalAmount: "200"),
              ProjectCards(name: "p1", raisedAmount: "100", totalAmount: "200"),
              ProjectCards(name: "p1", raisedAmount: "100", totalAmount: "200"),

              SizedBox(height: 10),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(219, 188, 85, 1),
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
                  'Message From CEO',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                  primary: Color.fromRGBO(219, 188, 85, 1),
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
                  'Contact Details',
                  style: TextStyle(
                    color: Colors.white,
                    fontSize: 16.0,
                  ),
                ),
              ),
            ],
          ),
        ),
      );
  }
}



class ProjectCards extends StatelessWidget {
  final String name;
  final String raisedAmount;
  final String totalAmount;

  ProjectCards({
    required this.name,
    required this.raisedAmount,
    required this.totalAmount,
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
                      style: TextStyle(
                        fontSize: 20,
                        fontWeight: FontWeight.w600,
                        color: Colors.black,
                      ),
                    ),
                    SizedBox(height: 8),
                    Text(
                      'Raised: ${raisedAmount} PKR',
                      style: TextStyle(
                        fontSize: 10,
                        color: Color(0xFF28AF8B), // RGB Color (40, 175, 139)
                      ),
                    ),
                    Text(
                      'Total: ${totalAmount} PKR',
                      style: TextStyle(
                        fontSize: 10,
                        color: Colors.black,
                      ),
                    ),
                  ],
                ),
                CircleAvatar(
                  radius: 18,
                  backgroundColor: Color(0xFF28AF8B), // RGB Color (40, 175, 139)
                  child: Icon(
                    Icons.arrow_forward,
                    color: Colors.white,
                  ),
                ),
              ],
            ),
          ),
        ),
        SizedBox(height: 10,)
      ],
    );
  }
}
