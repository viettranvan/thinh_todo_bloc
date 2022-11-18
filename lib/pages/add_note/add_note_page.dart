import 'package:flutter/material.dart';

import 'widgets/index.dart';

class AddNotePage extends StatelessWidget {
  const AddNotePage({super.key});

  @override
  Widget build(BuildContext context) {
    var controller1 = TextEditingController();
    controller1.text = '''titles
''';

    return Scaffold(
      appBar: AppBar(
        leadingWidth: 50,
        leading: IconButton(
          onPressed: () {
            Navigator.pop(context);
          },
          icon: const SizedBox(
            // width:0,
            height: 16.97,
            child: Icon(
              Icons.arrow_back_ios_new,
              color: Colors.black,
            ),
          ),
        ),
        backgroundColor: Colors.white,
        elevation: 1,
        centerTitle: true,
        toolbarHeight: 50,
      ),
      body: Column(
        children: [
          const SizedBox(height: 20),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NoteActiveTextField(
              controller: controller1,
              onChanged: (value) {},
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NoteActiveTextField(
              controller: controller1,
              onChanged: (value) {},
              style: const TextStyle(
                fontSize: 18,
                color: Colors.black,
                fontWeight: FontWeight.w400,
              ),
            ),
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: NoteActiveTextField(
                controller: controller1,
                onChanged: (value) {},
                maxLines: 100,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
