import 'dart:io';

import 'package:defer_pointer/defer_pointer.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:learning_management/core/services/file_picker_services.dart';
import 'package:learning_management/core/utils/enums/enums.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/core/utils/styles/app_text_styles.dart';
import 'package:learning_management/core/utils/ui_helpers/alignments.dart';
import 'package:learning_management/core/utils/ui_helpers/radius.dart';
import 'package:learning_management/core/utils/ui_helpers/spacing.dart';
import 'package:learning_management/features/lessons/presentation/widgets/submission_types_selection.dart';

class FilesUploadWidget extends HookWidget {
  final Function(List<File>? files, UploadType type) selectedFiles;

  const FilesUploadWidget({super.key, required this.selectedFiles});

  @override
  Widget build(BuildContext context) {

    final fileTypeIsPDF = useState<bool>(true);

    final selectedPDF = useState<File?>(null);
    final selectedImages = useState<List<File>?>(null);


    Future<void> uploadFiles() async {
      if(fileTypeIsPDF.value){
        selectedPDF.value = await FilePickerServices.uploadPDF();
        selectedFiles([?selectedPDF.value],UploadType.pdf);
      }else{
        List<File>? imageFiles = await FilePickerServices.uploadMultipleImages();
        selectedImages.value = [...?imageFiles,...?selectedImages.value];
        selectedFiles(selectedImages.value, UploadType.images);
      }
    }


    return DeferredPointerHandler(
      child: Column(
        children: [

          SubmissionTypeSelection(
            onChanged: (int index) => fileTypeIsPDF.value = index == 0,
          ),

          gap24,

          /// For Single PDF file upload ********************************
          if(fileTypeIsPDF.value)
            Row(
              spacing: 12.w,
              children: [

                Expanded(
                  child: InkWell(
                    onTap: uploadFiles,
                    child: DottedBorder(
                      options: RoundedRectDottedBorderOptions(
                        dashPattern: [5, 5],
                        strokeWidth: 2,
                        color: AppColors.deepOrange,
                        strokeCap: StrokeCap.round,
                        radius: Radius.circular(10.r),
                      ),
                      child: SizedBox(
                        width: 1.sw,
                        height: 110.h,
                        child: Visibility(
                          visible: selectedPDF.value == null,
                          replacement: Column(
                            crossAxisAlignment: crossCenter,
                            mainAxisAlignment: mainCenter,
                            children: [
                              Image.asset(
                                "assets/icons/pdf_icon.png",
                                width: 50.w,
                              ),
                              gap6,
                              Text(
                                selectedPDF.value != null ? selectedPDF.value!.path.split("/").last : "",
                                style: AppTextStyles.caption,
                              )
                            ],
                          ),
                          child: Column(
                            mainAxisAlignment: mainCenter,
                            crossAxisAlignment: crossCenter,
                            children: [

                              Icon(
                                Icons.upload,
                                size: 45.sp,
                                color: AppColors.deepOrange,
                              ),

                              Text(
                                "Click to Upload PDF",
                                style: AppTextStyles.bodySmall.copyWith(
                                    color: AppColors.textPrimary
                                ),
                              )

                            ],
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            )


          /// For Multiple image upload ********************************
          else Row(
            spacing: 12.w,
            children: [

              if(!fileTypeIsPDF.value && (selectedImages.value != null && selectedImages.value!.isNotEmpty))
              Expanded(
                child: Container(
                  width: 1.sw,
                  height: 115.h,
                  decoration: BoxDecoration(
                      borderRadius: radius6,
                      border: Border.all(
                          width: 1.w,
                          color: AppColors.deepOrange
                      )
                  ),
                  child: Stack(
                    alignment: Alignment.center,
                    clipBehavior: Clip.none,
                    children: [

                      ClipRRect(
                        borderRadius: radius12,
                        child: Image.file(
                          selectedImages.value!.first,
                          width: 1.sw,
                          height: 1.sh,
                          fit: BoxFit.cover,
                        ),
                      ),


                      CircleAvatar(
                        backgroundColor: AppColors.deepOrange,
                        child: Text(
                          (selectedImages.value?.length ?? 0).toString(),
                          style: AppTextStyles.titleSmall.copyWith(
                              color: Colors.white
                          ),
                        ),
                      ),

                      Positioned(
                        top: -15,
                        right: -15,
                        child: DeferPointer(
                          child: InkWell(
                            onTap: ()=> selectedImages.value = [],
                            child: CircleAvatar(
                              radius: 14.sp,
                              backgroundColor: AppColors.deepOrange,
                              child: Icon(
                                Icons.close,
                                color: Colors.white,
                              ),
                            ),
                          ),
                        ),
                      )


                    ],
                  ),
                ),
              ),


              Expanded(
                child: InkWell(
                  onTap: uploadFiles,
                  child: DottedBorder(
                    options: RoundedRectDottedBorderOptions(
                      dashPattern: [5, 5],
                      strokeWidth: 2,
                      color: AppColors.deepOrange,
                      strokeCap: StrokeCap.round,
                      radius: Radius.circular(10.r),
                    ),
                    child: SizedBox(
                      width: 1.sw,
                      height: 110.h,
                      child: Column(
                        mainAxisAlignment: mainCenter,
                        crossAxisAlignment: crossCenter,
                        children: [

                          Icon(
                            Icons.upload,
                            size: 45.sp,
                            color: AppColors.deepOrange,
                          ),

                          Text(
                            "Click to Upload Photos",
                            style: AppTextStyles.bodySmall.copyWith(
                                color: AppColors.textPrimary
                            ),
                          )

                        ],
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
