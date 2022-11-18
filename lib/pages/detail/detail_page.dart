import 'package:flutter/material.dart';

import 'widgets/index.dart';

class DetailPage extends StatelessWidget {
  const DetailPage({super.key});

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
            child: NoteTextField(
              controller: controller1,
              editable: false,
            ),
          ),
          const SizedBox(height: 40),
          Padding(
            padding: const EdgeInsets.symmetric(horizontal: 24),
            child: NoteTextField(
              controller: controller1,
              editable: false,
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
              child: NoteTextField(
                editable: false,
                controller: controller1,
                maxLines: 100,
                style: const TextStyle(
                  fontSize: 18,
                  color: Colors.black,
                  fontWeight: FontWeight.w400,
                ),
              ),
            ),
          ),
          Container(
            decoration: const BoxDecoration(boxShadow: [
              BoxShadow(
                  blurRadius: 4,
                  offset: Offset(0, -4),
                  color: Color(0x26B7B7B7))
            ], color: Colors.white),
            height: 50,
            child: Padding(
              padding: const EdgeInsets.symmetric(horizontal: 24),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  Icon(Icons.delete),
                  Icon(Icons.add),
                  Icon(Icons.edit),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
