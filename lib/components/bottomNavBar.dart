import 'package:flutter/material.dart';

class BottomBar extends StatelessWidget {
  final Color color;
  final bool hasNotch;

  BottomBar({this.color, this.hasNotch});

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      color: color,
      hasNotch: hasNotch,
      child: Container(
        height: 80.0,
        padding: const EdgeInsets.only(left: 16.0, right: 16.0),
        child: Row(
          crossAxisAlignment: CrossAxisAlignment.center,
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: <Widget>[
            InkResponse(
              onTap: () => print('Open page'),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 55.0,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        IconData(0xe800, fontFamily: 'ChatApp'),
                        color: Colors.white,
                        size: 37.0,
                      ),
                      Text(
                        'Explore',
                        style: TextStyle(fontSize: 10.0, color: Colors.white),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkResponse(
              onTap: () => print('Open page'),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 55.0,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        IconData(0xe801, fontFamily: 'ChatApp'),
                        color: Colors.white,
                        size: 37.0,
                      ),
                      Text(
                        'Search',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkResponse(
              onTap: () => showModalBottomSheet<void>(
                  context: context,
                  builder: (BuildContext context) {
                    return new Container(
                      child: new Padding(
                        padding: const EdgeInsets.all(32.0),
                        child: new Text(
                          'This is the modal bottom sheet. Click anywhere to dismiss.',
                          textAlign: TextAlign.center,
                          style: new TextStyle(
                              color: Theme.of(context).accentColor,
                              fontSize: 24.0),
                        ),
                      ),
                    );
                  }),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  child: Column(
                    children: <Widget>[
                      Icon(
                        IconData(0xe800, fontFamily: 'ChatApp'),
                        color: Colors.white,
                        size: 55.0,
                      ),
                    ],
                  ),
                ),
              ),
            ),
            InkResponse(
              onTap: () => print('Open page'),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 55.0,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        IconData(0xe802, fontFamily: 'ChatApp'),
                        color: Colors.white,
                        size: 37.0,
                      ),
                      Text(
                        'Feeds',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            InkResponse(
              onTap: () => print('Open page'),
              child: Padding(
                padding: const EdgeInsets.all(12.0),
                child: Container(
                  height: 55.0,
                  child: Column(
                    children: <Widget>[
                      Icon(
                        IconData(0xe800, fontFamily: 'ChatApp'),
                        color: Colors.white,
                        size: 37.0,
                      ),
                      Text(
                        'Settings',
                        style: TextStyle(
                          fontSize: 10.0,
                          color: Colors.white,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
