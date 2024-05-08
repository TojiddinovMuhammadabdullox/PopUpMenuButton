import 'package:flutter/material.dart';
import 'package:iconbutton_popupmenu/first_screen.dart';
import 'package:iconbutton_popupmenu/second_screen.dart';
import 'package:iconbutton_popupmenu/third_screen.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Popup Menu Button',
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Popup Menu  '),
        actions: [
          IconButton(
            icon: Icon(Icons.more_vert),
            onPressed: () {
              _showPopupMenu(context);
            },
          ),
        ],
      ),
      body: Center(),
    );
  }

  void _showPopupMenu(BuildContext context) {
    final RenderBox overlay =
        Overlay.of(context)!.context.findRenderObject() as RenderBox;
    final Offset offset = Offset(0.0, overlay.size.height);
    showMenu(
      context: context,
      position: RelativeRect.fromLTRB(0, overlay.size.height, 0, 0),
      items: <PopupMenuEntry>[
        PopupMenuItem(
          child: const Text('First Screen'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => FirstScreen(),
              ),
            );
          },
        ),
        PopupMenuItem(
          child: const Text('Second Screen'),
          onTap: () {
            Navigator.push(
              context,
              MaterialPageRoute(
                builder: (context) => SecondScreen(),
              ),
            );
          },
        ),
        PopupMenuItem(
            child: const Text('Third Screeen'),
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => ThirdScreen(),
                ),
              );
            }),
      ],
      elevation: 8.0,
    ).then((value) {
      if (value != null) {}
    });
  }
}
