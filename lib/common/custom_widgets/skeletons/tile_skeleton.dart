import 'package:flutter/material.dart';
import 'package:shimmer/shimmer.dart';

class CustomTileSkeleton extends StatelessWidget {
  const CustomTileSkeleton({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
      baseColor: Colors.grey.shade300,
      highlightColor: Colors.grey.shade100,
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          ClipRRect(
            borderRadius: BorderRadius.all(Radius.circular(8)),
            child: Container(
              width: 100,
              height: 100,
              color: Colors.white,
            ),
          ),
          const SizedBox(width: 10),
          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                // Title placeholder
                Container(
                  width: double.infinity,
                  height: 20,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 8),
                ),
                // Description lines
                Container(
                  width: double.infinity,
                  height: 14,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 4),
                ),
                Container(
                  width: double.infinity,
                  height: 14,
                  color: Colors.white,
                  margin: const EdgeInsets.only(bottom: 4),
                ),
                Container(
                  width: MediaQuery.of(context).size.width * 0.5,
                  height: 14,
                  color: Colors.white,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
