import 'package:flutter/material.dart';

class HomeButton extends StatelessWidget {
  final String name;
  final IconData icon;
  final Function onCLick;

  const HomeButton({
    super.key,
    required this.name,
    required this.icon,
    required this.onCLick,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(8.0),
      child: SizedBox(
        width: 175,
        child: Material(
          color: Colors.green.shade800,
          child: InkWell(
            onTap: () async {
              onCLick();
            },
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              children: [
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Icon(icon, color: Colors.white, size: 26),
                ),
                Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Text(
                    name,
                    style: TextStyle(color: Colors.white, fontSize: 20),
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
