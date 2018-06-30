import 'package:flutter/material.dart';

import 'package:web_socket_channel/io.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

class ChatScreen extends StatefulWidget {
  @override
  State createState() => new ChatScreenState();
}

class ChatScreenState extends State<ChatScreen> with TickerProviderStateMixin {
  final List<ChatMessage> _messages = <ChatMessage>[];
  final TextEditingController _textController = new TextEditingController();
  bool _isComposing = false;

  void _handleSubmitted(String text) {
    _textController.clear();
    setState(() {
      _isComposing = false;
    });
    ChatMessage message = new ChatMessage(
      text: text,
      animationController: new AnimationController(
        duration: new Duration(milliseconds: 350),
        vsync: this,
      ),
    );
    setState(() {
      _messages.insert(0, message);
    });
    message.animationController.forward();
  }

  void dispose() {
    for (ChatMessage message in _messages)
      message.animationController.dispose();
    super.dispose();
  }

  Widget build(BuildContext context) {
    return new Scaffold(
      appBar: new AppBar(
        title: new Text("Chat Screen"),
      ),
      body: new Column(
        children: <Widget>[
          new Flexible(
            child: new ListView.builder(
              padding: new EdgeInsets.all(8.0),
              reverse: true,
              itemBuilder: (_, int index) => _messages[index],
              itemCount: _messages.length,
            ),
          ),
          new Container(
            margin: const EdgeInsets.only(
                left: 15.0, right: 15.0, bottom: 10.0, top: 25.0),
            decoration: new BoxDecoration(
              color: Colors.white,
              border: new Border.all(width: 1.0, color: Colors.white70),
              borderRadius: new BorderRadius.circular(50.0),
              boxShadow: [
                new BoxShadow(
                  color: Color.fromRGBO(0, 0, 0, .14),
                  blurRadius: 4.0,
                ),
              ],
            ),
            child: _buildTextComposer(),
          )
        ],
      ),
    );
  }

  Widget _buildTextComposer() {
    return new Container(
      // margin: const EdgeInsets.symmetric(horizontal: 8.0),
      child: new Row(
        children: <Widget>[
          new Flexible(
            child: Container(
              padding: EdgeInsets.all(8.0),
              margin: EdgeInsets.all(10.0),
              decoration: new BoxDecoration(
                color: Color(0xFFE7E7E7),
                borderRadius: new BorderRadius.circular(50.0),
              ),
              child: new TextField(
                controller: _textController,
                onChanged: (String text) {
                  setState(() {
                    _isComposing = text.length > 0;
                  });
                },
                onSubmitted: _handleSubmitted,
                decoration:
                    new InputDecoration.collapsed(hintText: "Send a message"),
              ),
            ),
          ),
          new Container(
            margin: new EdgeInsets.symmetric(horizontal: 4.0),
            child: new IconButton(
              icon: Icon(Icons.send),
              color: Colors.blue,
              onPressed: _isComposing
                  ? () => _handleSubmitted(_textController.text)
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}

const String _name = "Oghene Michael";

class ChatMessage extends StatelessWidget {
  ChatMessage({this.text, this.animationController});
  final String text;
  final AnimationController animationController;
  @override
  Widget build(BuildContext context) {
    return new SizeTransition(
      sizeFactor: new CurvedAnimation(
        parent: animationController,
        curve: Curves.easeOut,
      ),
      axisAlignment: 0.0,
      child: Container(
        padding:
            EdgeInsets.only(left: 24.0, right: 24.0, top: 17.0, bottom: 15.0),
        margin: EdgeInsets.only(left: 50.0, right: 10.0, top: 10.0),
        decoration: BoxDecoration(
          color: Color(0xFF2473A4),
          border: new Border.all(width: 1.0, color: Colors.white70),
          borderRadius: new BorderRadius.circular(5.0),
        ),
        child: new Row(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            new Expanded(
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  new Text(_name, style: TextStyle(color: Colors.white)),
                  new Container(
                    margin: const EdgeInsets.only(top: 5.0),
                    child: new Text(
                      text,
                      style: TextStyle(color: Colors.white),
                    ),
                  ),
                ],
              ),
            )
          ],
        ),
      ),
    );
  }
}
