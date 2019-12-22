import 'dart:async';

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flash_chat/Utilities/constants.dart';
import 'package:flash_chat/Utilities/messageStream.dart';
import 'package:flutter/material.dart';

class ChatScreen extends StatefulWidget {
  static String id = 'chat_screen';

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _auth = FirebaseAuth.instance;
  final _firestore = Firestore.instance;
  FirebaseUser loggedInUser;
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
      return Text(
        'Send your first message',
        style: TextStyle(
          fontSize: 25.0,
          color: Colors.grey,
        ),
      );
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
