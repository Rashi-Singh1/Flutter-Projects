import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flash_chat/Utilities/messageBubble.dart';
import 'package:flutter/material.dart';

class MessageStream extends StatelessWidget {
  final Firestore _firestore;

  MessageStream({@required Firestore firestore}) : _firestore = firestore;

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      //if the data type jiski stream hai is not specified, it considers it dynamic

      stream: _firestore.collection('messages').snapshots(),
      builder: (context, asyncSnapshot) {
        //this asyncSnapshot (from flutter) is diff from collection ka snapshot
        //however, it contains the collection vala snapshot

        if (asyncSnapshot.hasData) {
          //this gives list of documents in a collection
          final messages = asyncSnapshot.data.documents;
          List<MessageBubble> messageWidgets = new List();
          for (var message in messages) {
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];
            messageWidgets.add(MessageBubble(
              messageText: messageText,
              messageSender: messageSender,
            ));
          }
          //wrapping listView (scrollable column) allows it to take only as much space as available
          return Expanded(
            child: ListView(
              padding: EdgeInsets.symmetric(horizontal: 10.0, vertical: 20.0),
              children: messageWidgets,
            ),
          );
        } else {
          return Container(
            height: 0.0,
            width: 0.0,
          );
        }
      },
    );
  }
}
