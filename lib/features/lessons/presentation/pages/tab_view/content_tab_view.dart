import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';
import 'package:learning_management/features/lessons/presentation/widgets/html_viewer_widget.dart';

class ContentTabView extends StatelessWidget {
  const ContentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: HtmlViewerWidget(content: content),
    );
  }
}

String content = """
<div style="width: 333px; height: 252px"><span style="color: black; font-size: 12px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Integration, in its broadest sense, refers to the process of combining two or more things to form a whole or to make them work together. This can apply to various contexts, including mathematics, technology, and social interactions. <br/><br/></span><span style="color: black; font-size: 12px; font-family: Poppins; font-weight: 700; word-wrap: break-word">In mathematics:<br/></span><span style="color: black; font-size: 12px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Integration is a fundamental concept in calculus, specifically integral calculus. It is the inverse operation of differentiation and is used to find the area under a curve, among other applications. For example, in physics, integration can be used to calculate the total distance traveled by an object given its velocity function. </span></div>
<img style="width: 222px; height: 125px" src="https://miro.medium.com/v2/resize:fit:1400/1*I6B8iKc2wo5u3ZRxKHm4tQ.png" />
<div style="width: 333px; height: 97px; color: black; font-size: 12px; font-family: Poppins; font-weight: 400; word-wrap: break-word">Integration, in its broadest sense, refers to the process of combining two or more things to form a whole or to make them work together. This can apply to various contexts, including mathematics, technology, and social interactions. </div>
""";
