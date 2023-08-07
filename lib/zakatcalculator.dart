import 'package:flutter/material.dart';

class ZakatCalculatorPage extends StatefulWidget {
  @override
  _ZakatCalculatorPageState createState() => _ZakatCalculatorPageState();
}

class _ZakatCalculatorPageState extends State<ZakatCalculatorPage> {
  double goldAssets = 0.0;
  double silverAssets = 0.0;
  double otherSavedMoney = 0.0;
  double owedMoney = 0.0;
  double stockInvestments = 0.0;
  double payableZakat = 0.0;

  void _calculateZakat() {
    if(goldAssets<1635000){
      goldAssets = 0;
    }
    if(silverAssets<133035){
      silverAssets = 0;
    }
    payableZakat = (goldAssets + silverAssets + otherSavedMoney + stockInvestments) * 0.025 - owedMoney;
    if (payableZakat < 0) {
      payableZakat = 0.0;
    }
  }

  @override
  Widget build(BuildContext context) {
    var goldAssetsController = TextEditingController();
    var silverAssetsController = TextEditingController();
    var otherSavedMoneyController = TextEditingController();
    var owedMoneyController = TextEditingController();
    var stockInvestmentsController = TextEditingController();
    return Scaffold(
      appBar: AppBar(
        title: Text('Zakat Calculator'),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [

              const Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Enter Gold Reserves: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: goldAssetsController,
                  onTap: () {

                  },
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  
                  decoration: InputDecoration(
                    prefixText: "Rs. ",
                    fillColor: Colors.white38, // Background color
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Enter Silver Reserves: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: silverAssetsController,
                  onTap: () {

                  },
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,
                  decoration: InputDecoration(
                    prefixText: "Rs. ",

                    fillColor: Colors.white38, // Background color
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Enter Saved Money: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: otherSavedMoneyController,
                  onTap: () {

                  },
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(

                    prefixText: "Rs. ",
                    fillColor: Colors.white38, // Background color
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Enter Owed Money: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: owedMoneyController,
                  onTap: () {

                  },
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(

                    prefixText: "Rs. ",
                    fillColor: Colors.white38, // Background color
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 20,),
              Padding(
                padding: EdgeInsets.only(left: 15.0,right: 10.0),
                child: Align( alignment: Alignment.centerLeft, child: Text('Enter Stock Investments: ', style: TextStyle(fontSize: 15), textAlign: TextAlign.left,)),
              ),
              SizedBox(height: 15,),
              Padding(
                padding: const EdgeInsets.only(left: 10.0,right: 10.0),
                child: TextField(
                  controller: stockInvestmentsController,
                  onTap: () {

                  },
                  style: TextStyle(color: Colors.black),
                  keyboardType: TextInputType.number,

                  decoration: InputDecoration(

                    prefixText: "Rs. ",
                    fillColor: Colors.white38, // Background color
                    focusedBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                    enabledBorder: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10.0),
                      borderSide: BorderSide(color: Colors.black),
                    ),
                  ),
                ),
              ),
              SizedBox(height: 30,),

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
                    setState(() {
                      // Read the values from the text fields and update the variables
                      goldAssets = double.tryParse(goldAssetsController.text) ?? 0.0;
                      silverAssets = double.tryParse(silverAssetsController.text) ?? 0.0;
                      otherSavedMoney = double.tryParse(otherSavedMoneyController.text) ?? 0.0;
                      owedMoney = double.tryParse(owedMoneyController.text) ?? 0.0;
                      stockInvestments = double.tryParse(stockInvestmentsController.text) ?? 0.0;

                      // Calculate Zakat
                      _calculateZakat();
                    });
                  },
                  child: Text(
                    'Calculate Zakat',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 16.0,
                    ),
                  ),
                ),
              ),
              SizedBox(height: 10,),
              Text('Payable Zakat: Rs. $payableZakat', style: TextStyle(fontSize: 20),),
            ],
          ),
        ),
      ),
    );
  }
}
