import 'package:flutter/material.dart';
import 'package:gap/gap.dart';

class TrendingCards extends StatelessWidget {
  final String title;
  final String photoUrl;
  final String country;
  const TrendingCards(
      {super.key,
      required this.title,
      required this.photoUrl,
      required this.country});

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: const EdgeInsets.all(8),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.circular(8),
            child: Image.asset(
              photoUrl,
              width: double.infinity,
              fit: BoxFit.cover,
            ),
          ),
          const SizedBox(height: 8),
          Text(
            country,
            style: Theme.of(context).textTheme.labelSmall,
          ),
          Text(
            title,
            style: Theme.of(context).textTheme.bodyMedium,
          ),
          const SizedBox(height: 4),
          Row(
            children: [
              Text("icon"),
              Text(
                "BBC News",
                style: TextStyle(fontSize: 13, fontWeight: FontWeight.w700),
              ),
              Gap(12),
              Icon(
                Icons.timelapse_rounded,
                size: 17,
              ),
              Text(
                "4hr ago",
                style: Theme.of(context).textTheme.labelSmall,
              ),
            ],
          )
        ],
      ),
    );
  }
}
