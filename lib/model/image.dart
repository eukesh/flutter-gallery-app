class ImageApp {
  int? id;
  String? title;
  String? comment;
  String? img;
  String? latitude;
  String? longitude;
  String? data;

  ImageApp(
    this.title,
    this.comment,
    this.img,
    this.latitude,
    this.longitude,
    this.data,
  );

  ImageApp.fromMap(Map<String, dynamic> json) {
    this.id = json["id"];
    this.title = json["title"];
    this.comment = json["comment"];
    this.img = json["img"];
    this.latitude = json["latitude"];
    this.longitude = json["longitude"];
    this.data = json["data"];
  }

  Map<String, dynamic> toJson() {
    return {
      "title": this.title,
      "comment": this.comment,
      "img": this.img,
      "latitude": this.latitude,
      "longitude": this.longitude,
      "data": this.data
    };
  }

  @override
  String toString() {
    return "$title - $comment - $latitude - $longitude - $data";
  }
}
