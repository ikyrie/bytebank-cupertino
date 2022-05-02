class Contato {
  final int id;
  final int account;
  final String name;

  const Contato(this.id, this.account, this.name);

  @override
  String toString() {
    return 'Contato{id: $id, account: $account, name: $name}';
  }
}
