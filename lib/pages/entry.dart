import 'package:flutter/material.dart';
import './home.dart';

class EntryPage extends StatefulWidget {
  const EntryPage({super.key, required this.title});
  final String title;

  @override
  State<EntryPage> createState() => _EntryPageState();
}

class _EntryPageState extends State<EntryPage> {
  String leagueName = "";

  void setLeagueName(String value) {
    setState((
    ) {
      leagueName = value;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            const Text("リーグ名を入力してください。"),
            Text(leagueName),
            TextField(
              onChanged: (value) {
                setLeagueName(value);
              },
              decoration: const InputDecoration(
                border: OutlineInputBorder(),
                labelText: 'Enter text',
              ),
            ),
            ElevatedButton(
              onPressed: () {
                // ボタンが押されたときの処理をここに書く
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => HomePage(title: 'Home Page')),
                );
              },
              child: const Text('Submit'),
            ),
          ],
        ),
      ),
    );
  }
}