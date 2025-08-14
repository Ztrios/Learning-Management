import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
//import 'package:share_plus/share_plus.dart';
import 'package:url_launcher/url_launcher.dart';

class Helpers{
  const Helpers._();


  static Future<void> launchUri({required String uri}) async {
    final Uri url = Uri.parse(uri);

    if (await canLaunchUrl(url)) {
      await launchUrl(
        url,
        mode: LaunchMode.externalApplication, // Opens in browser or relevant app
      );
    } else {
      throw 'Could not launch $uri';
    }
  }


  // static void shareLink(String url, {String? message}) {
  //   final content = message != null ? "$message\n$url" : url;
  //   Share.share(content);
  // }


  static Future<String?> pasteFromClipboard(TextEditingController controller) async {
    final clipboardData = await Clipboard.getData('text/plain');
    if (clipboardData != null && clipboardData.text != null) {
      controller.text = clipboardData.text!;
      controller.selection = TextSelection.fromPosition(
        TextPosition(offset: controller.text.length),
      );
      return clipboardData.text;
    }
    return null;
  }


}