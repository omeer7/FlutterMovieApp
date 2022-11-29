class MovieFeature {

  String title ;
  String poster_path;

  MovieFeature(this.title, this.poster_path);

  factory MovieFeature.fromJson(Map<String,dynamic> json){
    return MovieFeature(json["title"] as String, json["poster_path"] as String);
  }
}