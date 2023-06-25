import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:camera/camera.dart';

late List<CameraDescription> cameras;

class CameraScreen extends StatefulWidget {
  const CameraScreen({Key? key}) : super(key: key);

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraController _cameraController;
  late Future<void> cameraValue;

  @override
  void initState() {
    super.initState();
    _cameraController = CameraController(cameras[0], ResolutionPreset.high);
    cameraValue = _cameraController.initialize().then((_) {
      if (!mounted) {
        return;
      }
      setState(() {});
    }).catchError((Object e) {
      if (e is CameraException) {
        switch (e.code) {
          case 'CameraAccessDenied':
            print(e);
            break;
          default:
            print(e);
            break;
        }
      }
    });
  }

  @override
  void dispose() {
    _cameraController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(children: [
        FutureBuilder(
            future: cameraValue,
            builder: (context, snapshot) {
              if (snapshot.connectionState == ConnectionState.done) {
                return CameraPreview(_cameraController);
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
                            icon: const Icon(
                              Icons.camera,
                              color: Colors.white,
                              size: 28,
                            ),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          InkWell(
                            onTap: () {},
                            child: IconButton(
                              icon: const Icon(
                                Icons.circle,
                                color: Colors.white,
                                size: 70,
                              ),
                              onPressed: () {},
                            ),
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                            icon: const Icon(Icons.flash_off,
                                color: Colors.white),
                            onPressed: () {},
                          ),
                          const SizedBox(width: 10),
                          IconButton(
                              onPressed: () {},
                              icon: const Icon(
                                Icons.flip_camera_ios,
                                color: Colors.white,
                                size: 28,
                              )),
                        ]),
                    SizedBox(height: 4),
                    Text(
                      'Hold for video, tap for photo',
                      style: TextStyle(color: Colors.white),
                    )
                  ],
                )))
      ]),
    );
  }
}
