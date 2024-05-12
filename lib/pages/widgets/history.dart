import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class GameScoreData {
  final String userName;
  final int rawScore;
  final int calculatedScore;

  GameScoreData({required this.userName, required this.rawScore, required this.calculatedScore});
}

class HistoryData {
  final DateTime date;
  final List<GameScoreData> gameScores;

  HistoryData({required this.date, required this.gameScores});
}

class HistoryWidget extends StatelessWidget {
  final List<HistoryData> historyData;

  HistoryWidget({required this.historyData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: historyData.length,
      itemBuilder: (context, index) {
        return Card(
          child: Column(
            children: [
              Text(DateFormat('yyyy/mm/dd').format(historyData[index].date)),
              ...historyData[index].gameScores.asMap().entries.map((rankData) {
                return ListTile(
                  leading: CircleAvatar(
                    child: Text('${rankData.key + 1}'),
                  ),
                  title: Text(rankData.value.userName),
                  trailing: Text('${rankData.value.rawScore}点 / ${rankData.value.calculatedScore}'),
                );
              }).toList(),
            ],
          ),
        );
      },
    );
  }
}
