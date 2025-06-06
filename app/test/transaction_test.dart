import 'package:app/models/contact.dart';
import 'package:app/models/transaction.dart';
import 'package:flutter_test/flutter_test.dart';

void main() {
  test("Should return value whne create a transaction", () {
    final Transaction transaction = Transaction(
      "",
      200,
      Contact(1, "Daniel", 123),
    );

    expect(transaction.value, 200);
  });
  
}
