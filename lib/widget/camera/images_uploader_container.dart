import 'dart:io';

import 'package:abd_shop/constant/constants.dart';
import 'package:abd_shop/widget/camera/image_helper.dart';
import 'package:abd_shop/widget/my_alert_dialog.dart';
import 'package:abd_shop/widget/my_snack_bar.dart';
import 'package:dotted_border/dotted_border.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_image_compress/flutter_image_compress.dart';
import 'package:image_picker/image_picker.dart';

class ImagesUploaderContainer extends StatefulWidget {
  const ImagesUploaderContainer({
    super.key,
    this.maxFile = 9,
    required this.onChanged,
  });
  final Function(List<dynamic>) onChanged;
  final int maxFile;

  @override
  State<ImagesUploaderContainer> createState() =>
      _ImagesUploaderContainerState();
}

class _ImagesUploaderContainerState extends State<ImagesUploaderContainer> {
  final imageHelper = ImageHelper();
  final List<File> _imagesList = [];
  final List<Uint8List> _imagesWebList = [];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      floatingActionButton: FloatingActionButton(
        backgroundColor: kPrimaryColor,
        foregroundColor: kWhiteColor,
        onPressed: () async {
          if (_imagesList.length < widget.maxFile) {
            imagePickerSheet(context);
          } else {
            MySnackBar(
              context: context,
              message: "تعداد تصاویر نمیتواند بیشتر از ${widget.maxFile} باشد",
              isWarning: true,
            );
          }
        },
        child: const Icon(Icons.add_photo_alternate_outlined),
      ),
      body: Container(
        margin: const EdgeInsets.symmetric(vertical: 6),
        alignment: Alignment.center,
        child: DottedBorder(
          padding: const EdgeInsets.all(4),
          radius: const Radius.circular(8),
          borderType: BorderType.RRect,
          dashPattern: const [10, 10],
          strokeWidth: 2,
          color: kBoxBackgroundColor,
          child: Stack(
            alignment: Alignment.topRight,
            children: [
              Container(
                padding: const EdgeInsets.all(8),
                width: double.infinity,
                child: const Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Icon(
                      Icons.image_outlined,
                      color: Colors.grey,
                      size: 100,
                    ),
                    Text(
                      'تصاویر پیوست',
                      style: TextStyle(color: Colors.grey),
                    )
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.all(4.0),
                child: Wrap(
                  spacing: 8,
                  runSpacing: 15,
                  crossAxisAlignment: WrapCrossAlignment.center,
                  children: (!kIsWeb)
                      ? _imagesList
                          .map(
                            (item) => InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {
                                showDialog(
                                  context: context,
                                  builder: (context) {
                                    return AlertDialog(
                                      contentPadding: EdgeInsets.zero,
                                      alignment: Alignment.center,
                                      content: Container(
                                        width: 80,
                                        height: 90,
                                        margin: const EdgeInsets.all(8),
                                        child: Row(
                                          mainAxisAlignment:
                                              MainAxisAlignment.spaceEvenly,
                                          children: [
                                            InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                width: 90,
                                                height: 90,
                                                child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.delete_forever,
                                                      color: kRedColor,
                                                      size: 32,
                                                    ),
                                                    Text('حذف'),
                                                  ],
                                                ),
                                              ),
                                              onTap: () {
                                                _imagesList.removeAt(
                                                    _imagesList.indexOf(item));
                                                Navigator.pop(context);
                                                setState(() {});
                                                MySnackBar(
                                                    context: context,
                                                    message: 'حذف شد!');
                                              },
                                            ),
                                            InkWell(
                                              borderRadius:
                                                  BorderRadius.circular(20),
                                              child: Container(
                                                padding:
                                                    const EdgeInsets.all(8.0),
                                                width: 90,
                                                height: 90,
                                                child: const Column(
                                                  mainAxisAlignment:
                                                      MainAxisAlignment
                                                          .spaceEvenly,
                                                  children: [
                                                    Icon(
                                                      Icons.edit,
                                                      color: kGreenColor,
                                                      size: 32,
                                                    ),
                                                    Text('ویرایش'),
                                                  ],
                                                ),
                                              ),
                                              onTap: () async {
                                                final croppedFile =
                                                    await imageHelper.crop(
                                                        context: context,
                                                        file: XFile(item.path));
                                                if (croppedFile != null) {
                                                  setState(() => _imagesList[
                                                          _imagesList
                                                              .indexOf(item)] =
                                                      File(croppedFile.path));
                                                  if (!mounted) return;
                                                  Navigator.pop(context);
                                                  MySnackBar(
                                                      context: context,
                                                      message: 'ویرایش شد!');
                                                }
                                              },
                                            ),
                                          ],
                                        ),
                                      ),
                                    ); //remove
                                  },
                                );
                              },
                              child: Container(
                                // padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                      color: kPrimaryColor, width: 2),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Image.file(
                                    item,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList()
                      : _imagesWebList
                          .map(
                            (item) => InkWell(
                              borderRadius: BorderRadius.circular(10),
                              onTap: () {},
                              child: Container(
                                // padding: const EdgeInsets.all(1),
                                decoration: BoxDecoration(
                                  color: kPrimaryColor,
                                  borderRadius: BorderRadius.circular(10),
                                  border: Border.all(
                                    color: kPrimaryColor,
                                    width: 2,
                                  ),
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(9),
                                  child: Image.memory(
                                    item,
                                    height: 60,
                                    width: 60,
                                    fit: BoxFit.fill,
                                  ),
                                ),
                              ),
                            ),
                          )
                          .toList(),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  imagePickerSheet(BuildContext context) async {
    showModalBottomSheet(
      context: context,
      builder: (modalContext) {
        return Padding(
          padding: const EdgeInsets.all(16),
          child: SizedBox(
            height: 150,
            child: Column(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Container(
                  padding:
                      const EdgeInsets.symmetric(vertical: 6, horizontal: 20),
                  decoration: BoxDecoration(
                    color: kPrimaryColor,
                    borderRadius: BorderRadius.circular(40),
                  ),
                  alignment: Alignment.center,
                  child: const Text(
                    "اضافه کردن تصویر پیوست",
                    style: kTextWhite,
                  ),
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    IconButton(
                      padding: const EdgeInsets.all(20),
                      iconSize: 44,
                      icon: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.camera,
                            color: kPrimaryColor,
                          ),
                          Text('دوربین')
                        ],
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => const Loading(),
                        );
                        List<XFile> source = await imageHelper.pickImage(
                          source: ImageSource.camera,
                          imageQuality: 70,
                        );

                        if (_imagesList.length + source.length <=
                            widget.maxFile) {
                          for (XFile item in source) {
                            // File imageFile = File(item.path);
                            // File? finalImage = File(item.path);
                            // finalImage = File((await imageHelper.compress(
                            //         finalImage, imageFile.path))
                            //     .path);

                            // XFile image = item;
                            // XFile compressedImage =
                            //     await compressAndGetFile(
                            //   File(image.path),
                            //   item.path,
                            // );
                            _imagesList.add(File(item.path));

                            // _imagesList.add(File(item.path));
                          }

                          widget.onChanged(
                              (!kIsWeb) ? _imagesList : _imagesWebList);
                          Navigator.pop(context);
                        } else {
                          Navigator.pop(context);
                          MySnackBar(
                              context: context,
                              message:
                                  "تعداد تصاویر نمیتواند بیشتر از ${widget.maxFile} باشد",
                              isWarning: true);
                        }
                        setState(() {});
                      },
                    ),
                    IconButton(
                      padding: const EdgeInsets.all(20),
                      iconSize: 44,
                      icon: const Column(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Icon(
                            Icons.image,
                            color: kPrimaryColor,
                          ),
                          Text('گالری')
                        ],
                      ),
                      onPressed: () async {
                        Navigator.pop(context);
                        showDialog(
                          context: context,
                          builder: (context) => const Loading(),
                        );
                        await imageHelper
                            .pickImage(
                          source: ImageSource.gallery,
                          imageQuality: 25,
                          multiple: true,
                        )
                            .then(
                          (value) async {
                            if (_imagesList.length + value.length <=
                                widget.maxFile) {
                              for (XFile item in value) {
                                // XFile compressedImage =
                                //     await compressAndGetFile(
                                //   File(item.path),
                                //   item.path,
                                // );
                                if (kIsWeb) {
                                  var webImage = await item.readAsBytes();
                                  _imagesWebList.add(webImage);
                                  _imagesList.add(File('a'));
                                } else {
                                  _imagesList.add(File(item.path));
                                }
                              }
                              widget.onChanged(
                                  (!kIsWeb) ? _imagesList : _imagesWebList);
                              Navigator.pop(context);
                            } else {
                              Navigator.pop(context);

                              MySnackBar(
                                context: context,
                                message:
                                    "تعداد تصاویر نمیتواند بیشتر از ${widget.maxFile} باشد",
                                isWarning: true,
                              );
                            }
                            setState(
                              () {},
                            );
                          },
                        ).catchError(
                          (error) {
                            Navigator.of(context).pop();
                            throw ('image uploader container in gallery methods has error: ${error.toString()}');
                          },
                        );
                      },
                    ),
                  ],
                ),
              ],
            ),
          ),
        );
      },
    );
  }

  Future<XFile> compressAndGetFile(File file, String targetPath) async {
    var result = await FlutterImageCompress.compressAndGetFile(
      file.absolute.path,
      targetPath,
      quality: 70,
      minHeight: 720,
      minWidth: 720,
    );

    print(file.lengthSync());
    if (result != null) {
      print(result.length());
    }

    return result!;
  }
}

