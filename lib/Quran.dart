import 'package:flutter/material.dart';
import 'package:quran/quran.dart' as quran;

class QuranApp extends StatefulWidget {
  const QuranApp({Key? key}) : super(key: key);

  @override
  State<QuranApp> createState() => _QuranAppState();
}

class _QuranAppState extends State<QuranApp> {
  final List<int> surahNumbers = List.generate(114, (index) => index + 1);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Padding(
        padding: const EdgeInsets.only(left: 8.0, right: 8, bottom: 8, top: 40),
        child: Container(
          decoration: BoxDecoration(
            border:  Border.all(
              color: Colors.black,
              width: 1.0,
            ),
            borderRadius: BorderRadius.circular(20),
          ),
          child: SafeArea(
            child: ListView.separated(
              itemCount: surahNumbers.length,
              separatorBuilder: (context, index) => Divider(
                color: Colors.transparent,
                height: 1,
              ),
              itemBuilder: (context, index) {
                final surahNumber = surahNumbers[index];
                final surahName = quran.getSurahName(surahNumber);
                return Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Padding(
                      padding: EdgeInsets.only(left: 8.0, right: 8, bottom: 8),
                      child: Center(
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.only(left: 10, right: 10),
                              child: ElevatedButton(
                                style: ElevatedButton.styleFrom(
                                  primary: Color.fromRGBO(219, 185, 88, 1),
                                  shape: RoundedRectangleBorder(
                                    borderRadius: BorderRadius.circular(5.0),
                                  ),
                                  padding: EdgeInsets.symmetric(horizontal: 20.0),
                                  minimumSize: Size(double.infinity, 45),
                                ),
                                onPressed: (){

                                },
                                child: Text(
                                 surahName,
                                  style: TextStyle(
                                    color: Colors.white,
                                    fontSize: 16.0,
                                  ),
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                    ),
                    ListView.builder(
                      shrinkWrap: true,
                      physics: NeverScrollableScrollPhysics(),
                      itemCount: quran.getVerseCount(surahNumber),
                      itemBuilder: (context, verseIndex) {
                        return ListTile(
                          title: Text(
                            quran.getVerse(surahNumber, verseIndex + 1, verseEndSymbol: true),
                            textAlign: TextAlign.right,
                          ),
                        );
                      },
                    ),
                  ],
                );
              },
            ),
          ),
        ),
      ),
    );
  }
}
