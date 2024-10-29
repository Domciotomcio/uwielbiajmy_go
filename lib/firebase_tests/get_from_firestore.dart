import 'package:flutter/material.dart';
import 'package:firebase_core/firebase_core.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

class GetFromFirestore extends StatelessWidget {
  final FirebaseFirestore firestore = FirebaseFirestore.instance;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      height: 500,
      child: Container(
        color: Theme.of(context).colorScheme.primaryContainer,
        child: Expanded(
          child: StreamBuilder<QuerySnapshot<Map<String, dynamic>>>(
              stream: firestore.collection('songs').snapshots(),
              builder: (context, snapshot) {
                if (snapshot.hasError) {
                  return Text('Error: ${snapshot.error}');
                }

                if (!snapshot.hasData) {
                  return const Text('Loading...');
                }

                return ListView.builder(
                  itemCount: snapshot.data?.docs.length,
                  itemBuilder: (context, index) {
                    final doc = snapshot.data?.docs[index];
                    print(doc?.data());
                    return ListTile(
                      title: Text(doc?['title']),
                      subtitle: Text("subtitle"),
                    );
                  },
                );
              }),
        ),
      ),
    );
  }
}
