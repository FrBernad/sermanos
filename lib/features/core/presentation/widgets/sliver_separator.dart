import 'package:flutter/cupertino.dart';
import 'package:sermanos/config/design_system/tokens/sermanos_grid.dart';

class SliverSeparator extends StatelessWidget {
  const SliverSeparator({
    Key? key,
    this.height = SermanosGrid.horizontalSpacing,
    this.width = SermanosGrid.horizontalSpacing,
  }) : super(key: key);

  final double height;
  final double width;

  @override
  Widget build(BuildContext context) {
    return SliverToBoxAdapter(
      child: SizedBox(
        height: height,
        width: width,
      ),
    );
  }
}
