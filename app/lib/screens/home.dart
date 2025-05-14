import 'package:app/screens/components/home_button.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key, required this.title});

  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        elevation: 10,
        backgroundColor: Theme.of(context).colorScheme.primary,
        title: Text(
          widget.title,
          style: TextStyle(
            fontSize: 20,
            fontWeight: FontWeight.bold,
            color: Colors.white,
          ),
        ),
      ),
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Image.asset(
              "assets/images/bytebank_logo.png",
              height: MediaQuery.of(context).size.height * .5,
            ),
          ),
          SizedBox(
            height: 125,
            child: ListView(
              scrollDirection: Axis.horizontal,
              children: [
                HomeButton(
                  icon: Icons.monetization_on,
                  name: "transfer",
                  onCLick: () {
                    Navigator.of(context).pushNamed("contacts");
                  },
                ),
                HomeButton(
                  icon: Icons.request_quote_rounded,
                  name: "Transaction feed",
                  onCLick: () => Navigator.of(context).pushNamed("transaction"),
                ),
                // HomeButton(
                //   icon: Icons.request_quote_rounded,
                //   name: "Transaction feed",
                //   routeName: "transactions",
                // ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
