import 'package:flutter/material.dart';
import './widgets/ranking.dart';
import './widgets/history.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  int _selectedIndex = 0;

  void _onNavigationBarItemTapped(int index) {
    setState(() {
      _selectedIndex = index;
    });
  }

  List<String> _userNames = ['Alice', 'Bob', 'Charlie', 'Dave'];

  void _onFloatingActionButtonPressed() {
    DateTime _selectedDate = DateTime.now();
    showDialog(
      context: context,
      builder: (context) {
        return Dialog(
          child: Container(
            padding: EdgeInsets.all(8.0),
            child: SingleChildScrollView(
              child: Column(
                mainAxisSize: MainAxisSize.min, // ダイアログのサイズを内容に合わせる
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text('記録する', style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold)), // タイトルを追加
                  TextButton(
                    onPressed: () async {
                      final DateTime? picked = await showDatePicker(
                        context: context,
                        initialDate: _selectedDate,
                        firstDate: DateTime(2000),
                        lastDate: DateTime.now(),
                      );
                      if (picked != null && picked != _selectedDate) {
                        _selectedDate = picked;
                      }
                    },
                    child: Text('Select date'),
                  ),
                  DropdownButtonFormField<String>(
                    items: _userNames.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    decoration: InputDecoration(
                      labelText: 'userName1',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'rawScore1',
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    items: _userNames.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    decoration: InputDecoration(
                      labelText: 'userName2',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'rawScore2',
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    items: _userNames.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    decoration: InputDecoration(
                      labelText: 'userName3',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'rawScore3',
                    ),
                  ),
                  DropdownButtonFormField<String>(
                    items: _userNames.map((String value) {
                      return DropdownMenuItem<String>(
                        value: value,
                        child: Text(value),
                      );
                    }).toList(),
                    onChanged: (_) {},
                    decoration: InputDecoration(
                      labelText: 'userName4',
                    ),
                  ),
                  TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      labelText: 'rawScore4',
                    ),
                  ),
                  ElevatedButton(
                    onPressed: () {
                      // 送信ボタンが押されたときの処理をここに書く
                    },
                    child: Text('Submit'),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }

  @override
  Widget build(BuildContext context) {
    final List<Widget> _tabContents = <Widget>[ // ページウィジェットのリスト
      RankingWidget(rankingData: [
        RankingData(userName: 'Alice', score: 100),
        RankingData(userName: 'Bob', score: 40),
        RankingData(userName: 'Charlie', score: -10),
        RankingData(userName: 'Dave', score: -40),
      ]),
      HistoryWidget(
        historyData: [
          HistoryData(
            date: DateTime.now(),
            gameScores: [
              GameScoreData(userName: 'Alice', rawScore: 30000, calculatedScore: 100),
              GameScoreData(userName: 'Bob', rawScore: 25000, calculatedScore: 40),
              GameScoreData(userName: 'Charlie', rawScore: 20000, calculatedScore: -10),
              GameScoreData(userName: 'Dave', rawScore: 15000, calculatedScore: -40),
            ],
          ),
          HistoryData(
            date: DateTime.now().subtract(const Duration(days: 1)),
            gameScores: [
              GameScoreData(userName: 'Alice', rawScore: 30000, calculatedScore: 100),
              GameScoreData(userName: 'Bob', rawScore: 25000, calculatedScore: 40),
              GameScoreData(userName: 'Charlie', rawScore: 20000, calculatedScore: -10),
              GameScoreData(userName: 'Dave', rawScore: 15000, calculatedScore: -40),
            ],
          ),
        ],
      ),
    ];

    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme
            .of(context)
            .colorScheme
            .secondary,
        title: Text(widget.title),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            Expanded(
              child: _tabContents[_selectedIndex],
            ),
          ],
        ),
      ),
      bottomNavigationBar: BottomNavigationBar( // 追加
        items: const <BottomNavigationBarItem>[
          BottomNavigationBarItem(
            icon: Icon(Icons.star),
            label: 'ランキング',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.history),
            label: '履歴',
          ),
        ],
        currentIndex: _selectedIndex,
        selectedItemColor: Colors.amber[800],
        onTap: _onNavigationBarItemTapped,
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: _onFloatingActionButtonPressed,
        child: Icon(Icons.add),
      ), // これを追加
    );
  }
}