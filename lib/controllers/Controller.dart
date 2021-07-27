import 'package:projeto_final/model/ImageApp.dart';
import 'package:projeto_final/model/ImageAppRepository.dart';

class Controller {
  List<ImageApp> imagens = [];

  ImageAppRepository repository = ImageAppRepository();

  Controller._privateConstructor();

  static final Controller instance = Controller._privateConstructor();

  Future<void> buscarBanco() async {
    return await repository.selectAll().then((value) {
      imagens = value;
    });
  }

  Future<void> cadastrar(String titulo, String descricao, String img,
      String latitude, String longitude, String data) async {
    ImageApp image =
        ImageApp(titulo, descricao, img, latitude, longitude, data);
    return await repository.insert(image);
  }

  Future<void> removeImage(ImageApp image) async {
    await repository.delete(image).whenComplete(() {
      imagens.remove(image);
    });
  }
}
