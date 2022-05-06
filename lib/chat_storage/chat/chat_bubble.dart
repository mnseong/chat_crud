import 'package:flutter/material.dart';

class ChatBubble extends StatelessWidget {
  const ChatBubble(this.msg, this.isMine, {Key? key}) : super(key: key);

  final String msg;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        Container(
          decoration: BoxDecoration(
            color: isMine ? const Color(0xFFFFD7CF) : const Color(0xFFFFFFFF),
            borderRadius: BorderRadius.only(
              topLeft: const Radius.circular(15.0),
              topRight: const Radius.circular(15.0),
              bottomLeft: isMine ? const Radius.circular(15) : const Radius.circular(0),
              bottomRight: isMine ? const Radius.circular(0) : const Radius.circular(15),
            ),
            boxShadow: const [
              BoxShadow(
                color: Color(0xFF655D5A),
                blurRadius: 5.0,
                spreadRadius: 2.0,
              ),
            ],
          ),
          width: 170,
          padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 16),
          margin: const EdgeInsets.symmetric(vertical: 4, horizontal: 8),
          child: Text(
            msg,
            style: const TextStyle(color: Color(0xFFD7777A))
          ),
        ),
      ],
    );
  }
}
