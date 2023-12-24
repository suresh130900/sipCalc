import 'package:flutter/material.dart';


class AutoScroll extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: MyHomePage(),
    );
  }
}

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final ScrollController _scrollController = ScrollController();

  // Generate a list of items for demonstration
  List<String> items = List.generate(50, (index) => 'Item $index');

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Scroll Demo'),
      ),
      body: Column(
        children: [
          // Your content goes here
          Expanded(
            child: ListView.builder(
              controller: _scrollController,
              itemCount: items.length,
              itemBuilder: (context, index) {
                return ListTile(
                  title: Text(items[index]),
                );
              },
            ),
          ),

          ElevatedButton(
            onPressed: () {
              // Scroll down when the button is clicked
              _scrollController.animateTo(
                _scrollController.position.maxScrollExtent,
                duration: Duration(milliseconds: 500),
                curve: Curves.easeInOut,
              );
            },
            child: Text('Scroll Down'),
          ),
        ],
      ),
    );
  }
}
