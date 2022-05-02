import 'package:bytecupertino/components/cartao.dart';
import 'package:bytecupertino/database/dao/contacts_dao.dart';
import 'package:bytecupertino/screens/contacts_form.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';

import '../model/contato.dart';

class ContactsList extends StatefulWidget {
  ContactsList({Key? key}) : super(key: key);

  @override
  State<ContactsList> createState() => _ContactsListState();
}

class _ContactsListState extends State<ContactsList> {
  final ContactsDao dao = ContactsDao();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        middle: const Text('Contacts'),
        trailing: CupertinoButton(
          padding: EdgeInsets.zero,
          child: const Icon(
            Icons.add,
            size: 32,
          ),
          onPressed: () => Navigator.of(context).push(CupertinoPageRoute(builder: (context) => ContactsForm())).then((value) => setState(() {})),
        ),
      ),
      child: SafeArea(
        child: FutureBuilder(
          future: dao.getAllContacts(),
          builder: (context, snapshot) {
            switch(snapshot.connectionState) {
              case ConnectionState.none:
                break;
              case ConnectionState.waiting:
                return Center(
                  child: Column(
                    children: const <Widget>[
                      CupertinoActivityIndicator(),
                      Text('Loading'),
                    ],
                  ),
                );
              case ConnectionState.active:
                break;
              case ConnectionState.done:
                if(snapshot.hasData) {
                  final List<Contato> result = snapshot.data as List<Contato>; 
                  return ListView.builder(
                    itemBuilder: (context, index) {
                      final Contato contato = result[index];
                      return Cartao(contact: contato);
                    },
                    itemCount: result.length,
                  );
                }
                break;
            }
            final Contato emptyContact = Contato(0,0,'Teste');
            return Cartao(contact: emptyContact);
          },
        ),
      ),
    );
  }
}
