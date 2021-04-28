import 'package:chat_app/components/floating_button.dart';
import 'package:chat_app/screens/chat_screen.dart';
import 'package:flutter/material.dart';

class Home extends StatefulWidget {
  final String userName;
  final String userId;
  Home({this.userName, this.userId});

  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  var actionButtonKey = new GlobalKey<FloatingButtonState>();

  var scrollController = ScrollController();

  Future deleteMessages() async {}

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      // resizeToAvoidBottomPadding: false,
      appBar: new AppBar(
        leadingWidth: 40,
        backgroundColor: Color.fromARGB(255, 6, 94, 82),
        leading: CircleAvatar(
          backgroundImage: AssetImage("assets/xdays.png"),
        ),
        title: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Text("X-DaYs", style: TextStyle(color: Colors.white)),
            Text(
              "Elnur, Kamil, Orxan, Sahil, Nihad, You",
              style: TextStyle(
                color: Colors.white,
                fontSize: 14,
              ),
            ),
          ],
        ),
        actions: [
          IconButton(
              icon: Icon(Icons.more_vert), splashRadius: 22, onPressed: () {})
        ],
      ),
      body: Container(
        decoration: BoxDecoration(
            image: DecorationImage(
          image: AssetImage("assets/background.png"),
          fit: BoxFit.cover,
        )),
        child: ChatScreen(
          scrollController: scrollController,
          actionButtonKey: this.actionButtonKey,
          userName: widget.userName,
          userId: "1111",
        ),
      ),
      floatingActionButton: FloatingButton(
          key: this.actionButtonKey, scrollController: scrollController),
    );
  }
}
