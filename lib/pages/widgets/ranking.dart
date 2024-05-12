import 'package:flutter/material.dart';

class RankingData {
  final String userName;
  final int score;

  RankingData({required this.userName, required this.score});
}

class RankingWidget extends StatelessWidget {
  final List<RankingData> rankingData;

  RankingWidget({required this.rankingData});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
      itemCount: rankingData.length,
      itemBuilder: (context, index) {
        return ListTile(
          leading: CircleAvatar(
            child: Text('${index + 1}'),
          ),
          title: Text(rankingData[index].userName),
          trailing: Text('${rankingData[index].score}'),
        );
      },
    );
  }
}
