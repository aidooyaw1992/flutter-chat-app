import 'package:flutter/material.dart';
import '../models/chat_model.dart';
import '../components/bottomNavBar.dart';

class ChatList extends StatefulWidget {
  @override
  _ChatListState createState() => new _ChatListState();
}

class _ChatListState extends State<ChatList> {
  // String _myState = 'No State';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          alignment: AlignmentDirectional.center,
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          child: new Image(
            image: AssetImage('assets/logoText.png'),
            width: 83.64,
            height: 20.91,
          ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [const Color(0xFF4C9BB7), const Color(0xFF4C9BB7)]),
              boxShadow: [
                new BoxShadow(
                  color: Colors.grey[500],
                  blurRadius: 20.0,
                  spreadRadius: 1.0,
                )
              ]),
        ),
        preferredSize: new Size(MediaQuery.of(context).size.width, 80.0),
      ),
      body: Container(
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [
                Color(0xFF12BAAB),
                Color(0xFF303F9F),
              ],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: new Container(
          child: _buildContent(),
        ),
      ),
      bottomNavigationBar: BottomBar(color: Color(0xFF2E49A0), hasNotch: true),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
      itemCount: allContacts.length,
      itemBuilder: (BuildContext content, int index) {
        Contact contact = allContacts[index];
        return Container(
          child: new Container(
            margin: EdgeInsets.all(8.0),
            child: Material(
              color: Color.fromRGBO(255, 255, 255, .2),
              borderRadius: BorderRadius.circular(50.0),
              child: new InkWell(
                onTap: () {
                  Navigator.of(context).pushNamed('/ChatList/chat');
                },
                child: new Padding(
                  padding: new EdgeInsets.all(8.0),
                  child: new Row(
                    children: <Widget>[
                      new Stack(
                        children: <Widget>[
                          new Container(
                            width: 58.0,
                            height: 58.0,
                            decoration: BoxDecoration(
                                shape: BoxShape.circle,
                                image: DecorationImage(
                                    fit: BoxFit.cover,
                                    image: NetworkImage(contact.avatarUrl))),
                          ),
                          new Positioned(
                            bottom: 2.5,
                            right: 2.5,
                            width: 10.0,
                            height: 10.0,
                            child: new Container(
                              decoration: new BoxDecoration(
                                border: new Border.all(
                                    width: 1.0, color: Colors.white70),
                                borderRadius: new BorderRadius.circular(30.0),
                                color: Colors.redAccent,
                              ),
                            ),
                          )
                        ],
                      ),
                      const SizedBox(
                        width: 10.0,
                      ),
                      new Expanded(
                        child: new Column(
                          crossAxisAlignment: CrossAxisAlignment.stretch,
                          mainAxisSize: MainAxisSize.min,
                          children: <Widget>[
                            new Text(contact.name,
                                style: TextStyle(
                                    fontSize: 16.0,
                                    fontWeight: FontWeight.bold,
                                    color: Colors.white),
                                textScaleFactor: 1.2),
                            const SizedBox(
                              height: 5.0,
                            ),
                            new Text(
                              contact.message,
                              style: TextStyle(
                                fontSize: 16.0,
                                fontWeight: FontWeight.normal,
                                color: Colors.white,
                              ),
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                        flex: 6,
                      ),
                      new Expanded(
                        child: new Icon(
                          IconData(
                            0xe5e1,
                            fontFamily: 'MaterialIcons',
                            matchTextDirection: true,
                          ),
                          color: Colors.white,
                        ),
                        flex: 1,
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
