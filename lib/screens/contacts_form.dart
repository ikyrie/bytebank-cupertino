import 'package:bytecupertino/components/input.dart';
import 'package:flutter/cupertino.dart';

import '../model/contato.dart';
import '../database/dao/contacts_dao.dart';

class ContactsForm extends StatefulWidget {
  ContactsForm({Key? key}) : super(key: key);

  @override
  State<ContactsForm> createState() => _ContactsFormState();
}

class _ContactsFormState extends State<ContactsForm> {
  final TextEditingController _nameFieldController = TextEditingController();
  final TextEditingController _accountFieldController = TextEditingController();
  final ContactsDao dao = ContactsDao();

  @override
  Widget build(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: const CupertinoNavigationBar(
        middle: Text('Add Contacts'),
      ),
      child: SingleChildScrollView(
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: <Widget>[
                Column(
                  children: [
                    Input('Name', 'John', _nameFieldController, TextInputType.name),
                    Input('Account', '0000', _accountFieldController, TextInputType.number),
                  ],
                ),
                CupertinoButton.filled(child: const Text('Add'), onPressed: () => _addContact(context))
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _addContact(BuildContext context) {
    final String? name = _nameFieldController.text;
    final int? accountNumber = int.tryParse(_accountFieldController.text);
    if(name != null && accountNumber != null) {
      final contact = Contato(0, accountNumber, name);
      dao.saveContact(contact).then((value) => Navigator.pop(context));
    }
  }
}
