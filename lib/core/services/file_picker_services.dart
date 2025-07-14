import 'dart:io';
import 'package:file_picker/file_picker.dart';

class FilePickerServices{
  const FilePickerServices._();

  Future<File?> uploadPDF() async {
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


  Future<List<File>?> uploadImages() async {
    FilePickerResult? result = await FilePicker.platform.pickFiles(allowMultiple: true,);

    if (result != null) {
      return result.paths.map((path) => File(path!)).toList();
    } else {
      return null;
    }
  }



}