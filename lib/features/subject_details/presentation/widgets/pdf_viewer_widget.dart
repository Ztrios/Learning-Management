// import 'package:flutter/material.dart';
// import 'package:flutter_cached_pdfview/flutter_cached_pdfview.dart';
// import 'package:flutter_file_downloader/flutter_file_downloader.dart';
// import 'package:flutter_hooks/flutter_hooks.dart';
// import 'package:flutter_screenutil/flutter_screenutil.dart';
// import 'package:go_router/go_router.dart';
// import 'package:learning_management/core/helpers/toast_notification/toast_notifications.dart';
// import 'package:learning_management/core/utils/styles/app_colors.dart';
// import 'package:learning_management/core/utils/styles/app_text_styles.dart';
// import 'package:learning_management/core/utils/ui_helpers/paddings.dart';
// import 'package:learning_management/widgets/dialogs/download_progress_dialog.dart';
//
// class PdfViewerWidget extends HookWidget {
//   const PdfViewerWidget({super.key});
//
//   final String pdfUrl = "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf";
//
//   @override
//   Widget build(BuildContext context) {
//     final isDownloading = useState<bool>(false);
//
//     void downloadPDF() {
//       isDownloading.value = true;
//
//       showDownloadProgressDialog(context);
//
//       FileDownloader.downloadFile(
//         url: pdfUrl,
//         onDownloadCompleted: (String path) {
//           if (context.mounted) {
//             Navigator.pop(context);
//             ToastNotifications.showSuccessToast("PDF downloaded successfully.");
//           }
//           isDownloading.value = false;
//         },
//         onDownloadError: (String error) {
//           if (context.mounted) {
//             Navigator.pop(context);
//             ToastNotifications.showErrorToast(
//               title: "Download Failed!",
//               message: "Something went wrong. Please try again!",
//             );
//           }
//           isDownloading.value = false;
//         },
//       );
//     }
//
//     return Scaffold(
//       appBar: AppBar(
//         title: Text("PDF Viewer", style: AppTextStyles.titleLarge.copyWith(
//           color: Colors.white
//         )),
//         centerTitle: true,
//         leading: IconButton(
//           onPressed: () => context.pop(),
//           icon: Icon(Icons.arrow_back_ios, color: Colors.white, size: 20.sp),
//         ),
//         actions: [
//           Padding(
//             padding: padding12,
//             child: IconButton(
//               onPressed: isDownloading.value ? null : downloadPDF,
//               icon: Icon(Icons.download, color: Colors.white, size: 26.sp),
//               tooltip: "Download PDF",
//             ),
//           ),
//         ],
//         backgroundColor: AppColors.blueLight,
//       ),
//       body: SizedBox(
//         width: 1.sw,
//         height: 1.sh,
//         child: const PDF(
//           fitPolicy: FitPolicy.BOTH,
//           autoSpacing: true,
//         ).cachedFromUrl(
//           "https://www.adobe.com/support/products/enterprise/knowledgecenter/media/c4611_sample_explain.pdf",
//           placeholder: (progress) => Center(
//             child: CircularProgressIndicator(value: progress / 100),
//           ),
//           errorWidget: (error) => Center(child: Text('Failed to load PDF: $error')),
//         ),
//       ),
//     );
//   }
//
// }
//