/*
class ProfileImage extends StatefulWidget {
  const ProfileImage({
    super.key,
    required this.initials,
  });
  final String initials;

  @override
  State<ProfileImage> createState() => _ProfileImageState();
}

class _ProfileImageState extends State<ProfileImage> {
  File? _image;
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Center(
          child: FittedBox(
            fit: BoxFit.contain,
            child: CircleAvatar(
              backgroundColor: kPrimaryColor,
              radius: 44,
              foregroundImage: _image != null ? FileImage(_image!) : null,
              child: Text(
                widget.initials,
                style: const TextStyle(fontSize: 28),
              ),
            ),
          ),
        ),
        const SizedBox(height: 16),
        TextButton(
          onPressed: () async {
            final files = await imageHelper.fromGallery();
            if (files.isNotEmpty) {
              final croppedFile = await imageHelper.crop(
                file: files.first,
                cropStyle: CropStyle.circle,
              );
              if (croppedFile != null) {
                setState(() => _image = File(croppedFile.path));
              }
            }
          },
          child: const Text('Select Photo'),
        ),
      ],
    );
  }
}

class MultipleImages extends StatefulWidget {
  const MultipleImages({super.key});

  @override
  State<MultipleImages> createState() => _MultipleImagesState();
}

class _MultipleImagesState extends State<MultipleImages> {
  List<File> _images = [];
  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Wrap(
          spacing: 4,
          runSpacing: 4,
          children: _images
              .map(
                (e) => Image.file(
                  e,
                  height: 100,
                  width: 100,
                  fit: BoxFit.cover,
                ),
              )
              .toList(),
        ),
        const SizedBox(height: 8),
        TextButton(
          onPressed: () async {
            final files = await imageHelper.fromGallery(multiple: true);
            setState(
              () => _images.addAll(files.map((e) => File(e.path)).toList()),
            );

            // final files = await imageHelper.fromGallery();
            // if (files.isNotEmpty) {
            //   final croppedFile = await imageHelper.crop(
            //     file: files.first,
            //     cropStyle: CropStyle.circle,
            //   );
            //   if (croppedFile != null) {
            //     setState(() => _image = File(croppedFile.path));
            //   }
            // }
          },
          child: const Text('Select Multiple Photos'),
        ),
      ],
    );
  }
}

 */
