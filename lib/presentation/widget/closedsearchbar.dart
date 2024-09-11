import 'package:flutter/material.dart';

class CloseSearch extends StatelessWidget {
  final VoidCallback onPressed;
  const CloseSearch({super.key, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Text('Chracters'),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.search))
      ],
    );
  }
}
