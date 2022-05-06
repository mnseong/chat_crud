import 'package:flutter/material.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';

class NewMessage extends StatefulWidget {
  const NewMessage({Key? key}) : super(key: key);

  @override
  State<NewMessage> createState() => _NewMessageState();
}

class _NewMessageState extends State<NewMessage> {
  final _controller = TextEditingController();
  var _enterMsg = '';

  void _sendMsg() {
    FocusScope.of(context).unfocus();
    final user = FirebaseAuth.instance.currentUser;
    FirebaseFirestore.instance.collection('chat').add({
      'text' : _enterMsg,
      'time' : Timestamp.now(),
      'userID' : user!.uid,
    });
    _controller.clear();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      margin: const EdgeInsets.only(top: 8),
      padding: const EdgeInsets.all(8),
      child: Row(
        children: [
          Expanded(
            child: Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: TextField(
                maxLines: null,
                controller: _controller,
                decoration: const InputDecoration(
                  labelText: 'Send your message...',
                  labelStyle: TextStyle(color: Color(0xFFD7777A)),
                ),
                onChanged: (value) {
                  setState(() {
                    _enterMsg = value;
                  });
                },
              ),
            ),
          ),
          IconButton(
              onPressed: _enterMsg.trim().isEmpty ? null : _sendMsg,
              icon: const Icon(Icons.send),
              color: const Color(0xFF5F4818),
          ),
        ],
      ),
    );
  }
}
