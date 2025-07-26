import 'package:cv_main_project/projects/flash_chat/constants.dart';
import 'package:flutter/material.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:cloud_firestore/cloud_firestore.dart';

final _firestore = FirebaseFirestore.instance;
User? loggedInUser;

class ChatScreen extends StatefulWidget {
  static const String id = 'c_s';

  const ChatScreen({super.key}); // id for chat screen allow for easier route navigation.
  @override
  ChatScreenState createState() => ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> {
  final messageTextController = TextEditingController();
  final _auth = FirebaseAuth.instance;
  String? textMessage;

  @override
  void initState() {
    super.initState();
    getCurrentUser();
  }

  void getCurrentUser() async {
    try {
      final user = _auth.currentUser;

      if (user != null) {
        loggedInUser = user;
        debugPrint(loggedInUser!.email);
      }
    } catch (e) {
      debugPrint('$e');
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
            },
          ),
        ],
        title: Text('⚡️Chat'),
        backgroundColor: Colors.lightBlueAccent,
      ),
      body: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.stretch,
          children: <Widget>[
            MessageStream(),
            Container(
              decoration: kMessageContainerDecoration,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                children: <Widget>[
                  Expanded(
                    child: TextField(
                      controller: messageTextController,
                      onChanged: (value) {
                        textMessage = value;
                      },
                      decoration: kMessageTextFieldDecoration,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      messageTextController.clear();
                      _firestore.collection('messages').add({
                        'text': textMessage,
                        'sender': loggedInUser!.email,
                        'timeCreated': DateTime.now().millisecondsSinceEpoch,
                      });
                    },
                    child: Text('Send', style: kSendButtonTextStyle),
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
  const MessageStream({super.key});

  @override
  Widget build(BuildContext context) {
    return StreamBuilder<QuerySnapshot>(
      stream: _firestore.collection('messages').orderBy('timeCreated', descending: false).snapshots(),
      builder: (context, snapshot) {
        if (!snapshot.hasData) {
          return Center(child: CircularProgressIndicator(backgroundColor: Colors.lightBlue));
        }

        final messages = snapshot.data!.docs.reversed;
        List<MessageBubble> bubbleWidgets = [];

        for (var message in messages) {
          final messageText = message['text'];
          final messageSender = message['sender'];
          final messageTime = message['timeCreated'];
          final currentUser = loggedInUser!.email;
          final bubbleWidget = MessageBubble(text: messageText, sender: messageSender, isMe: currentUser == messageSender, timeStamp: messageTime);
          bubbleWidgets.add(bubbleWidget);
        }

        return Expanded(
          child: ListView(reverse: true, padding: EdgeInsets.symmetric(horizontal: 5, vertical: 10), children: bubbleWidgets),
        );
      },
    );
  }
}

class MessageBubble extends StatelessWidget {
  const MessageBubble({super.key, required this.text, required this.sender, required this.isMe, required this.timeStamp});

  final String text;
  final String sender;
  final bool isMe;
  final int timeStamp;

  @override
  Widget build(BuildContext context) {
    final dateTime = DateTime.fromMillisecondsSinceEpoch(timeStamp);

    return Padding(
      padding: const EdgeInsets.all(15.0),
      child: Column(
        crossAxisAlignment: isMe ? CrossAxisAlignment.end : CrossAxisAlignment.start,
        children: [
          Text(sender),
          Material(
            elevation: 5,
            borderRadius: BorderRadius.only(
              topLeft: isMe ? Radius.circular(30) : Radius.zero,
              bottomLeft: Radius.circular(30),
              bottomRight: Radius.circular(30),
              topRight: isMe ? Radius.zero : Radius.circular(30),
            ),
            color: isMe ? Colors.blue[200] : Colors.white,
            child: Padding(
              padding: const EdgeInsets.symmetric(vertical: 10, horizontal: 20),
              child: Text(text, style: TextStyle(fontSize: 16)),
            ),
          ),
          Text(dateTime.toString(), style: TextStyle(color: Colors.black45)),
        ],
      ),
    );
  }
}
