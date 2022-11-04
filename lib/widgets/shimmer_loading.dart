import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:shimmer/shimmer.dart';

///Created by Naman Gupta on 21/4/21.

class ShimmerLoading extends StatelessWidget {
  final Widget _child;
  Color baseColor;
  Color highlightColor;

  ShimmerLoading(this._child,
      {this.baseColor = AppColors.simmer_base_color,
      this.highlightColor = AppColors.simmer_highlight_color});

  @override
  Widget build(BuildContext context) {
    return Shimmer.fromColors(
        child: _child, baseColor: baseColor, highlightColor: highlightColor);
  }
}
