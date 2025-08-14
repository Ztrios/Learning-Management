import 'dart:io';
import 'package:pdf/pdf.dart';
import 'package:pdf/widgets.dart' as pw;
import 'package:path_provider/path_provider.dart';

class PdfFormatters {
  const PdfFormatters._();

  static Future<File> convertImagesToPdfFile(List<File> imageFiles, {String fileName = 'exam.pdf'}) async {
    final pdf = pw.Document();

    for (final imageFile in imageFiles) {
      final imageBytes = await imageFile.readAsBytes();
      final pdfImage = pw.MemoryImage(imageBytes);

      pdf.addPage(
        pw.Page(
          pageFormat: PdfPageFormat.a4,
          build: (context) => pw.Center(
            child: pw.Image(pdfImage, fit: pw.BoxFit.contain),
          ),
        ),
      );
    }

    final outputDir = await getTemporaryDirectory();
    final outputFile = File('${outputDir.path}/$fileName');
    await outputFile.writeAsBytes(await pdf.save());

    return outputFile;
  }



}