import 'package:chat_app/screen_data.dart';
import 'package:flutter/material.dart';

class FloatingButton extends StatefulWidget {
  final ScrollController scrollController;

  FloatingButton({Key key, this.scrollController}) : super(key: key);

  @override
  FloatingButtonState createState() => FloatingButtonState();
}

class FloatingButtonState extends State<FloatingButton> {
  bool isVisible = false;

  @override
  Widget build(BuildContext context) {
    return Visibility(
      visible: isVisible,
      child: Container(
        width: 45,
        height: 45,
        margin: EdgeInsets.only(bottom: screenHeight(context) * 0.06),
        child: Align(
          alignment: Alignment.bottomRight,
          child: FloatingActionButton(
            onPressed: () {
              widget.scrollController.animateTo(0.0,
                  duration: Duration(seconds: 1), curve: Curves.fastOutSlowIn);
            },
            child: Icon(Icons.keyboard_arrow_down,
                size: 35, color: Colors.black54),
            backgroundColor: Colors.white,
            elevation: 0,
          ),
        ),
      ),
    );
  }
}
