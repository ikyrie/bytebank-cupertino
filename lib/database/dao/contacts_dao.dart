import 'package:bytecupertino/database/app_database.dart';
import 'package:bytecupertino/model/contato.dart';
import 'package:sqflite/sqflite.dart';

class ContactsDao {
  static const String sql = 'CREATE TABLE IF NOT EXISTS $_tableName ($_id INTEGER PRIMARY KEY AUTOINCREMENT, $_name TEXT, $_accountNumber INTEGER);';
  static const String _tableName = 'Contacts';
  static const String _id = 'id';
  static const String _name = 'name';
  static const String _accountNumber = 'accountNumber';
 
  Future<void> saveContact(Contato contato) async {
    final Database db = await createDatabase(sql);
    Map<String, dynamic> contactMap = _toMap(contato);
    db.insert(_tableName, contactMap);
  }
 
  Map<String, dynamic> _toMap(Contato contato) {
    final Map<String, dynamic> contactMap = {};
    contactMap[_name] = contato.name;
    contactMap[_accountNumber] = contato.account;
    return contactMap;
  }

  Future<List<Contato>> getAllContacts() async {
    final Database db = await createDatabase(sql);
    final List<Map<String, dynamic>> results = await db.query(_tableName);
    List<Contato> contacts = _toList(results);
    return contacts;
  }

  List<Contato> _toList(List<Map<String, dynamic>> results) {
    final List<Contato> contacts = [];
    for (Map<String, dynamic> result in results) {
      final Contato contact = Contato(result[_id], result[_accountNumber], result[_name]);
      contacts.add(contact);
    }
    return contacts;
  }
}
