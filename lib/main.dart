import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:testech/features/shopping/data/in_memory_shopping_state.dart';
import 'package:testech/features/shopping/domain/repositrories/shopping_state_repository.dart';
import 'package:testech/features/shopping/domain/shopping_state.dart';
import 'package:testech/features/shopping/presentation/shopping_screen.dart';
import 'package:testech/features/shopping/presentation/shopping_view_model.dart';
import 'package:testech/magic_button_screen.dart';

void main() {
  ShoppingStateRepository repo = InMemoryShoppingState(ShoppingState.initial());
  runApp(
    ChangeNotifierProvider(
      create: (_) => ShoppingViewModel(repo),
      child: const MyApp(),
    ),
  );
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: const HomePage(),
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.teal),
        appBarTheme: const AppBarTheme(
          backgroundColor: Colors.teal,
          foregroundColor: Colors.white,
        ),
        textTheme: const TextTheme(bodyMedium: TextStyle(fontSize: 22)),
      ),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                gradient: LinearGradient(
                  colors: [Colors.white, Theme.of(context).primaryColor],
                ),
              ),
              child: const Align(
                alignment: Alignment.bottomLeft,
                child: Text('Menu', style: TextStyle(fontSize: 24)),
              ),
            ),
            ListTile(
              leading: const Icon(Icons.auto_awesome),
              title: const Text("Magic Button"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => const MagicButtonScreen()),
                );
              },
            ),
            ListTile(
              leading: const Icon(Icons.abc_rounded),
              title: const Text("Shopping"),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (_) => ShoppingScreen()),
                );
              },
            ),
          ],
        ),
      ),
      appBar: AppBar(title: const Text("Home Page")),
      body: const Center(
        child: Text('Hello World', style: TextStyle(fontSize: 22)),
      ),
    );
  }
}


// import 'dart:convert';
// import 'package:testech/circle_model.dart';
// import 'package:testech/point.dart';
// import 'package:testech/shape.dart';

// void main() {
//   Point p1 = Point(x: 4, y: 5);
//   Point p2 = Point(x: 14, y: 40);

//   print(p1.toString());
//   print(p1.distanceTo(p2).toStringAsFixed(1));

//   print(p1.toJson());
//   print(json.encode(p1.toJson()));

//   Map<String, dynamic> data = new Map();

//   data['x'] = 155;
//   data['y'] = 44;

//   Point p3 = Point.fromJson(data);
//   print(p3.toString());

//   Shape shape = CircleModel(
//     p1: const Point(x: 10, y: 30),
//     p2: const Point(x: 14, y: 28),
//   );

//   print(shape.getPerimeter());
//   print(shape.getArea());
//   print(shape.toJson());
  
//   if(shape is CircleModel) {
//     print(shape.getRadius());
//   }

// }