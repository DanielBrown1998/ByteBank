class Contact {
  Contact({required this.id, required this.name, required this.account});
  final int id;
  final String name;
  final String account;

  factory Contact.fromMap(Map<String, dynamic> contact) {
    return Contact(
      id: contact['id'],
      name: contact['name'],
      account: contact['account'],
    );
  }

  @override
  String toString() {
    return "$name: $account";
  }
}
