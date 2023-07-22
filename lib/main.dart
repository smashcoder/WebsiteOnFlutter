import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() => runApp(MyApp());

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Bottom Nav WebView App',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: BottomNavWebView(),
    );
  }
}

class BottomNavWebView extends StatefulWidget {
  @override
  _BottomNavWebViewState createState() => _BottomNavWebViewState();
}

class _BottomNavWebViewState extends State<BottomNavWebView> {
  int _currentIndex = 0;
  List<String> _urls = [
    'https://smashcoder.github.io',
    'https://www.example.com/page2',
    'https://www.example.com/page3',
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Bottom Nav WebView App'),
      ),
      body: IndexedStack(
        index: _currentIndex,
        children: [
          _buildWebView(_urls[0]),
          _buildWebView(_urls[1]),
          _buildWebView(_urls[2]),
        ],
      ),
      bottomNavigationBar: BottomNavigationBar(
        currentIndex: _currentIndex,
        onTap: (index) {
          setState(() {
            _currentIndex = index;
          });
        },
        items: [
          BottomNavigationBarItem(
            icon: Icon(Icons.home),
            label: 'Home',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.book),
            label: 'Page 2',
          ),
          BottomNavigationBarItem(
            icon: Icon(Icons.settings),
            label: 'Page 3',
          ),
        ],
      ),
    );
  }

  Widget _buildWebView(String url) {
    return WebView(
      initialUrl: url,
      javascriptMode: JavascriptMode.unrestricted,
    );
  }
}
