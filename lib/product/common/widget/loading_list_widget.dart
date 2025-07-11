import 'package:flutter/material.dart';
import 'package:kartal/kartal.dart';
import 'package:shimmer/shimmer.dart';

class LoadingListWidget extends StatelessWidget {
  const LoadingListWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Shimmer(
      period: Duration(seconds: 2),
      gradient: LinearGradient(
        colors: [
          context.general.colorScheme.primary.withValues(alpha: 0.2),
          context.general.colorScheme.primary.withValues(alpha: 0.1),
          context.general.colorScheme.primary.withValues(alpha: 0.2),
        ],
      ),
      child: ListView.builder(
        itemCount: 10,
        itemBuilder: (BuildContext context, int index) {
          return SizedBox(height: 100, child: Card(child: ListTile()));
        },
      ),
    );
  }
}
