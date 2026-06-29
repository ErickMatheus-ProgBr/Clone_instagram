import 'package:camera/camera.dart';
import 'package:flutter/material.dart';
import '../../controllers/camera_controller_manager.dart';

class CameraScreen extends StatefulWidget {
  final CameraDescription camera;

  const CameraScreen({super.key, required this.camera});

  @override
  State<CameraScreen> createState() => _CameraScreenState();
}

class _CameraScreenState extends State<CameraScreen> {
  late CameraControllerManager _cameraManager;

  @override
  void initState() {
    super.initState();
    // Ativa o gerenciador de lógica
    _cameraManager = CameraControllerManager(camera: widget.camera);
    _cameraManager.init();
  }

  @override
  void dispose() {
    // Desliga a câmera com segurança através do gerente
    _cameraManager.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.black,
      body: FutureBuilder<void>(
        future: _cameraManager.initializeFuture,
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.done &&
              _cameraManager.controller != null) {
            return Stack(
              children: [
                Positioned.fill(child: CameraPreview(_cameraManager.controller!)),
                // Botão fechar
                Positioned(
                  top: 40,
                  left: 20,
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.white, size: 30),
                    onPressed: () => Navigator.pop(context),
                  ),
                ),
              ],
            );
          } else {
            return const Center(child: CircularProgressIndicator(color: Colors.white));
          }
        },
      ),
    );
  }
}
