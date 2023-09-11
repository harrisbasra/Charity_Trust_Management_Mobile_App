
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
                SizedBox(height: 20),
                Center(
                  child: Image.asset(
                    'assets/images/img.png',
                    width: 120,
                    height: 120,
                  ),
                ),
                SizedBox(height: 20),
                SizedBox(height: 20),
                Center(
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(10), // Rounded corners for the added image
                    child: Image.asset(
                      'assets/images/SIimage.png', // Path to the new image
                      // width: 200,
                      // height: 200,
                    ),
                  ),
                ),
                SizedBox(height: 20),
                Divider(),
                SizedBox(height: 60,),
                Padding(
                  padding: const EdgeInsets.only(left: 50, right: 50),
                  child: Center(
                    child: InkWell(
                      onTap: (){
                        Navigator.push(
                          context,
                          SlideFromRightPageRoute(enterPage: user_enters()),
                        );
                      },
                      child: Container(
                          width: MediaQuery.of(context).size.width * 0.8,
                          padding: EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                          decoration: BoxDecoration(
                            borderRadius: BorderRadius.circular(30),
                            color: Color.fromRGBO(129, 58, 50,0.8),
                          ),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                "Explore App",
                                style: TextStyle(
                                  fontSize: 16,
                                  fontWeight: FontWeight.bold,
                                  color: Colors.white,
                                ),
                              ),
                              CircleAvatar(
                                backgroundColor: Colors.grey,
                                radius: 20,
                                child: Icon(
                                  Icons.arrow_forward,
                                  color: Colors.white,
                                ),
                              ),
                            ],
                          ),
                      ),
                    ),
                  ),
                ),
                // Container(
                //   height: 60,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       primary: Color.fromRGBO(40, 175, 139, 1),
                //       //primary: Color.fromRGBO(0, 0, 0, 1),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       padding: EdgeInsets.symmetric(horizontal: 20.0),
                //       minimumSize: Size(double.infinity, 45),
                //     ),
                //     onPressed: (){
                //       Navigator.push(
                //         context,
                //         SlideFromRightPageRoute(enterPage: user_enters()),
                //       );
                //     },
                //     child: Text(
                //       'Explore App',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 20,
                //       ),
                //     ),
                //   ),
                // ),
                // Container(
                //   height: 60,
                //   child: ElevatedButton(
                //     style: ElevatedButton.styleFrom(
                //       primary: Color.fromRGBO(219, 185, 88, 1),
                //       shape: RoundedRectangleBorder(
                //         borderRadius: BorderRadius.circular(5.0),
                //       ),
                //       padding: EdgeInsets.symmetric(horizontal: 20.0),
                //       minimumSize: Size(double.infinity, 45),
                //     ),
                //     onPressed: (){
                //       Navigator.push(
                //         context,
                //         MaterialPageRoute(builder: (context) => admin_page()),
                //       );
                //     },
                //     child: Text(
                //       'Administrator Privilages',
                //       style: TextStyle(
                //         color: Colors.white,
                //         fontSize: 16.0,
                //       ),
                //     ),
                //   ),
                // ),
                Expanded(child: SizedBox(height: 10,),),
                const Divider(),
                SizedBox(height: 20),
                SizedBox(),
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(bottom: 20),
                    child: GestureDetector(
                      onTap: (){
                        Navigator.push(
                           context,
                           MaterialPageRoute(builder: (context) => admin_page()),
                        );
                      },
                      child: RichText(
                        text: const TextSpan(
                          style: TextStyle(
                            color: Colors.black,
                            fontSize: 14.0,
                            fontWeight: FontWeight.w600,
                          ),
                          children: [
                            TextSpan(text: 'Administrator?  ',
                              style: TextStyle(
                                color: Color.fromRGBO(0, 0, 0, 0.5),
                              ),
                            ),
                            TextSpan(
                              text: 'Click Here',
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

class SlideFromRightPageRoute extends PageRouteBuilder {
  final Widget enterPage;

  SlideFromRightPageRoute({required this.enterPage})
      : super(
    pageBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        ) =>
    enterPage,
    transitionsBuilder: (
        BuildContext context,
        Animation<double> animation,
        Animation<double> secondaryAnimation,
        Widget child,
        ) {
      const begin = Offset(1.0, 0.0);
      const end = Offset.zero;
      const curve = Curves.elasticInOut;

      var tween = Tween(begin: begin, end: end);
      var curvedAnimation = CurvedAnimation(
        parent: animation,
        curve: curve,
      );

      return SlideTransition(
        position: tween.animate(curvedAnimation),
        child: child,
      );
    },
  );
}



