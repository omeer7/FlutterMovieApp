import 'MovieFeature.dart';

class Movie {

    List<MovieFeature> movieList ;

   Movie(this.movieList);

   factory Movie.fromJson(Map<String,dynamic> json){

     var jsonArray = json["results"] as List;
     List<MovieFeature> movieList = jsonArray.map((movieFeature) => MovieFeature.fromJson(movieFeature)).toList();
     return Movie(movieList);
   }
}