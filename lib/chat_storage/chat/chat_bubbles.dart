import 'package:flutter/material.dart';
import 'package:flutter_chat_bubble/bubble_type.dart';
import 'package:flutter_chat_bubble/chat_bubble.dart';
import 'package:flutter_chat_bubble/clippers/chat_bubble_clipper_8.dart';


class ChatBubbles extends StatelessWidget {
  const ChatBubbles(this.msg, this.isMine, {Key? key}) : super(key: key);

  final String msg;
  final bool isMine;

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: isMine ? MainAxisAlignment.end : MainAxisAlignment.start,
      children: [
        if (isMine)
          Padding(
            padding: const EdgeInsets.fromLTRB(0, 0, 5.0, 0),
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.sendBubble),
              alignment: Alignment.topRight,
              margin: EdgeInsets.only(top: 20),
              backGroundColor: Color(0xFFD7777A),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Column(
                  children: [
                    Text(
                      msg,
                      style: TextStyle(color: Colors.white),
                    ),
                  ],
                ),
              ),
            ),
          ),
        if (!isMine)
          Padding(
            padding: const EdgeInsets.fromLTRB(5.0, 0, 0, 0),
            child: ChatBubble(
              clipper: ChatBubbleClipper8(type: BubbleType.receiverBubble),
              backGroundColor: Color(0xffE7E7ED),
              margin: EdgeInsets.only(top: 20),
              child: Container(
                constraints: BoxConstraints(
                  maxWidth: MediaQuery.of(context).size.width * 0.7,
                ),
                child: Text(
                  msg,
                  style: TextStyle(color: Colors.black),
                ),
              ),
            ),
          )
      ],
    );
  }
}
