// import 'package:flutter/material.dart';

// import 'model/chat_model.dart';


// class SecondScreen extends StatelessWidget {

//   @override
//   Widget build (BuildContext context) {
    
//     return new WillPopScope(
//       onWillPop: () async {return false;},
//         child: Container(
//           decoration:  BoxDecoration(
//               gradient:  LinearGradient(colors: [const Color(0xFF12BAAB),const Color(0xFF303F9F)],
//                 begin: FractionalOffset.topLeft,
//                 end: FractionalOffset.bottomRight,
//                 stops: [0.0,1.0],
//                 tileMode: TileMode.clamp
//                 ),
//             ),
//           child: new CustomScrollView(
//             slivers: <Widget>[
//               new SliverAppBar(
//                 backgroundColor: Color.fromRGBO(255, 255, 255, 0.2),
//                 pinned: true,
//                 automaticallyImplyLeading: false,
//                 expandedHeight: 100.0,
//                 elevation: 0.0,
//                 flexibleSpace:  FlexibleSpaceBar(
//                   title: Image.asset('assets/logoText.png', width: 83.64, height: 20.91),
//                 ),
//               ),
//               new SliverFixedExtentList(
//               itemExtent: 50.0,
//               delegate: new SliverChildBuilderDelegate(
//                 (BuildContext context, int index) {
//                   return new Container(
//                     alignment: Alignment.center,
//                     color: Colors.lightBlue[100 * (index % 9)],
//                     child: new Text('list item $index'),
//                   );
//                 },
//               ),
//             ),
//             ],
//           ),
//         ),
//     );
    
//   }
// }


// import 'package:flutter/material.dart';
// import 'models/chat_model.dart';

// class ChatList extends StatelessWidget {
//   @override
//     Widget build(BuildContext context) {
//     return Scaffold(
//       appBar: new PreferredSize(
//         child: new Container(
//           alignment: AlignmentDirectional.center,
//           padding: new EdgeInsets.only(
//             top: MediaQuery.of(context).padding.top
//           ),
//           // child: new Padding(
            
//             child: new Image(image: AssetImage('assets/logoText.png'), width: 83.64, height: 20.91,),
//           // ),
//           decoration: new BoxDecoration(
//             gradient: new LinearGradient(
//               colors: [const Color(0xFF12BAAB),const Color(0xFF303F9F)]
//             ),
//             boxShadow: [
//               new BoxShadow(
//                 color: Colors.grey[500],
//                 blurRadius: 20.0,
//                 spreadRadius: 1.0,
//               )
//             ]
//           ),
//         ),
//         preferredSize: new Size(
//           MediaQuery.of(context).size.width,
//           80.0
//         ),
//       ),
//       body: Container(
//         // padding: new EdgeInsets.all(8.0),
//         decoration: new BoxDecoration(
//           gradient: new LinearGradient(colors: [const Color(0xFF12BAAB),const Color(0xFF303F9F)],
//           begin: FractionalOffset.topLeft,
//           end: FractionalOffset.bottomRight,
//           stops: [0.0,1.0],
//           tileMode: TileMode.clamp
//           ),
//         ),
//         child: new Container(
//           child: _buildContent(),
//         ),
//       ),
//     );
//   }

//   Widget _buildContent() {
//     return ListView.builder(
//         itemCount: allContacts.length,
//         itemBuilder: (BuildContext content, int index) {
//           Contact contact = allContacts[index];
//           return Container(
//             padding: new EdgeInsets.all(8.0),
//             margin: EdgeInsets.only(top: 8.0),
//             child: Material(
//               color: Color.fromRGBO(255, 255, 255, 0.2),
//               borderRadius: BorderRadius.circular(50.0),
//               child: ContactListTile(contact),
//             )
//           );
//         }
//     );
//   }
// }

// class ContactListTile extends ListTile {
//   ContactListTile(Contact contact) : super(
//     title: Text(
//       contact.name,
//       style: TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
//       overflow: TextOverflow.ellipsis,
//       maxLines: 1,
//     ),
//     subtitle: Text(
//       contact.message,
//       style: TextStyle(color: Colors.white,),
//       overflow: TextOverflow.ellipsis,
//       maxLines: 1,
//     ),
//     leading: CircleAvatar(
//       backgroundColor: Colors.brown.shade800,
//       backgroundImage: new NetworkImage(contact.avatarUrl),
//     ),
//     trailing: Icon(
//       IconData(0xe5e1, fontFamily: 'MaterialIcons', matchTextDirection: true,),
//       color: Colors.white,
//     ),
//     onTap: () {
//       print('Interaction happened');
//     },
//   );
// }