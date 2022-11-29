import 'package:flutter/material.dart';
import 'package:http/http.dart' as http;
import 'package:untitled/DetailClass.dart';
import 'dart:convert';

import 'package:untitled/Movie.dart';
import 'package:untitled/MovieFeature.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(

        primarySwatch: Colors.pink,
      ),
      home: const MyHomePage(),
    );
  }
}
class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();

}

class _MyHomePageState extends State<MyHomePage> {


  List<MovieFeature> parseMovie(String cevap) {

    return Movie.fromJson(json.decode(cevap)).movieList;
}
 Future<List<MovieFeature>> allMovie() async {

    var uri = "https://api.themoviedb.org/3/movie/popular?api_key=bed61d549939767402884846d5325c72&page=1";
    var url = Uri.parse(uri);
    var cevap = await http.get(url);

    return parseMovie(cevap.body);
 }
 @override
  void initState() {

    super.initState();
    allMovie();
  }


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text('Movie App'),
      ),
      body: FutureBuilder<List<MovieFeature>>(
          future: allMovie(),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              var movieList = snapshot.data;
                return ListView.builder(
                  itemCount: movieList?.length,
                  itemBuilder: (context, index) {
                    var movie = movieList![index];
                    return  Center(
                      child: Card(
                          child:Padding(
                            padding: EdgeInsets.all(8.0),
                            child: Column(
                              children: [
                                GestureDetector(child: Image.network("https://image.tmdb.org/t/p/w342${movie.poster_path}"),
                                 onTap:() {Navigator.push(context,MaterialPageRoute(builder: (context)=> DetailClass()));
                                 },
                                 ),
                                GestureDetector(
                                    child: Text(movie.title),
                                    onTap:(){
                                      Navigator.push(context,MaterialPageRoute(builder: (context) => DetailClass()));

                                    },
                                )
                              ],
                            ),
                          )
                      ),
                    );
                  });
            }
            else{

              return const Center(
                child: CircularProgressIndicator(color: Colors.black,),
                );
            }
          }
      ),
    );
  }
}
