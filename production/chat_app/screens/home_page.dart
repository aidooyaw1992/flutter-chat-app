import 'package:flutter/material.dart';
import '../models/chat_model.dart';

class ChatList extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: new PreferredSize(
        child: new Container(
          alignment: AlignmentDirectional.center,
          padding: new EdgeInsets.only(top: MediaQuery.of(context).padding.top),
          // child: new Padding(

          child: new Image(
            image: AssetImage('assets/logoText.png'),
            width: 83.64,
            height: 20.91,
          ),
          // ),
          decoration: new BoxDecoration(
              gradient: new LinearGradient(
                  colors: [const Color(0xFF12BAAB), const Color(0xFF303F9F)]),
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
        // padding: new EdgeInsets.all(8.0),
        decoration: new BoxDecoration(
          gradient: new LinearGradient(
              colors: [const Color(0xFF12BAAB), const Color(0xFF303F9F)],
              begin: FractionalOffset.topLeft,
              end: FractionalOffset.bottomRight,
              stops: [0.0, 1.0],
              tileMode: TileMode.clamp),
        ),
        child: new Container(
          child: _buildContent(),
        ),
      ),
    );
  }

  Widget _buildContent() {
    return ListView.builder(
        itemCount: allContacts.length,
        itemBuilder: (BuildContext content, int index) {
          Contact contact = allContacts[index];
          return Container(
            child: Container(
              decoration: BoxDecoration(
                color: Color.fromRGBO(255, 255, 255, .2),
                borderRadius: BorderRadius.circular(50.0),
              ),
              padding: new EdgeInsets.all(8.0),
              margin: EdgeInsets.all(8.0),
              child: new Row(
                children: <Widget>[
                    new Container(
                      width: 58.0,
                      height: 58.0,
                      decoration: BoxDecoration(
                        shape: BoxShape.circle,
                        image: DecorationImage(
                          fit: BoxFit.cover,
                          image: NetworkImage(contact.avatarUrl)
                        )
                      ),
                    ),
                    new Container(
                      padding: new EdgeInsets.only(left: 8.0),
                      width: 236.0,
                      child: new Column(
                      crossAxisAlignment: CrossAxisAlignment.stretch,
                      mainAxisSize: MainAxisSize.min,
                      children: <Widget>[
                        new Text(
                          contact.name,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.bold,color: Colors.white),
                          textScaleFactor: 1.2
                        ),
                        new Text(
                          contact.message,
                          style: TextStyle(fontSize: 16.0, fontWeight: FontWeight.normal, color: Colors.white),
                        ),
                      ],
                    ),
                    ),
                    new Icon(
                      IconData(
                        0xe5e1,
                        fontFamily: 'MaterialIcons',
                        matchTextDirection: true,
                      ),
                      color: Colors.white,
                    )
                  ],
                ),
              ),
    );
        }
      );
  }
}

//class ContactListTile extends ListTile {
//  ContactListTile(Contact contact)
//      : super(
//          title: Text(
//            contact.name,
//            style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//            overflow: TextOverflow.ellipsis,
//            maxLines: 1,
//          ),
//          subtitle: Text(
//            contact.message,
//            style: TextStyle(
//              color: Colors.white,
//            ),
//            overflow: TextOverflow.ellipsis,
//            maxLines: 1,
//          ),
//          leading: CircleAvatar(
//            backgroundColor: Colors.brown.shade800,
//            backgroundImage: new NetworkImage(contact.avatarUrl),
//          ),
//          trailing: Icon(
//            IconData(
//              0xe5e1,
//              fontFamily: 'MaterialIcons',
//              matchTextDirection: true,
//            ),
//            color: Colors.white,
//          ),
//          onTap: () {
//            print('Interaction happened');
//          },
//        );
//}
