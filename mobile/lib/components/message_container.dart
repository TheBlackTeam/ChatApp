import 'package:chat_app/models/message.dart';
import 'package:chat_app/screen_data.dart';
import 'package:flutter/material.dart';

class MessageBubble extends StatelessWidget {
  MessageBubble({this.message, this.currentUserId});

  final String currentUserId;
  final Message message;

  @override
  Widget build(BuildContext context) {
    bool isMe = currentUserId == message.fromUid;

    print(isMe);
    return Container(
      margin: EdgeInsets.all(10),
      child: Column(
        children: <Widget>[
          Align(
            alignment: isMe ? Alignment.centerRight : Alignment.centerLeft,
            child: Material(
                elevation: 5.0,
                borderRadius: BorderRadius.circular(6),
                color: isMe ? Color.fromARGB(255, 220, 248, 198) : Colors.white,
                child: Container(
                  padding: EdgeInsets.symmetric(horizontal: 10, vertical: 10),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      isMe
                          ? Container(width: 0)
                          : Text(message.from,
                              style:
                                  TextStyle(fontSize: 12, color: Colors.pink)),
                      Container(
                        constraints: BoxConstraints(
                            maxWidth: screenWidth(context) * 0.8),
                        child: Text(
                          message.content,
                          textWidthBasis: TextWidthBasis.longestLine,
                          style: TextStyle(color: Colors.black, fontSize: 15),
                        ),
                      ),
                    ],
                  ),
                )),
          ),
        ],
      ),
    );
  }
}
