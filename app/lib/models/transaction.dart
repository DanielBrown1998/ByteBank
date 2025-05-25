class Transaction {
  final double value;
  final String contact;
  final String name;

  Transaction({required this.value, required this.contact, required this.name});

  @override
  String toString() {
    return 'Transaction{value: $value, contact: $contact, name: $name}';
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;

    return other is Transaction &&
        other.value == value &&
        other.contact == contact &&
        other.name == name;
  }

  @override
  int get hashCode => value.hashCode ^ contact.hashCode;

  factory Transaction.fromJson(Map<String, dynamic> json) {
    return Transaction(
      value: (json['value'] as num).toDouble(),
      contact: json['contact'] as String,
      name: json['name'] as String,
    );
  }

  Map<String, dynamic> toJson() {
    return {'value': value, 'contact': contact, 'name': name};
  }
}
