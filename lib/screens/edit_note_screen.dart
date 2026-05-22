import 'package:flutter/material.dart';

class EditNoteScreen extends StatefulWidget {
  final String currentNote;

  const EditNoteScreen({
    super.key,
    required this.currentNote,
  });

  @override
  State<EditNoteScreen> createState() =>
      _EditNoteScreenState();
}

class _EditNoteScreenState
    extends State<EditNoteScreen> {

  late TextEditingController
      controller;

  @override
  void initState() {
    super.initState();

    controller =
        TextEditingController(
      text:
          widget.currentNote,
    );
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(
      BuildContext context) {

    return Scaffold(

      appBar: AppBar(
        title:
            const Text(
          "Edit Note",
        ),
      ),

      body: Padding(
        padding:
            const EdgeInsets.all(
          16,
        ),

        child: Column(
          children: [

            TextField(
              controller:
                  controller,

              decoration:
                  const InputDecoration(
                labelText:
                    "Cooking Note",

                border:
                    OutlineInputBorder(),
              ),
            ),

            const SizedBox(
              height: 20,
            ),

            ElevatedButton(

              onPressed: () {

                Navigator.pop(
                  context,
                  controller.text,
                );
              },

              child:
                  const Text(
                "Save",
              ),
            )
          ],
        ),
      ),
    );
  }
}