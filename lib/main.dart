import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Selectable List',
      theme: ThemeData(
        primarySwatch: Colors.blue,
        visualDensity: VisualDensity.adaptivePlatformDensity,
      ),
      home: SelectableListScreen(),
    );
  }
}

class SelectableListScreen extends StatefulWidget {
  @override
  _SelectableListScreenState createState() => _SelectableListScreenState();
}

class _SelectableListScreenState extends State<SelectableListScreen> {
  List<String> items = [
    'Item 1',
    'Item 2',
    'Item 3',
    'Item 4',
    'Item 5',
  ];

  List<String> selectedItems = [];

  void toggleSelection(String item) {
    setState(() {
      if (selectedItems.contains(item)) {
        selectedItems.remove(item);
      } else {
        selectedItems.add(item);
      }
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Selectable List'),
      ),
      body: ListView.builder(
        itemCount: items.length,
        itemBuilder: (context, index) {
          String item = items[index];
          bool isSelected = selectedItems.contains(item);
          return ListTile(
            title: Text(item),
            onTap: () {
              toggleSelection(item);
            },
            selected: isSelected,
            tileColor: isSelected ? Colors.blue[100] : null,
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showDialog(
            context: context,
            builder: (BuildContext context) {
              return AlertDialog(
                title: Text('Selected Items'),
                content: Text('Number of selected items: ${selectedItems.length}'),
                actions: <Widget>[
                  TextButton(
                    onPressed: () {
                      Navigator.of(context).pop();
                    },
                    child: Text('Close'),
                  ),
                ],
              );
            },
          );
        },
        child: Icon(Icons.check),
      ),
    );
  }
}
