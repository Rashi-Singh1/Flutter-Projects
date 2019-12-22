import 'package:flutter/material.dart';

const radius = Radius.circular(16.0);

class MessageBubble extends StatelessWidget {
  final String messageText;
  final String messageSender;
  final bool isMe;

  MessageBubble(
      {@required this.messageText,
      @required this.messageSender,
      @required this.isMe});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8.0, vertical: 5.0),
      child: Column(
        crossAxisAlignment:
            isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: <Widget>[
          Text(
            this.messageSender,
            style: TextStyle(
              color: Colors.black54,
              fontSize: 12.0,
            ),
          ),
          SizedBox(
            height: 3.5,
          ),
          Material(
            borderRadius: isMe
                ? BorderRadius.only(
                    topLeft: radius, bottomLeft: radius, bottomRight: radius)
                : BorderRadius.only(
                    topRight: radius, bottomLeft: radius, bottomRight: radius),
            elevation: isMe ? 10.0 : 6.0,
            color: isMe ? Colors.lightBlueAccent : Colors.white,
            child: Padding(
              padding:
                  const EdgeInsets.symmetric(vertical: 10.0, horizontal: 18.0),
              child: Text(
                this.messageText,
                style: TextStyle(
                  color: isMe ? Colors.white : Colors.lightBlueAccent,
                  fontSize: 15.0,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
