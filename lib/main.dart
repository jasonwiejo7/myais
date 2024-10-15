import 'package:flutter/material.dart';
import 'package:webview_flutter/webview_flutter.dart';

void main() {
  WidgetsFlutterBinding.ensureInitialized();
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'MyAIS Demo',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AISHomePage(title: 'MyAIS Demo'),
    );
  }
}

class AISHomePage extends StatefulWidget {
  const AISHomePage({super.key, required this.title});
  final String title;

  @override
  State<AISHomePage> createState() => _AISPageState();
}

class _AISPageState extends State<AISHomePage> {
  late WebViewController _controller;

  @override
  void initState() {
    super.initState();
    // Initialize the WebView controller
    _controller = WebViewController()
      ..setJavaScriptMode(JavaScriptMode.unrestricted)
      ..loadRequest(Uri.parse('https://webakun.altrak1978.co.id/')); // Updated method
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        // title: const Text("MyAIS"),
      ),
      body: WebViewWidget(controller: _controller),
      );
  }
}
