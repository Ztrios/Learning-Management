import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter_screenutil/flutter_screenutil.dart';
import 'package:webview_flutter/webview_flutter.dart';

class BkashPaymentPage extends HookWidget {
  final String bkashUrl;

  const BkashPaymentPage({super.key, required this.bkashUrl});

  @override
  Widget build(BuildContext context) {

    final webViewController = useMemoized(() => WebViewController());

    void webViewInitializing(){
      webViewController
        ..setJavaScriptMode(JavaScriptMode.unrestricted)
        ..setNavigationDelegate(
          NavigationDelegate(
              onPageStarted: (_) => webViewController.clearCache(),
              onPageFinished: (String url) {},
              onNavigationRequest: (NavigationRequest request) {

                return NavigationDecision.navigate;
              },
          ),
        )
        ..addJavaScriptChannel(
          "onPaymentSuccess",
          onMessageReceived: (JavaScriptMessage message) {
            Navigator.pop(context);
          },
        )
        ..loadRequest(Uri.parse(bkashUrl)); // Use passed URL
    }

    useEffect(() {
      Future.microtask(()=> webViewInitializing());
      return null;
    }, [webViewController]);

    return Scaffold(
      appBar: AppBar(title: Text("Bkash Payment")),
      body: WebViewWidget(
          controller: webViewController
      ),
    );
  }
}
