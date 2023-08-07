import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:firebase_database/firebase_database.dart';
import 'package:cached_network_image/cached_network_image.dart';


class ShowAudits extends StatefulWidget {
  @override
  _MyShowAuditsState createState() => _MyShowAuditsState();
}

class _MyShowAuditsState extends State<ShowAudits> {
  PageController _pageController = PageController(initialPage: 0);
  DatabaseReference _databaseReference = FirebaseDatabase.instance.reference();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Swipe Page'),
      ),
      body: PageView(
        controller: _pageController,
        children: [
          SectionPage(sectionName: "Grocery", node: "grocery", databaseReference: _databaseReference),
          SectionPage(sectionName: "Stationary", node: "stationary", databaseReference: _databaseReference),
          SectionPage(sectionName: "Students", node: "students", databaseReference: _databaseReference),
        ],
      ),
      bottomNavigationBar: Row(
        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
        children: [
          IconButton(
            icon: Icon(Icons.arrow_back),
            onPressed: () {
              _pageController.previousPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
          IconButton(
            icon: Icon(Icons.arrow_forward),
            onPressed: () {
              _pageController.nextPage(
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
          ),
        ],
      ),
    );
  }
}

class SectionPage extends StatefulWidget {
  final String sectionName;
  final String node;
  final DatabaseReference databaseReference;

  SectionPage({
    required this.sectionName,
    required this.node,
    required this.databaseReference,
  });

  @override
  _SectionPageState createState() => _SectionPageState();
}

class _SectionPageState extends State<SectionPage> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImagesFromFirebase();
  }

  void _loadImagesFromFirebase() {
    widget.databaseReference.child(widget.node).onValue.listen((event) {
      DataSnapshot snapshot = event.snapshot;
      Iterable<dynamic> values = snapshot.value as Iterable<dynamic>;
      setState(() {
        imageUrls = List<String>.from(values.map((item) => item.toString()));
      });
    }, onError: (error) {
      print("Error loading images: $error");
    });
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(20.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.stretch,
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Text(
            widget.sectionName,
            style: TextStyle(fontSize: 24, fontWeight: FontWeight.bold),
            textAlign: TextAlign.center,
          ),
          SizedBox(height: 20),
          Expanded(
            child: PageView.builder(
              itemCount: imageUrls.length,
              itemBuilder: (context, index) {
                return Container(
                  padding: EdgeInsets.all(20),
                  decoration: BoxDecoration(
                    border: Border.all(color: Colors.grey),
                  ),
                  child: CachedNetworkImage(
                    imageUrl: imageUrls[index],
                    placeholder: (context, url) => CircularProgressIndicator(),
                    errorWidget: (context, url, error) => Icon(Icons.error),
                    fit: BoxFit.contain,
                  ),
                );
              },
            ),
          ),
        ],
      ),
    );
  }
}
