import 'package:flutter/material.dart';

class LoginPage extends StatefulWidget {
  static String tag = 'login-page';
  @override
  _LoginPageState createState() => new _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  
  Widget _buildStack() {

    var assetsImage = new AssetImage('assets/logo.png');
    var logoImage = new Image(image: assetsImage, width: 179.91, height: 147.0,);

    final loginText = new Column(
      children: <Widget>[
        Container(
        width: 264.0,
        child: Center(
          child: Text(
            'Socialize and share happy moments with students around the world',
            style: TextStyle(fontSize: 20.0, color: Colors.white),
            textAlign: TextAlign.center,
          ),
          ),
        ),
      ],
    );
    
    final header = Column(
      children: [
        ClipPath(
          clipper: TopCurve(),
          child: Container(
            width: double.maxFinite,
            height: 435.0,
            decoration: new BoxDecoration(
              gradient: new LinearGradient(colors: [const Color(0xFF12BAAB),const Color(0xFF303F9F)],
                begin: FractionalOffset.topLeft,
                end: FractionalOffset.bottomRight,
                stops: [0.0,1.0],
                tileMode: TileMode.clamp
                ),
            ),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.center,
              mainAxisAlignment: MainAxisAlignment.center,
              children: <Widget>[
                SizedBox(height: 50.0),
                logoImage,
                SizedBox(height: 45.0),
                loginText
              ],
            ),
          ),
        ),
      ],
    );

    final loginButton = Column(
            mainAxisAlignment: MainAxisAlignment.end,
            children: [
              Container(
                width: double.maxFinite,
					      height: 240.0,
                child: Center(
                  child: Material(
                    borderRadius: BorderRadius.circular(30.0),
                    elevation: 0.0,
                    child: MaterialButton(
                      minWidth: 264.0,
                      height: 60.0,
                      color: Color(0xFF2E4DA7),
                      onPressed:() {
                        Navigator.of(context).pushNamedAndRemoveUntil('/ChatList', (Route<dynamic> route) =>false);
                      },
                      child: Text(
                        'Login with Facebook',
                        style: TextStyle(fontSize: 17.0 ,color: Colors.white)
                      ),
                    ),
                  ),
                ),
              ),
            ],
          );
    
    return Stack(
      children: <Widget>[
          header,
          loginButton
      ],
    );
  }
  
  @override
  Widget build(BuildContext context) {
   

    return new Scaffold(
      body: Center(
        child: Container(
          color: Colors.white,
          child: Center(
            child: _buildStack(),
        ),
        ),
      ),
    );
  }
}



class TopCurve extends CustomClipper<Path> {
  @override
  Path getClip(Size size) {
    var path = Path();
    path.lineTo(0.0, size.height - 30);

    var firstControlPoint = Offset(size.width / 4, size.height);
    var firstPoint = Offset(size.width / 2, size.height);
    path.quadraticBezierTo(firstControlPoint.dx, firstControlPoint.dy,
        firstPoint.dx, firstPoint.dy);

    var secondControlPoint = Offset(size.width - (size.width / 4), size.height);
    var secondPoint = Offset(size.width, size.height - 30);
    path.quadraticBezierTo(secondControlPoint.dx, secondControlPoint.dy,
        secondPoint.dx, secondPoint.dy);

    path.lineTo(size.width, 0.0);
    path.close();

    return path;
  }

  @override
  bool shouldReclip(CustomClipper<Path> oldClipper) => false;
}