import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerServices{
  const FilePickerServices._();

  static Future<File?> uploadProfilePicture() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
        type: FileType.custom,
        allowedExtensions: ['jpg', 'png']
    );

    if (result != null) {
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }


  static Future<File?> uploadPDF() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      type: FileType.custom,
      allowedExtensions: ['pdf'],
    );

    if (result != null) {
      return File(result.files.single.path!);
    } else {
      return null;
    }
  }


  static Future<List<File>?> uploadMultipleImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(
      allowMultiple: true,
      type: FileType.custom,
      allowedExtensions: ['jpg', 'png']
    );

    if (result != null) {
      return result.paths.map((path) => File(path!)).toList();
    } else {
      return null;
    }
  }




}