import 'package:flutter/material.dart';

class DetailClass extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('Movie Details Page'),),
      body: Padding(
        padding: const EdgeInsets.all(8.0),
        child: Column(
          mainAxisAlignment:MainAxisAlignment.center,
          children: [
            const Center(child: Text("Details Page Coming Soon",style: TextStyle(color: Colors.pink,backgroundColor: Colors.amber,fontWeight: FontWeight.bold,fontSize: 24),),),
            ElevatedButton(onPressed: () {

              Navigator.pop(context);

            }, child: const Text("Return"))
          ],
        ),
      ),
    );
  }


}