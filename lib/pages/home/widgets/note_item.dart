import 'package:flutter/material.dart';
import 'package:todo_bloc/models/index.dart';

class NoteItem extends StatelessWidget {
  const NoteItem({
    Key? key,
    required this.item,
    required this.onTapNote,

  }) : super(key: key);

  final Note item;
  final VoidCallback? onTapNote;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTapNote,
      child: Container(
        width: 366,
        height: 150,
        // padding: ,
        decoration: BoxDecoration(
          color: item.color,
          borderRadius: BorderRadius.circular(5),
          border: const Border(
            left: BorderSide(
                color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 0.7),
            right: BorderSide(
                color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 0.7),
            bottom: BorderSide(
                color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 0.7),
            top: BorderSide(
                color: Colors.grey, strokeAlign: StrokeAlign.outside, width: 0.7),
          ),
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              width: double.infinity,
              height: 19.5,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 32,
              ),
              child: Text(
                item.titleNote,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w700,
                  fontSize: 18,
                  letterSpacing: 0.02,
                ),
              ),
            ),
            const SizedBox(
              width: double.infinity,
              height: 3,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                vertical: 0.0,
                horizontal: 32,
              ),
              child: Text(
                item.detailsNote,
                // item.detailsNote.substring(0, 120)
                maxLines: 3,
                textAlign: TextAlign.left,
                style: const TextStyle(
                  fontFamily: 'Roboto',
                  fontWeight: FontWeight.w400,
                  letterSpacing: 0.02,
                  fontSize: 14,
                  height: 1.5,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
