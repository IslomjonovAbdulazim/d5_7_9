import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class NewNotePage extends StatefulWidget {
  const NewNotePage({super.key});

  @override
  State<NewNotePage> createState() => _NewNotePageState();
}

class _NewNotePageState extends State<NewNotePage> {
  TextEditingController noteController = TextEditingController();

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text("Note Details")),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
          child: Column(
            children: [
              TextField(
                controller: noteController,
                decoration: InputDecoration(
                  hintText: "Note...",
                ),
              ),
              SizedBox(height: 20),
              CupertinoButton(
                color: Colors.yellow,
                onPressed: () async {
                  final db = await SharedPreferences.getInstance();
                  List notes = db.getStringList("notes") ?? [];
                  String note = noteController.text.trim();
                  if (note.isEmpty) return;
                  notes.add(note);
                  await db.setStringList("notes", List<String>.from(notes));
                  Navigator.pop(context);
                },
                child: Center(child: Text("Save")),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
