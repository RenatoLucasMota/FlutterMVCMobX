import 'package:flutter/material.dart';
import 'package:mvc_example/views/comments/comments_view.dart';
import 'package:mvc_example/views/home/home_view.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'MVC - App Example',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      routes: {
        '/': (context) => HomeView(),
        '/comments': (context) => CommentsView(
              idPost: ModalRoute.of(context).settings.arguments,
            ),
      },
      initialRoute: '/',
    );
  }
}
