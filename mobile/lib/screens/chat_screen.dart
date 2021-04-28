import 'package:chat_app/components/message_container.dart';
import 'package:chat_app/message_data.dart';
import 'package:flutter/material.dart';
import 'package:chat_app/screen_data.dart';

class ChatScreen extends StatefulWidget {
  final String userName;
  final String userId;
  final scrollController;
  final actionButtonKey;

  ChatScreen({
    this.userName,
    this.userId,
    this.actionButtonKey,
    this.scrollController,
  });

  @override
  _ChatScreenState createState() => _ChatScreenState();
}

class _ChatScreenState extends State<ChatScreen> {
  final _myController = TextEditingController();
  ValueNotifier<String> currentFieldMessage = new ValueNotifier<String>("");
  final inputFieldFocusNode = new FocusNode();

  @override
  void initState() {
    super.initState();
    // controller = ScrollController();
    widget.scrollController.addListener(_updateFabVisible);
  }

  void _updateFabVisible() {
    if (widget.scrollController.offset <=
            widget.scrollController.position.minScrollExtent &&
        !widget.scrollController.position.outOfRange) {
      widget.actionButtonKey.currentState.setState(() {
        widget.actionButtonKey.currentState.isVisible = false;
      });
      print('reach the bottom');
    } else {
      widget.actionButtonKey.currentState.setState(() {
        widget.actionButtonKey.currentState.isVisible = true;
      });
    }
  }

  Future<void> sendMessage() async {
    // implement
    widget.scrollController.jumpTo(0.0);
  }

  @override
  Widget build(BuildContext context) {
    return new Column(
      children: [
        _buildChatBody(context),
        _buildMessageWritingArea(context),
      ],
    );
  }

  Row _buildMessageWritingArea(BuildContext context) {
    return Row(
      children: [
        Flexible(
          child: GestureDetector(
            onTap: () {
              inputFieldFocusNode.requestFocus();
            },
            child: Container(
              child: Container(
                child: Row(
                  children: <Widget>[
                    new Container(
                      decoration: BoxDecoration(
                          borderRadius: BorderRadius.circular(30)),
                      margin: new EdgeInsets.symmetric(horizontal: 1.0),
                      child: new IconButton(
                        onPressed: () {},
                        icon: new Icon(Icons.tag_faces),
                        color: Colors.grey,
                      ),
                    ),
                    Flexible(
                      child: Container(
                        child: TextField(
                          onChanged: (message) {
                            currentFieldMessage.value = message;
                          },
                          focusNode: inputFieldFocusNode,
                          maxLines: null,
                          style: TextStyle(fontSize: 15.0),
                          controller: _myController,
                          decoration: InputDecoration.collapsed(
                            hintText: 'Type a message',
                            hintStyle: TextStyle(color: Colors.grey),
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
              ),
              width: double.infinity,
              height: screenHeight(context) * 0.06,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(30),
                color: Colors.white,
              ),
            ),
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 5),
          child: ClipOval(
            child: Material(
              color: Color.fromARGB(255, 0, 177, 154), // button color
              child: InkWell(
                splashColor: Colors.white12, // inkwell color
                child: SizedBox(
                  width: 44,
                  height: 44,
                  child: ValueListenableBuilder<String>(
                      valueListenable: currentFieldMessage,
                      builder: (_, message, __) {
                        IconData icon =
                            message.isEmpty ? Icons.mic : Icons.send;
                        return Icon(icon, color: Colors.white, size: 20);
                      }),
                ),
                onTap: () {},
              ),
            ),
          ),
        )
      ],
    );
  }

  Expanded _buildChatBody(BuildContext context) {
    return Expanded(
        flex: 12,
        child: GestureDetector(
          onTap: () {
            FocusScope.of(context).unfocus();
          },
          child: ListView.builder(
            controller: widget.scrollController,
            itemCount: messages.length,
            itemBuilder: (_, index) {
              return MessageBubble(
                message: messages[index],
                currentUserId: widget.userId,
              );
            },
            reverse: true,
          ),
        ));
  }
}
