import 'package:flutter/material.dart';

class AvatarPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Avatar Page'), actions: <Widget>[
        Container(
          margin: EdgeInsets.only(right: 10.0),
          child: CircleAvatar(
            child: Text('ES'),
            backgroundColor: Colors.brown,
          ),
        )
      ]),
      body: Center(
        child: FadeInImage(
          image: NetworkImage(
              'https://i.pinimg.com/originals/e9/57/2a/e9572a70726980ed5445c02e1058760b.png'),
          placeholder: AssetImage('assets/jar-loading.gif'),
        ),
      ),
    );
  }
}
