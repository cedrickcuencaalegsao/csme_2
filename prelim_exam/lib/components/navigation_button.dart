import 'package:flutter/material.dart';

class NavigationButton extends StatelessWidget {
  final String pageName;
  const NavigationButton({super.key, required this.pageName});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.symmetric(vertical: 8),
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/home');
            },
            icon: Icon(
              Icons.home,
              color: pageName == 'Home' ? Colors.blue : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/list');
            },
            icon: Icon(
              Icons.list,
              color: pageName == 'List' ? Colors.blue : Colors.grey,
            ),
          ),
          IconButton(
            onPressed: () {
              Navigator.pushNamed(context, '/card');
            },
            icon: Icon(
              Icons.credit_card,
              color: pageName == 'Card' ? Colors.blue : Colors.grey,
            ),
          ),
        ],
      ),
    );
  }
}
