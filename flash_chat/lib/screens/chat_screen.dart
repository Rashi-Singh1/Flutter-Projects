import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Utilities/constants.dart';
import 'package:flash_chat/Utilities/messageBubble.dart';
import 'package:flutter/material.dart';

FirebaseUser loggedInUser;

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  String messageText;
  bool empty = true;

  //TODO: if same sender, don't add top Email
  String prevSender = '';

  //this will be used to clear the fields when done
  final messageTextController = TextEditingController();

  @override
  void initState() {
    super.initState();
    getUser();
    getEmpty();
    print('empty : ' + empty.toString());
  }

  void getUser() async {
    try {
      final user = await _auth.currentUser();
      if (user != null) {
        loggedInUser = user;
        print(loggedInUser.email);
      }
    } catch (e) {
      print(e);
    }
  }

  Future<void> getEmpty() async {
    final messages = await _firestore.collection('messages').getDocuments();
    //to get all documents (all items in the collection), use messages.documents and this gives a list of documents (items)
    print('length : ' + messages.documents.length.toString());
    if (messages.documents.length > 0)
      setState(() {
        empty = false;
      });
    else
      setState(() {
        empty = true;
      });
    print('empty : ' + empty.toString());
  }

  //this has to be triggered
  void getMessages() async {
    final messages = await _firestore.collection('messages').getDocuments();
    //to get all documents (all items in the collection), use messages.documents and this gives a list of documents (items)
    for (var message in messages.documents) {
      print(message.data);
    }
  }

  //this is pushed automatically when a change happens in that collection
  //like a subscription to the collection 'messages'
  void messageStream() async {
    //snapshots return sort of a list of futures (earlier one getDocuments accounted to one future)
    //basically multiple images of our collection
    await for (var snapshot in _firestore.collection('messages').snapshots()) {
      print(snapshot.documents.length);
      for (var message in snapshot.documents) {
        print(message.data);
      }
      print('');
    }
  }

  Widget getInitialTextWidget() {
    if (empty) {
      return MessageBubble(
          messageText: 'Send your first message',
          messageSender: '',
          isMe: true);
    } else {
      return Container(
        height: 0,
        width: 0,
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        actions: <Widget>[
          IconButton(
              icon: Icon(Icons.close),
              onPressed: () {
                _auth.signOut();
                Navigator.pop(context);
              }),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            getInitialTextWidget(),
            MessageStream(firestore: _firestore),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        messageText = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  FlatButton(
                    onPressed: () {
                      if (empty == true) {
                        setState(() {
                          empty = false;
                        });
                      }
                      messageTextController.clear();
                      //Implement send functionality.
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInUser.email,
                        'time': DateTime.now().millisecondsSinceEpoch,
                      });
                    },
                    child: Text(
                      'Send',
                      style: kSendButtonTextStyle,
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

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
          //need to reverse bcs the listView shows the reverse order ( last element ( newest msg ) in list at top )
          final messages = asyncSnapshot.data.documents;
          messages.sort((a, b) => b.data['time'].compareTo(a.data['time']));
          List<MessageBubble> messageWidgets = new List();
          for (var message in messages) {
            final messageText = message.data['text'];
            final messageSender = message.data['sender'];
            messageWidgets.add(MessageBubble(
              messageText: messageText,
              messageSender: messageSender,
              isMe: messageSender == loggedInUser.email,
            ));
          }
          //wrapping listView (scrollable column) allows it to take only as much space as available
          return Expanded(
            child: ListView(
              reverse: true,
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
