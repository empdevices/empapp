import 'package:image_picker/image_picker.dart';

// ignore: non_constant_identifier_names
pickImage(ImageSource Source) async {
  final ImagePicker imagePicker = ImagePicker();
  XFile? file = await imagePicker.pickImage(source: Source);
  if (file != null) {
    return file.readAsBytes();
  }
  print('No Image Selected');
}
