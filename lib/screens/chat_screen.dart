import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  const ChatScreen({Key? key}) : super(key: key);

  @override
  State<ChatScreen> createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {

  // @override
  // void initState() {
  //   super.initState();
  //   getCurrentUser();
  // }
  //
  // void getCurrentUser() {
  //   try {
  //     final user = _authentication.currentUser;
  //     if (user != null) {
  //       loggedUser = user;
  //       print(loggedUser!.email);
  //     }
  //   } catch(e) {
  //     print(e);
  //   }
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Chat screen'),
        actions: [
          IconButton(onPressed: () {
            Navigator.pop(context);
          },
            icon: Icon(
              Icons.exit_to_app_sharp,
              color: Colors.white,
            ),
          )
        ],
      ),
      body: Center(
        child: Text('Chat screen'),
      ),
    );
  }
}
