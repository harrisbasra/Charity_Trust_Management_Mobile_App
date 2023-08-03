import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProjectsPage extends StatelessWidget {
  void _acceptUser(String userId) {

  }

  void _denyUser(String userId) {

  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("List of Projects"),
        leading: IconButton(
          icon: Icon(Icons.arrow_back),
          onPressed: () => Navigator.pop(context),
        ),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            children: [
              UserRow(project: "Project 1", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 2", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 3", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 4", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 5", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 6", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 1", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 2", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 3", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 4", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 5", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
              UserRow(project: "Project 6", onAccept: () => _acceptUser("p1"), onDeny: () => _denyUser("p1"),),
            ],
          ),
        ),
      )
      // StreamBuilder<QuerySnapshot>(
      //   stream: FirebaseFirestore.instance.collection('users').where('valid', isEqualTo: false).snapshots(),
      //   builder: (context, snapshot) {
      //     if (!snapshot.hasData) {
      //       return Center(
      //         child: CircularProgressIndicator(),
      //       );
      //     }
      //
      //     List<User> userList = [];
      //     snapshot.data!.docs.forEach((doc) {
      //       userList.add(User(
      //         id: doc.id,
      //         name: doc['name'],
      //         valid: doc['valid'],
      //         email: doc['email'],
      //         password: doc['password'],
      //       ));
      //     });
      //
      //     return ListView.builder(
      //       itemCount: userList.length,
      //       itemBuilder: (context, index) {
      //         final user = userList[index];
      //         return UserRow(
      //           user: user,
      //           onAccept: () => _acceptUser(user.id),
      //           onDeny: () => _denyUser(user.id),
      //         );
      //       },
      //     );
      //   },
      // ),
    );
  }
}



class UserRow extends StatelessWidget {
  final String project;
  final void Function() onAccept;
  final void Function() onDeny;

  UserRow({required this.project, required this.onAccept, required this.onDeny});

  @override
  Widget build(BuildContext context) {
    return Card(
      elevation: 20,
      child: Padding(
        padding: const EdgeInsets.only(left: 20, right: 20, top: 10, bottom: 10),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(5),
              child: Container(
                    child: Row(
                      children: [
                        Text(project, style: TextStyle(fontSize: 20),),
                        Expanded(child: SizedBox(width: 10,)),
                        IconButton(
                          icon: Icon(Icons.check),
                          onPressed: onAccept,
                        ),
                        IconButton(
                          icon: Icon(Icons.clear),
                          onPressed: onDeny,
                        ),
                    ],
                  ),
                )
              ),
           // Divider(height: 10, thickness: 2),
          ],
        ),
      ),
    );
  }
}


