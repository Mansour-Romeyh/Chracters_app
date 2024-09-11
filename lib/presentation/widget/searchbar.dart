import 'package:flutter/material.dart';

class Searchbar extends StatelessWidget {
  final void Function(String)? onChanged;
  final VoidCallback onPressed;
  const Searchbar({super.key, this.onChanged, required this.onPressed});

  @override
  Widget build(BuildContext context) {
    return Row(
      // mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        Expanded(
            child: Container(
                margin: const EdgeInsets.only(right: 30),
                child: TextFormField(
                  onChanged: onChanged,
                  autofocus: true,
                  decoration: const InputDecoration(
                      contentPadding: EdgeInsets.all(4),
                      hintText: 'Find a Chracter',
                      border: OutlineInputBorder(borderSide: BorderSide.none)),
                ))),
        IconButton(onPressed: onPressed, icon: const Icon(Icons.close))
      ],
    );
  }
}
