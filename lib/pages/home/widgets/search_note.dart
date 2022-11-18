import 'package:flutter/material.dart';

class SearchNote extends StatelessWidget {
  const SearchNote({
    super.key,
    this.onChanged,
    required this.searchController,
  });

  final Function(String)? onChanged;
  final TextEditingController searchController;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
      width: 366,
      height: 48,
      child: TextField(
        keyboardType: TextInputType.multiline,
        maxLength: null,
        maxLines: null,
        style: const TextStyle(
          height: 1.5,
          color: Colors.black,
          fontSize: 16,
          fontFamily: 'Roboto',
          fontStyle: FontStyle.normal,
          fontWeight: FontWeight.w400,
          letterSpacing: 0.02,
        ),
        textAlignVertical: TextAlignVertical.center,
        controller: searchController,
        onChanged: onChanged,
        cursorHeight: 26,
        cursorColor: Colors.grey,
        autofocus: false,
        decoration: InputDecoration(
          contentPadding: EdgeInsets.zero,
          prefixIcon: const Icon(
            Icons.search,
            color: Colors.grey,
          ),
          hintText: 'Search your notes',
          hintStyle: const TextStyle(
            color: Color.fromARGB(126, 158, 158, 158),
            fontSize: 16,
            fontFamily: 'Roboto',
            fontStyle: FontStyle.normal,
            fontWeight: FontWeight.w400,
            letterSpacing: 0.02,
          ),
          enabledBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 0.7,
              color: Colors.grey,
              strokeAlign: StrokeAlign.outside,
            ),
          ),
          focusedBorder: OutlineInputBorder(
            borderRadius: BorderRadius.circular(5),
            borderSide: const BorderSide(
              style: BorderStyle.solid,
              width: 0.7,
              color: Colors.grey,
              strokeAlign: StrokeAlign.outside,
            ),
          ),
        ),
      ),
    );
  }
}
