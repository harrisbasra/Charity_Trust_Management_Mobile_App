import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


class BankAccount {
  final String name;
  final String accountNumber;
  final String iban;
  final String title;
  final String swift;

  BankAccount({required this.name, required this.accountNumber, required this.iban, required this.title, required this.swift});
}

class BankAccountsApp extends StatelessWidget {

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Charity Bank Accounts'),
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.only(
            bottomLeft: Radius.circular(10.0),
            bottomRight: Radius.circular(10.0),
          ),
        ),
        backgroundColor: Color.fromRGBO(129, 58, 50, 0.8),
      ),
        body: Container(
          child: Column(
            children: [
              Expanded(child: SizedBox(height: 10,)),
              BankAccountCard(bankAccount: BankAccount(name: 'Dubai Islamic Bank', accountNumber: '0247137001', iban: 'PK63 DUIB 0000 0002 47137001', title: 'Janat ul firdous charitable trust', swift: 'DUIBPKKA')),
              BankAccountCard(bankAccount: BankAccount(name: 'Silk Bank', accountNumber: '2008531245', iban: 'PK48 SAUD 0000 262008531245', title: 'Janat ul firdous charitable trust', swift: 'DUIBPKKA')),
              BankAccountCard(bankAccount: BankAccount(name: 'UBL Aameen Bank', accountNumber: '100-0222-0', iban: 'PK23 UNIL 0112 0863 10002220', title: 'Janat ul firdous charitable trust', swift: 'DUIBPKKA')),
              Expanded(child: SizedBox(height: 10,)),
            ],
          ),
        ),
      );
  }
}

class BankAccountCard extends StatelessWidget {
  final BankAccount bankAccount;

  BankAccountCard({required this.bankAccount});

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: (){
        Clipboard.setData(
            ClipboardData(text: bankAccount.iban));
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(
                content: Text('IBAN copied to clipboard'),
                duration: Duration(seconds: 2),
              ),
            );
      },
      child: Card(
        color: Color.fromRGBO(129, 58, 50,0.8),
        elevation: 10,
        margin: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
        child: ListTile(
          subtitle: Column(
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Text(bankAccount.name, style: TextStyle(fontSize: 25, color: Colors.white),),
              Text('Title: ${bankAccount.title}', style: TextStyle(color: Colors.white),),
              Text('Account Number: ${bankAccount.accountNumber}', style: TextStyle(color: Colors.white),),
              Text('IBAN: ${bankAccount.iban}', style: TextStyle(color: Colors.white),),
              Text('Swift: ${bankAccount.swift}', style: TextStyle(color: Colors.white),),
            ],
          ),
        ),
      ),
    );
  }
}
