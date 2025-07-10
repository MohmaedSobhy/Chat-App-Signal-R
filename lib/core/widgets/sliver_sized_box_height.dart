import 'package:flutter/material.dart';

class SliverSizedBoxHeight extends StatelessWidget {
  final double height;
  const SliverSizedBoxHeight({super.key, this.height = 10});

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(child: SizedBox(height: height));
  }
}
