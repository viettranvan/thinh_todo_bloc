import 'package:flutter/material.dart';

class NoteActiveTextField extends StatelessWidget {
  const NoteActiveTextField({
    super.key,
    required this.controller,
    required this.onChanged,
    this.style,
    this.maxLines,
  });

  final TextEditingController controller;
  final TextStyle? style;
  final int? maxLines;
  final Function(String)? onChanged;

  @override
  Widget build(BuildContext context) {
    return TextField(
      controller: controller,
      minLines: 1,
      maxLines: maxLines ?? 1,
      style: style ??
          const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
      onChanged: onChanged,
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
