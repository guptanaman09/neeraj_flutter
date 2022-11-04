import 'package:flutter/material.dart';
import 'package:neeraj_flutter_app/constants/colors.dart';
import 'package:neeraj_flutter_app/widgets/horizontal_gap.dart';

///Created by Naman Gupta on 21/4/21.

// this class shows the UI of the shimmer loading.

class ShimmerCustomView extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 8, vertical: 8),
      child: Container(
        child: Row(
            mainAxisAlignment: MainAxisAlignment.start,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              Container(
                decoration: const BoxDecoration(
                  color: Colors.black,
                  shape: BoxShape.circle,
                ),
                child: ClipOval(
                  child: Image.network(
                    'https://flutter'
                    '.dev/docs/cookbook/img-files/effects/split-check/Avatar1.jpg',
                    fit: BoxFit.cover,
                    height: 50,
                    width: 50,
                  ),
                ),
              ),
              HorizontalGap(30),
              Container(
                height: 20,
                width: 250,
                color: AppColors.secondaryColor,
              )
            ]),
      ),
    );
  }
}
