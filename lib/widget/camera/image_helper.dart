import 'dart:io';

import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_cropper/image_cropper.dart';
import 'package:image_picker/image_picker.dart';
import 'package:permission_handler/permission_handler.dart';

class ImageHelper {
  ImageHelper({
    ImagePicker? imagePicker,
    ImageCropper? imageCropper,
  })  : _imagePicker = imagePicker ?? ImagePicker(),
        _imageCropper = imageCropper ?? ImageCropper();

  final ImagePicker _imagePicker;
  final ImageCropper _imageCropper;

  Future<List<XFile>> pickImage({
    ImageSource source = ImageSource.gallery,
    int imageQuality = 100,
    bool multiple = false,
  }) async {
    if (!kIsWeb) {
      Map<Permission, PermissionStatus> statuses = await [
        Permission.photos,
        Permission.camera,
      ].request();
      if (statuses[Permission.photos.isPermanentlyDenied] ==
              PermissionStatus.permanentlyDenied ||
          statuses[Permission.camera.isPermanentlyDenied] ==
              PermissionStatus.permanentlyDenied) {
        openAppSettings();
      }
    }
    if (multiple) {
      return await _imagePicker.pickMultiImage(imageQuality: imageQuality);
    }
    final file = await _imagePicker.pickImage(
      source: source,
      imageQuality: imageQuality,
    );
    if (file != null) return [file];
    return [];
  }

  Future<CroppedFile?> crop({
    required BuildContext context,
    required XFile file,
    CropStyle cropStyle = CropStyle.rectangle,
  }) async =>
      await _imageCropper.cropImage(
        // cropStyle: cropStyle,
        sourcePath: file.path,
        compressQuality: 100,
        uiSettings: [
          AndroidUiSettings(
            initAspectRatio: CropAspectRatioPreset.original,
            backgroundColor: Colors.white,
            toolbarColor: Colors.black,
            dimmedLayerColor: Colors.white,
            toolbarTitle: 'Cropper',
            toolbarWidgetColor: Colors.white,
            cropGridColor: Colors.white,
            activeControlsWidgetColor: const Color(0xFF46A9FC),
            cropFrameColor: const Color(0xFF46A9FC),
          ),
          IOSUiSettings(
            title: 'Cropper',
          ),
          WebUiSettings(
            context: context,
          ),
        ],
      );

  Future<XFile> compress(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
          file.path,
          targetPath,
          minHeight: 700,
          minWidth: 700,
          quality: 70,
        ) ??
        XFile('');

    return result;
  }
}
