import 'dart:developer';

import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:go_router/go_router.dart';
import 'package:learning_management/core/constants/api_urls.dart';
import 'package:learning_management/core/helpers/toast_notification/toast_notifications.dart';
import 'package:learning_management/core/utils/styles/app_colors.dart';
import 'package:learning_management/features/payments/presentation/pages/payment_page.dart';
import 'package:learning_management/widgets/circle_loading.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BkashPaymentPage extends HookWidget {
  final String bkashUrl;

  const BkashPaymentPage({super.key, required this.bkashUrl});

  @override
  Widget build(BuildContext context) {

    final isLoading = useState<bool>(true);
    final webViewController = useMemoized(() => WebViewController());

    void webViewInitializing(){
      webViewController
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
              onPageStarted: (_) => webViewController.clearCache(),
              onProgress: (value){
                print(value);
                if(value >= 100) isLoading.value = false;
              } ,
              // onWebResourceError: (WebResourceError error) {
              //   ToastNotifications.showErrorToast(
              //     title: "Payment Failed",
              //     message: "We couldn't complete your transaction. Please try again or use a different method.",
              //   );
              // },
              onNavigationRequest: (NavigationRequest request) {

                  log("Navigation: ${request.url}");

                  if(request.url.startsWith(ApiUrls.baseURL + ApiUrls.verifyPayment)){
                    final queryParams = Uri.parse(request.url).queryParameters;
                    if(queryParams["status"] == "success"){
                      ToastNotifications.showSuccessToast("Thank you! Your payment is completed.");
                    }else if(queryParams["status"] == "cancel"){
                      ToastNotifications.showErrorToast(
                        title: "Incomplete Payment",
                        message: "Your payment is not completed."
                      );
                    }
                    context.pushReplacementNamed(PaymentPage.name);
                  }

                  return NavigationDecision.navigate;
                },
          ),
        )
        ..loadRequest(Uri.parse(bkashUrl)); // Use passed URL
    }

    useEffect(() {
      Future.microtask(()=> webViewInitializing());
      return null;
    }, [webViewController]);

    return Scaffold(
      appBar: AppBar(
        leading: IconButton(
            onPressed: (){},
            icon: Icon(Icons.arrow_back_ios, color: Colors.white)
        ),
        title: Text("Bkash Payment", style: TextStyle(color: Colors.white)),
        centerTitle: true,
        backgroundColor: Colors.pinkAccent,
      ),
      backgroundColor: AppColors.background,

      body: Container(
        width: 1.sw,
        height: 1.sh,
        alignment: Alignment.center,
        child: Visibility(
          visible: !isLoading.value,
          replacement: CircleLoadingWidget(),
          child: Center(
            child: WebViewWidget(
                controller: webViewController
            ),
          ),
        ),
      ),
    );
  }
}
