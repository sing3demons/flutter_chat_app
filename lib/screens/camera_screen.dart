import 'dart:math';

import 'package:flutter/material.dart';
import 'package:camera/camera.dart';
import 'package:flutter_chat_app/screens/camera_view.dart';
import 'package:flutter_chat_app/screens/video_view.dart';

late final List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;
  bool isRecording = false;
  bool flash = false;
  bool isCameraFront = true;
  double transform = 0;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize().then((_) {
      if (!mounted) return;
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print('====>');
            print(e);
            break;
          default:
            print('error');
            print(e);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    super.dispose();
    _cameraController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return SizedBox(
                    width: MediaQuery.of(context).size.width,
                    height: MediaQuery.of(context).size.height,
                    child: CameraPreview(_cameraController));
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            }),
        Positioned(
            bottom: 0.0,
            child: Container(
                width: MediaQuery.of(context).size.width,
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                color: Colors.black,
                child: Column(
                  children: [
                    Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          IconButton(
                            icon: Icon(
                              flash ? Icons.flash_on : Icons.flash_off,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {
                              setState(() {
                                flash = !flash;
                              });
                              flash
                                  ? _cameraController
                                      .setFlashMode(FlashMode.torch)
                                  : _cameraController
                                      .setFlashMode(FlashMode.off);
                            },
                          ),
                          // const SizedBox(width: 10),
                          GestureDetector(
                            onLongPress: () async {
                              await _cameraController.startVideoRecording();
                              setState(() {
                                isRecording = true;
                              });
                            },
                            onLongPressUp: () async {
                              XFile videoPath =
                                  await _cameraController.stopVideoRecording();
                              setState(() {
                                isRecording = true;
                              });
                              String path = videoPath.path;
                              if (context.mounted) {
                                Navigator.push(
                                  context,
                                  MaterialPageRoute(
                                    builder: (context) =>
                                        VideoViewPage(path: path),
                                  ),
                                );
                              }
                            },
                            onTap: () =>
                                !isRecording ? takePhoto(context) : null,
                            child: isRecording
                                ? const Icon(
                                    Icons.radio_button_on,
                                    color: Colors.red,
                                    size: 80,
                                  )
                                : const Icon(
                                    Icons.panorama_fish_eye,
                                    color: Colors.white,
                                    size: 70,
                                  ),
                          ),
                          // const SizedBox(width: 10),
                          IconButton(
                              icon: Transform.rotate(
                                angle: transform,
                                child: const Icon(
                                  Icons.flip_camera_ios,
                                  color: Colors.white,
                                  size: 28,
                                ),
                              ),
                              onPressed: () async {
                                setState(() {
                                  isCameraFront = !isCameraFront;
                                  transform = transform + pi;
                                });
                                int cameraPos = isCameraFront ? 0 : 1;
                                _cameraController = CameraController(
                                    cameras[cameraPos], ResolutionPreset.high);
                                cameraValue = _cameraController.initialize();
                              }),
                        ]),
                    const SizedBox(height: 4),
                    const Text(
                      "Hold for Video, tap for photo",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                      textAlign: TextAlign.center,
                    )
                  ],
                )))
      ]),
    );
  }

  Future<void> takePhoto(BuildContext context) async {
    XFile file = await _cameraController.takePicture();
    String path = file.path;

    if (context.mounted) {
      Navigator.push(context,
          MaterialPageRoute(builder: (context) => CameraViewPage(path: path)));
    }
  }
}
