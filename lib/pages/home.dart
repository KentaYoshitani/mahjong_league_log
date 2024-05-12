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
    );
  }
}