import 'package:projeto_final/model/BancoDeDados.dart';

import 'ImageApp.dart';

class ImageAppRepository {
  Future<List<ImageApp>> selectAll() async {
    List<ImageApp> images = [];
    await BancoDeDados().db!.rawQuery('select * from image').then((value) {
      value.forEach((element) {
        images.add(ImageApp.fromMap(element));
      });
    });
    return images;
  }

  Future<void> insert(ImageApp img) async {
    await BancoDeDados().db!.rawInsert(
        'insert into image (title,comment,img,latitude,longitude,data) values(?,?,?,?,?,?);',
        [
          img.title,
          img.comment,
          img.img,
          img.latitude,
          img.longitude,
          img.data
        ]);
    return;
  }

  Future<void> delete(ImageApp img) async {
    await BancoDeDados()
        .db!
        .rawDelete('delete from image where id = ?', [img.id]);
    return;
  }
}
