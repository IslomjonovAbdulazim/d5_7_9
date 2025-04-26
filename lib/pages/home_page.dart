import 'package:d5_7_9/pages/new_note_page.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List notes = [];

  @override
  void initState() {
    load();
    super.initState();
  }

  void load() async {
    final db = await SharedPreferences.getInstance();
    notes = db.getStringList("notes") ?? [];
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text("Notes"),
        actions: [
          CupertinoButton(
            padding: EdgeInsets.zero,
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => NewNotePage(),
                ),
              );
            },
            child: Icon(Icons.add, size: 30),
          ),
          SizedBox(width: 10),
        ],
      ),
      body: SafeArea(
        child: Padding(
          padding: EdgeInsets.all(20),
        ),
      ),
    );
  }
}
