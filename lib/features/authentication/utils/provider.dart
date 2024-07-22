import 'dart:typed_data';
import 'package:empapp/barrel.dart';

class ProfileProvider with ChangeNotifier {
  Uint8List? _image;

  Uint8List? get image => _image;

  void setImage(Uint8List newImage) {
    _image = newImage;
    notifyListeners();
  }
}
