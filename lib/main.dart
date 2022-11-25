import 'package:flutter/material.dart';
import 'package:untitled/DetailClass.dart';

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

  var list = ["assets/fall.jpeg","assets/thor.jpg","assets/lostcity.jpg"];
  var list2 = ["FALL","THOR","THE LOST CITY"];
  @override
  Widget build(BuildContext context) {

    return Scaffold(
      appBar: AppBar(title: const Text('Movie App :D'),),

      body: ListView.builder(padding: const EdgeInsets.all(8.0),
        itemCount: list.length,
        itemBuilder: (BuildContext context,int index){
        return GestureDetector(
          onTap:(){
            print("${list2[index]} tıklandı");
            Navigator.push(context,
              MaterialPageRoute(builder: (context) => DetailClass()),
            );
          },
          child: Card(
            child: Padding(
              padding: const EdgeInsets.all(8.0),
              child: Column(
                children: [
                  Image.asset(list[index]),
                  Text(list2[index],style: const TextStyle(fontSize: 24,fontWeight: FontWeight.bold),),
                ],
              ),
            ),

          ),
        )
        ;
        },
      ),
    );
  }
}
