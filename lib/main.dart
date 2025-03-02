import 'package:dio/dio.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MainApp());
}

class MainApp extends StatefulWidget {
  MainApp({super.key});

  @override
  State<MainApp> createState() => _MainAppState();
}

class _MainAppState extends State<MainApp> {
  List<dynamic> posts = [];

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        appBar: AppBar(title: Text("post api")),
        floatingActionButton: FloatingActionButton(
          child: Text("Get Data"),
          onPressed: () async {
            Dio dio = Dio();
            Response ResponseData =
                await dio.get("https://jsonplaceholder.typicode.com/posts");
            setState(() {
              posts = ResponseData.data;
            });
          },
        ),
        body: posts.isEmpty
            ? Center(child: Text("Press the botton to load data"))
            : Center(
                child: ListView.builder(
                  itemCount: posts.length,
                  itemBuilder: (context, index) {
                    return Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: DecoratedBox(
                        decoration: BoxDecoration(color: Colors.amber),
                        child: Column(
                          children: [
                            Padding(
                              padding: const EdgeInsets.all(8.0),
                              child: Text(posts[index]["title"]),
                            )
                          ],
                        ),
                      ),
                    );
                  },
                ),
              ),
      ),
    );
  }
}
