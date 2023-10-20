import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:image_picker/image_picker.dart';
import 'package:my_app/shared/widgtes/page_title.dart';
import 'package:path/path.dart';
import 'package:path_provider/path_provider.dart' as path_provider;

class CameraPage extends StatefulWidget {
  const CameraPage({super.key});

  @override
  State<CameraPage> createState() => _CameraPageState();
}

class _CameraPageState extends State<CameraPage> {
  final picker = ImagePicker();

  _close() {
    Navigator.pop(context as BuildContext);
  }

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
          appBar: AppBar(
            title: const PageTitle(title: 'Camera'),
            centerTitle: true,
          ),
          body: Column(
            children: [
              TextButton(
                  onPressed: () async {
                    showModalBottomSheet(
                        context: context,
                        builder: (_) {
                          return Wrap(children: [
                            ListTile(
                              title: const Text('Camera'),
                              leading:
                                  const FaIcon(FontAwesomeIcons.cameraRetro),
                              onTap: () async {
                                _close();
                                final XFile? photo = await picker.pickImage(
                                    source: ImageSource.camera);
                              },
                            ),
                            ListTile(
                              title: const Text('Galeria'),
                              leading: const FaIcon(FontAwesomeIcons.images),
                              onTap: () async {
                                _close();
                                final XFile? photo = await picker.pickImage(
                                    source: ImageSource.gallery);
                                if (photo != null) {
                                  String path = (await path_provider
                                          .getApplicationDocumentsDirectory())
                                      .path;
                                  String name = basename(photo.path);
                                  await photo.saveTo("$path/$name");
                                }
                              },
                            )
                          ]);
                        });
                    // final XFile? photo =
                    //     await picker.pickImage(source: ImageSource.camera);
                  },
                  child: const Text('Camera', style: TextStyle(fontSize: 20)))
            ],
          )),
    );
  }
}
