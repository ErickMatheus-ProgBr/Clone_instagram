import 'package:camera/camera.dart';

class CameraControllerManager {
  final CameraDescription camera;
  CameraController? _controller;
  Future<void>? _initializeControllerFuture;

  CameraControllerManager({required this.camera});

  // 1. Inicializa o controle da câmera
  void init() {
    _controller = CameraController(
      camera,
      ResolutionPreset.medium,
      enableAudio: false, // Evita pedir permissão de microfone à toa se não for gravar vídeo
    );
    _initializeControllerFuture = _controller!.initialize();
  }

  // Getters para a tela ler os estados com segurança
  CameraController? get controller => _controller;
  Future<void>? get initializeFuture => _initializeControllerFuture;

  // 2. Desliga a câmera para não gastar a bateria do celular do usuário!
  void dispose() {
    _controller?.dispose();
  }
}
