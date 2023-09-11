import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:cached_network_image/cached_network_image.dart';

class ShowAudits extends StatefulWidget {
  @override
  _MyShowAuditsState createState() => _MyShowAuditsState();
}

class _MyShowAuditsState extends State<ShowAudits> {
  PageController _pageController = PageController(initialPage: 0);
  FirebaseFirestore _firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(top: 20),
        child: PageView(
          controller: _pageController,
          children:
          [
            SectionPage(sectionName: "Grocery", collection: "grocery", firestore: _firestore),
            SectionPage(sectionName: "Stationary", collection: "stationary", firestore: _firestore),
            SectionPage(sectionName: "Students", collection: "students", firestore: _firestore),
          ],
        ),
      ),
      bottomNavigationBar: Container(
        height: 100,
        child: Column(
          children: [
            Divider(),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                IconButton(
                  icon: Icon(Icons.arrow_back, size: 30,),
                  onPressed: () {
                    _pageController.previousPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
                IconButton(
                  icon: Icon(Icons.arrow_forward, size: 30,),
                  onPressed: () {
                    _pageController.nextPage(
                      duration: Duration(milliseconds: 100),
                      curve: Curves.easeInOut,
                    );
                  },
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class SectionPage extends StatefulWidget {
  final String sectionName;
  final String collection;
  final FirebaseFirestore firestore;

  SectionPage({
    required this.sectionName,
    required this.collection,
    required this.firestore,
  });

  @override
  _SectionPageState createState() => _SectionPageState();
}

class _SectionPageState extends State<SectionPage> {
  List<String> imageUrls = [];

  @override
  void initState() {
    super.initState();
    _loadImagesFromFirestore();
  }

  void _loadImagesFromFirestore() async {
    try {
      QuerySnapshot snapshot = await widget.firestore.collection(widget.collection).get();
      setState(() {
        imageUrls = snapshot.docs.map((doc) => doc.get('link').toString()).toList();
      });
    } catch (error) {
      print("Error loading images: $error");
    }
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
