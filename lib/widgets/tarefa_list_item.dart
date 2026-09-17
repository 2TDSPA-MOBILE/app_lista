import 'package:flutter/material.dart';

class TarefaListItem extends StatelessWidget {
  const TarefaListItem({super.key,required this.title});

  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(6),
        color: Colors.grey[200]
      ),
    
      padding: EdgeInsets.all(16),
      child:Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(title,
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight(600)
                ),
              ),
          Text("Criado em 17/09/2026",
                style: TextStyle(fontSize: 12),
          )
        ],
      )
    );
  }
}