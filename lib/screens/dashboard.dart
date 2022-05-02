import 'package:bytecupertino/screens/contacts_list.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

class Dashboard extends StatelessWidget {
  const Dashboard({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Dashboard'),
      ),
      child: SafeArea(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Container(
              height: 300,
              margin: const EdgeInsets.all(16.0),
              decoration:
                  BoxDecoration(
                image: const DecorationImage(
                  image: AssetImage('images/bytebank_logo.png'),
                  fit: BoxFit.cover,
                ),
                borderRadius: BorderRadius.circular(12),
              ),
            ),
            CupertinoButton(
              child: Container(
                height: 125,
                width: 150,
                decoration: BoxDecoration(
                  color: Colors.green[600],
                  borderRadius: BorderRadius.circular(12),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(16.0),
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: const <Widget>[
                      Icon(
                        Icons.people,
                        color: Colors.white,
                        size: 32.0,
                      ),
                      Text('Contacts', style: TextStyle(color: Colors.white, fontSize: 24)),
                    ],
                  ),
                ),
              ),
              onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ContactsList())),
            ),
          ],
        ),
      ),
    );
  }
}
