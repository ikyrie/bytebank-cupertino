import 'package:bytecupertino/model/contato.dart';
import 'package:flutter/material.dart';

class Cartao extends StatelessWidget {
  const Cartao({Key? key, required this.contact}) : super(key: key);
  final Contato contact;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
          border: Border(
              bottom: BorderSide(
            color: Colors.blue,
            style: BorderStyle.solid,
            width: 1,
          ))
      ),
      child: Padding(
        padding: const EdgeInsets.all(16),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            Text(
              contact.name,
              style: const TextStyle(fontSize: 22),
            ),
            Text(
              contact.account.toString(),
              style: const TextStyle(fontSize: 18, color: Colors.grey),
            )
          ],
        ),
      ),
    );
  }
}
