import 'package:flutter/material.dart';

class NoteTextField extends StatelessWidget {
  const NoteTextField({
    super.key,
    required this.editable,
    required this.controller,
    this.style,
    this.maxLines,
  });

  final bool editable;
  final TextEditingController controller;
  final TextStyle? style;
  final int? maxLines;

  @override
  Widget build(BuildContext context) {
    return TextField(
      enabled: editable,
      controller: controller,
      minLines: 1,
      maxLines: maxLines ?? 1,
      style: style ??
          const TextStyle(
            fontSize: 24,
            color: Colors.black,
            fontWeight: FontWeight.w700,
          ),
      decoration: const InputDecoration(
        contentPadding: EdgeInsets.zero,
        border: OutlineInputBorder(
          borderSide: BorderSide.none,
        ),
      ),
    );
  }
}
