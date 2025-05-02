class Contact {
  Contact({required this.name, required this.account});
  final String name;
  final String account;

  @override
  String toString() {
    return "$name: $account";
  }
}
