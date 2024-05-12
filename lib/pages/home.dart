import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key, required this.title}) : super(key: key);
  final String title;

  @override
  State<HomePage> createState() => _HomePageState();
}

class RankingWidget extends StatelessWidget {
  final List<String> rankingData;


  RankingWidget({required this.rankingData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rankingData.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: Text('${index + 1}'),
          title: Text(rankingData[index]),
        );
      },
    );
  }
}


class HistoryPage extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Center(
      child: Text('This is the history page'),
    );
  }
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
      RankingWidget(rankingData: ['A', 'B', 'C']),
      HistoryPage(),
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