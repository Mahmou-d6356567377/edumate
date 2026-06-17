import 'package:edumate/features/courses/data/models/source_type.dart';
import 'package:image_picker/image_picker.dart';
import 'package:file_picker/file_picker.dart';

class SourcePickerService {
  final ImagePicker _imagePicker = ImagePicker();

  Future<PickedSourceFile?> pickPhoto() async {
    final photo = await _imagePicker.pickImage(
      source: ImageSource.camera,
      imageQuality: 80,
    );
    if (photo == null) {
      print('.........No photo selected.');
      return null;
    }
    return PickedSourceFile(
      type: SourceType.photo,
      name: photo.name,
      path: photo.path,
      bytes: await photo.readAsBytes(),
    );
  }

  Future<PickedSourceFile?> pickImage() async {
    final image = await _imagePicker.pickImage(
      source: ImageSource.gallery,
      imageQuality: 80,
    );
    if (image == null) {
      print('.........No image selected.');
      return null;
    }
    return PickedSourceFile(
      type: SourceType.image,
      name: image.name,
      path: image.path,
      bytes: await image.readAsBytes(),
    );
  }

  Future<PickedSourceFile?> pickFile() async {
    final result = await FilePicker.pickFiles(withData: true);
    if (result != null) {
      PlatformFile file = result.files.first;

      print(file.name);
      print(file.bytes);
      print(file.size);
      print(file.extension);
      print(file.path);
    } else if (result == null || result.files.isEmpty) {
      print('.........No file selected.');
      return null;
    }
    final file = result.files.first;
    return PickedSourceFile(
      type: SourceType.file,
      name: file.name,
      path: file.path,
      bytes: file.bytes,
    );
  }

  Future<PickedSourceFile?> pickFromDrive() async {
    final result = await FilePicker.pickFiles(withData: true);
    if (result == null || result.files.isEmpty) {
      print('.........No file selected from Drive.');
      return null;
    }
    final file = result.files.first;
    return PickedSourceFile(
      type: SourceType.drive,
      name: file.name,
      path: file.path,
      bytes: file.bytes,
    );
  }
}
