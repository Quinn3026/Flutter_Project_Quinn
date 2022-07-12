import 'package:flutter/material.dart';
import 'package:flashchats/constants.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:modal_progress_hud/modal_progress_hud.dart';

final _firestore = FirebaseFirestore.instance;
User loggedInuser;

class ChatScreen extends StatefulWidget {
  static const String id = 'chat_screen';
  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();

  final _auth = FirebaseAuth.instance;
  String messageText;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final User = await _auth.currentUser;
      if (User != null) {
        loggedInuser = User;
        // print(loggedInuser.email);

      }
    } catch (e) {
      print(e);
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
            MessagesStream(),
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
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      //messageText + logedInUser.Email
                      _firestore.collection('messages').add({
                        'text': messageText,
                        'sender': loggedInuser.email,
                        'positionId': Timestamp.now().toDate(),



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

class MessagesStream extends StatelessWidget {


  //const MessagesStream({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
        stream: _firestore.collection('messages').snapshots(),
        builder: (context, snapshot) {
          if (!snapshot.hasData) {
            return Center(
              child: CircularProgressIndicator(
                backgroundColor: Colors.lightBlueAccent,
              ),
            );
          }
          final messages = snapshot.data.docs.reversed;
          var convertedMessages = [];
          for (var message in messages){
            convertedMessages.add(message);

          }

          List<MessageBubble> messageBubbles = [];
          for (var message in messages) {
            var messagedata = message.data() as Map<String, dynamic>;
            final messageText = messagedata['text'];
            final messageSender = messagedata['sender'];
            final messagetime = messagedata['positionid'];

            final currentUser  = loggedInuser.email;

            final messageBubble = MessageBubble(
              sender: messageSender,
              text: messageText,
              isMe: currentUser == messageSender,
              positionid: messagetime,
            );

            // messageWidgets.add(messageWidget);
            // print(messageWidgets);
            messageBubbles.add(messageBubble);
          }
          return Expanded(
            child: ListView(

              reverse: true,
              padding: EdgeInsets.symmetric(vertical: 20, horizontal: 10),
              children: messageBubbles,
            ),
          );
        });
  }
}

class MessageBubble extends StatelessWidget {
  // const MessageBubble({Key? key}) : super(key: key);\
  MessageBubble({this.sender, this.text, this.isMe, this.positionid});

  final String sender;
  final String text;
  final bool isMe;
  var positionid;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: EdgeInsets.all(10.0),
      child: Column(
        // use a ternary operation ( ? ).
        //known as true block : false block.
        // for true false boolean format.
        crossAxisAlignment: isMe ? CrossAxisAlignment.end:CrossAxisAlignment.start,
        children: [
          Text(
            sender,
            style: TextStyle(fontSize: 12, color: Colors.black54),
          ),
          Material(
              elevation: 5,
              borderRadius: isMe ? BorderRadius.only(
                  topLeft: Radius.circular(30),
                  bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30)) : BorderRadius.only( bottomLeft: Radius.circular(30),
                  bottomRight: Radius.circular(30), topRight: Radius.circular(30),),
              // use a ternary operation ( ? )
              color: isMe ? Colors.lightBlueAccent: Colors.white,
              child: Padding(
                padding: EdgeInsets.symmetric(vertical: 10, horizontal: 20),
                child: Text(
                  text,
                  style: TextStyle(fontSize: 15.0, color: isMe ? Colors.white: Colors.black54),
                ),
              )),
          Text(positionid),
        ],
      ),
    );
  }
}
