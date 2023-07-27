import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class admin_enters extends StatelessWidget{
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('ADMIN PORTAL'),
        actions: [
          IconButton(
            icon: const Icon(Icons.add),
            onPressed: () {
              // Navigator.push(
              //   context,
              //   MaterialPageRoute(builder: (context) => AddPhone()),
              // );
            },
          ),
        ],
      ),
    );
  }

}