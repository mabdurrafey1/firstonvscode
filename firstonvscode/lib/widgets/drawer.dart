import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

// ignore: camel_case_types
class myDrawer extends StatelessWidget {
  const myDrawer({Key key}) : super(key: key);
  final imageurl =
      "https://www.clipartkey.com/mpngs/m/113-1138698_transparent-emoji-clipart-flushed-face-emoji-png.png";
  @override
  Widget build(BuildContext context) {
    return Drawer(
      child: ListView(
        children: [
          DrawerHeader(
            padding: EdgeInsets.zero,
            child: UserAccountsDrawerHeader(
              margin: EdgeInsets.zero,
              accountName: Text('Hassan Bin HadayatUllah'),
              accountEmail: Text('hassanhadayat3@gmail.com'),
              currentAccountPicture: CircleAvatar(
                backgroundImage: NetworkImage(imageurl),
              ),
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.home),
            title: Text(
              'Home',
              textScaleFactor: 1.3,
            ),
          ),
          ListTile(
            leading: Icon(CupertinoIcons.profile_circled),
            title: Text(
              'Profile',
              textScaleFactor: 1.3,
            ),
          ),
          ListTile(
            leading: Icon(Icons.email),
            title: Text(
              'Email',
              textScaleFactor: 1.3,
            ),
          )
        ],
      ),
    );
  }
}
