import 'package:flutter/material.dart';
import 'package:flutter_html/flutter_html.dart';

class ContentTabView extends StatelessWidget {
  const ContentTabView({super.key});

  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      child: Html(
        data: content,
        extensions: [
          TagExtension(
            tagsToExtend: {"flutter"},
            child: const FlutterLogo(),
          ),
        ],
        style: {
          "p.fancy": Style(
            textAlign: TextAlign.center,
            //padding: const EdgeInsets.all(16),
            backgroundColor: Colors.grey,
            margin: Margins(left: Margin(50, Unit.px), right: Margin.auto()),
            width: Width(300, Unit.px),
            fontWeight: FontWeight.bold,
          ),
        },
      ),
    );
  }
}

String content = """
<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8" />
  <meta name="viewport" content="width=device-width, initial-scale=1.0"/>
  <title>Lesson: Integration</title>
  <style>
    body {
      font-family: 'Segoe UI', sans-serif;
      background-color: #f4f4f4;
      margin: 0;
      padding: 0;
    }

    .tab-bar {
      display: flex;
      background-color: #fff;
      border-bottom: 1px solid #ddd;
      position: sticky;
      top: 0;
      z-index: 100;
    }

    .tab-bar div {
      padding: 14px 20px;
      cursor: pointer;
      font-weight: 500;
      color: #666;
    }

    .tab-bar .active {
      border-bottom: 2px solid #ff5722;
      color: #ff5722;
      font-weight: 700;
    }

    .content {
      max-width: 700px;
      margin: 30px auto;
      background-color: #fff;
      padding: 20px 30px;
      border-radius: 8px;
      box-shadow: 0 2px 8px rgba(0,0,0,0.05);
    }

    h2 {
      margin-top: 0;
    }

    .math-image {
      display: block;
      max-width: 100%;
      margin: 20px auto;
    }

    .section-title {
      font-weight: bold;
      margin-top: 30px;
      margin-bottom: 10px;
    }

    p {
      line-height: 1.6;
      color: #333;
    }
  </style>
</head>
<body>
  <!-- Lesson Content -->
  <div class="content">
    <p>
      Integration, in its broadest sense, refers to the process of combining two or more things to form a whole or to make them work together. This can apply to various contexts, including mathematics, technology, and social interactions.
    </p>

    <div class="section-title">In mathematics:</div>
    <p>
      Integration is a fundamental concept in calculus, specifically integral calculus. It is the inverse operation of differentiation and is used to find the area under a curve, among other applications. For example, in physics, integration can be used to calculate the total distance traveled by an object given its velocity function.
    </p>

    <!-- Math Image -->
    <img 
      class="math-image"
      src="https://www.cleariitmedical.com/images/maths/formula/definite-integral-1.png" 
      alt="Integration Formula"
    />

    <p>
      Integration, in its broadest sense, refers to the process of combining two or more things to form a whole or to make them work together. This can apply to various contexts, including mathematics, technology, and social interactions.
    </p>
  </div>

</body>
</html>
""";
