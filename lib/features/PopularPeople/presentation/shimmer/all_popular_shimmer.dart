import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:shimmer_animation/shimmer_animation.dart';

class PopularPeopleLoadingScreen extends StatelessWidget {
  const PopularPeopleLoadingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    const Color baseColor = Color(0xFF282828);
    const Color highlightColor = Color(0xFF3B3B3B);

    return Container(
      width: 1.sw,
      height: 1.sh,
      child: Shimmer(
        color: baseColor,
        child: ListView.builder(
          itemCount: 7,
          itemBuilder: (context, index) {
            if (index == 5) {
              return Padding(
                padding: const EdgeInsets.symmetric(vertical: 20.0),
                child: Center(
                  child: Column(
                    children: [
                      SizedBox(
                        width: 30,
                        height: 30,
                        child: CircularProgressIndicator(
                          valueColor: AlwaysStoppedAnimation<Color>(Colors.grey[800]!),
                          strokeWidth: 2,
                        ),
                      ),
                    ],
                  ),
                ),
              );
            }
            return const PopularPeopleSkeletonItem();
          },
        ),
      ),
    );
  }
}

class PopularPeopleSkeletonItem extends StatelessWidget {
  const PopularPeopleSkeletonItem({super.key});

  @override
  Widget build(BuildContext context) {
    const Color skeletonColor = Color(0xFF333333);
    const double padding = 16.0;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: padding, vertical: 8.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.center,
        children: <Widget>[
          Container(
            width: 50.0,
            height: 50.0,
            decoration: const BoxDecoration(
              color: skeletonColor,
              shape: BoxShape.circle,
            ),
          ),
          const SizedBox(width: padding),

          Expanded(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: <Widget>[
                Container(
                  width: double.infinity,
                  height: 18.0,
                  color: skeletonColor,
                  margin: const EdgeInsets.only(right: 60.0),
                ),
                const SizedBox(height: 8.0),

                Container(
                  width: 100.0,
                  height: 14.0,
                  color: skeletonColor,
                ),
              ],
            ),
          ),

          const SizedBox(width: padding),

          Container(
            width: 40.0,
            height: 20.0,
            decoration: BoxDecoration(
              color: skeletonColor,
              borderRadius: BorderRadius.circular(4.0),
            ),
          ),

          const SizedBox(width: 8.0),

          const Icon(
            Icons.arrow_forward_ios,
            color: skeletonColor,
            size: 16.0,
          ),
        ],
      ),
    );
  }
}