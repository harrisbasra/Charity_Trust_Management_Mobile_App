import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class UpdateProjectsPage extends StatelessWidget {
  void _completeProject(String projectId) {
    FirebaseFirestore.instance.collection("projects").doc(projectId).get().then((doc) {
      if (doc.exists) {
        FirebaseFirestore.instance.collection("pastProjects").doc(projectId).set(doc.data()!);
        FirebaseFirestore.instance.collection("projects").doc(projectId).delete();
      }
    });
  }

  void _deleteProject(String projectId) {
    FirebaseFirestore.instance.collection("projects").doc(projectId).delete();
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
      body: StreamBuilder<QuerySnapshot>(
        stream: FirebaseFirestore.instance.collection("projects").snapshots(),
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Text("Error: ${snapshot.error}");
          }

          if (snapshot.connectionState == ConnectionState.waiting) {
            return CircularProgressIndicator();
          }

          final projects = snapshot.data?.docs ?? [];

          return SingleChildScrollView(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: projects.map((project) {
                  final projectId = project.id;
                  final projectData = project.data() as Map<String, dynamic>?; // Add the type cast here

                  final projectName = projectData?['projectName'] as String?; // Add the type cast here

                  return ProjectRow(
                    project: projectName ?? 'Unknown Project', // Provide a default value in case projectName is null
                    onAccept: () => _completeProject(projectId),
                    onDeny: () => _deleteProject(projectId),
                  );
                }).toList(),
              ),
            ),
          );
        },
      ),
    );
  }
}

class ProjectRow extends StatelessWidget {
  final String project;
  final void Function() onAccept;
  final void Function() onDeny;

  ProjectRow({required this.project, required this.onAccept, required this.onDeny});

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
              ),
            ),
          ],
        ),
      ),
    );
  }
}
