

import 'package:flutter/material.dart';

class NoteCount extends StatelessWidget {
  const NoteCount({
    Key? key,
    required this.noteCount,
  }) : super(key: key);

  final int noteCount;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: const BoxDecoration(
        color: Colors.white,
        boxShadow: [
          BoxShadow(color: Colors.white, blurRadius: 1),
          BoxShadow(color: Colors.grey, blurRadius: 2),
          BoxShadow(color: Colors.grey, blurRadius: 3),
        ],
      ),
      width: double.infinity,
      height: 47,
      child: Center(
        child: Text(
          '$noteCount Notes',
          style: const TextStyle(
            color: Colors.black,
            fontFamily: 'Roboto',
            fontWeight: FontWeight.w400,
            fontSize: 14,
            letterSpacing: 0.02,
          ),
        ),
      ),
    );
  }
}
