import 'package:flutter/material.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:task/core/utils/app_colors.dart';

class PaginationWidget extends StatelessWidget {
  final int currentPage;
  final int totalPages;
  final Function(int) onPageSelected;

  PaginationWidget({
    required this.currentPage,
    required this.totalPages,
    required this.onPageSelected,
  });

  List<int> _visiblePages() {
    if (totalPages <= 5) {
      return List.generate(totalPages, (i) => i + 1);
    } else {
      if (currentPage <= 3) {
        return [1, 2, 3, 4, -1, totalPages];
      } else if (currentPage >= totalPages - 2) {
        return [1, -1, totalPages - 3, totalPages - 2, totalPages - 1, totalPages];
      } else {
        return [1, -1, currentPage - 1, currentPage, currentPage + 1, -1, totalPages];
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final pages = _visiblePages();
    return Container(
      padding: EdgeInsets.symmetric(horizontal: 10.w, vertical: 6.h),
      decoration: BoxDecoration(
        color: Colors.black.withOpacity(0.9),
        borderRadius: BorderRadius.circular(12.r),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          _arrowButton(Icons.arrow_back_ios_rounded, currentPage > 1 ? () => onPageSelected(currentPage - 1) : null),
          ...pages.map((page) {
            if (page == -1) {
              return Padding(
                padding: EdgeInsets.symmetric(horizontal: 6.w),
                child: Text(
                  "...",
                  style: Theme.of(context).textTheme.bodyMedium!.copyWith(
                    color: Colors.white,
                  ),
                ),
              );
            }
            return _pageButton(page,context);
          }).toList(),
          _arrowButton(Icons.arrow_forward_ios_rounded, currentPage < totalPages ? () => onPageSelected(currentPage + 1) : null),
        ],
      ),
    );
  }

  Widget _pageButton(int page , BuildContext context) {
    final isActive = page == currentPage;
    return InkWell(
      onTap: () => onPageSelected(page),
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 3.w),
        padding: EdgeInsets.symmetric(horizontal: 8.w, vertical: 4.h),
        decoration: BoxDecoration(
          color: isActive ? AppColors.baseColor : Colors.transparent,
          borderRadius: BorderRadius.circular(8.r),
        ),
        child: Text(
          page.toString(),
          style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: Colors.white,
          ),
        ),
      ),
    );
  }

  Widget _arrowButton(IconData icon, VoidCallback? onTap) {
    return InkWell(
      onTap: onTap,
      child: Container(
        margin: EdgeInsets.symmetric(horizontal: 4),
        padding: EdgeInsets.symmetric(horizontal: 8, vertical: 6),
        decoration: BoxDecoration(
          color: onTap != null ? Colors.transparent : Colors.transparent,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Icon(
          icon ,
          color: Colors.white ,
          size: 15.r ,
        ),
      ),
    );
  }
}
