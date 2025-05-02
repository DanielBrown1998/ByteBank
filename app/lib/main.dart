import 'package:app/screens/contact_form.dart';
import 'package:app/screens/contacts.dart';
import 'package:app/screens/home.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const App());
}

class App extends StatelessWidget {
  const App({super.key});
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'ByteBank',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.green),
      ),
      initialRoute: "/",
      routes: {
        "/": (context) => const HomePage(title: "DashBoard"),
        "contacts": (context) => ContactsPage(),
        "contact_form": (context) => ContactForm()
      },
    );
  }
}
