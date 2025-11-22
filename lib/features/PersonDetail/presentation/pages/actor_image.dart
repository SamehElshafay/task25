import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:photo_view/photo_view.dart';
import 'package:task/core/di/init_di.dart';
import 'package:task/core/services/DialogService.dart';
import 'package:task/core/utils/app_colors.dart';
import 'package:task/core/utils/constants.dart';
import 'package:task/features/PersonDetail/domain/services/services.dart';
import 'package:task/features/PersonDetail/presentation/cubit/person_details_cubit.dart';

class ActorImage extends StatelessWidget {
  final String imageUrl;
  final PersonDetailsCubit cubit = PersonDetailsCubit(sl<PersonDetailService>());

  ActorImage({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Directionality(
      textDirection: TextDirection.ltr ,
      child: Scaffold(
        appBar: AppBar(
          backgroundColor: AppColors.baseColor,
          title: Text('Actor Image' ,style: Theme.of(context).textTheme.bodyMedium!.copyWith(
            color: AppColors.lightTextPrimary ,
            fontSize: 20.sp
          )),
          leading: IconButton(onPressed: () => context.pop(), icon: Icon(Icons.arrow_back_ios_outlined , color: AppColors.lightTextPrimary)),
        ),
        body: Stack(
          children: [
            PhotoView(
              imageProvider: NetworkImage(Constants.imagesUrl + imageUrl),
              backgroundDecoration: const BoxDecoration(
                color: Colors.black,
              ),
              minScale: PhotoViewComputedScale.covered,
              maxScale: PhotoViewComputedScale.covered * 2.0,
              initialScale: PhotoViewComputedScale.covered,
            ),
            Align(
              alignment: Alignment.bottomCenter,
              child: Container(
                height: 200,
                decoration: BoxDecoration(
                  gradient: LinearGradient(
                    begin: Alignment.topCenter,
                    end: Alignment.bottomCenter,
                    colors: [
                      AppColors.lightTextPrimary.withOpacity(0.0),
                      AppColors.lightTextPrimary.withOpacity(0.9),
                    ],
                  ),
                ),
              ),
            ),

            Positioned(
              bottom: 10,
              left: 10,
              right: 10,
              child: SizedBox(
                height: 50,
                child: BlocListener<PersonDetailsCubit, PersonDetailsState>(
                  bloc: context.read<PersonDetailsCubit>(),
                  listener: (context, state) {
                    if(state is SavingImageError){
                      DialogService.hideLoading(context);
                      DialogService.showError(context, "Try again later");
                    }
                    if(state is SavingImageLoading){
                      DialogService.showLoading(context,"loading...");
                    }
                    if(state is SavingImageSuccess){
                      DialogService.hideLoading(context);
                      DialogService.showSuccess(context, "photo saved");
                    }
                  },
                  child: ElevatedButton.icon(
                    onPressed: () {
                      context.read<PersonDetailsCubit>().saveImage(Constants.imagesUrl + imageUrl) ;
                    },
                    icon: Icon(
                      Icons.file_download_outlined,
                      color: AppColors.highlightColor,
                    ),
                    label: Text(
                      'Save Image',
                      style: const TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: AppColors.highlightColor,
                      ),
                    ),
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.percentageCardColor ,
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                      elevation: 8,
                    ),
                  ),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}