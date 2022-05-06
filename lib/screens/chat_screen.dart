import 'package:chat_crud/chat_storage/chat/new_message.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

import '../chat_storage/chat/message.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  User? loggedUser;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() {
    try {
      final user = _auth.currentUser;
      if (user != null) {
        loggedUser = user;
        print(loggedUser!.email);
      }
    } catch(e) {
      print(e);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
            'Chat screen',
          style: TextStyle(
            color: Color(0xFFFFFFFF)
          ),
        ),
        backgroundColor: Color(0xFFD7777A),
        actions: [
          IconButton(
            onPressed: () {
              _auth.signOut();
          },
            icon: const Icon(
              Icons.exit_to_app_sharp,
              color: Color(0xFF6C1B1C),
            ),
          )
        ],
      ),
      body: Container(
        child: Column(
          children: [
            Expanded(
                child: Messages()
            ),
            NewMessage()
          ],
        ),
      )
    );
  }
}
