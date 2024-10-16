
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
      title: 'MyAIS',
      debugShowCheckedModeBanner: false,
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const AISHomePage(title: 'MyAIS'),
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
      ..setNavigationDelegate(
        NavigationDelegate(
          onPageFinished: (String url) {
            _refreshZoom();
          },
          onPageStarted: (String url) {
            _refreshZoom();
          },
        ),
      )
      ..loadRequest(Uri.parse('https://webakun.altrak1978.co.id/'));
  }

  Future<void> _refreshZoom() async {
    // Introduce a slight delay to ensure all scripts are loaded
    // Future.delayed(const Duration(milliseconds: 300));
    // Inject JavaScript to allow pinch-to-zoom
    _controller.runJavaScript(
      "document.querySelector('meta[name=viewport]').setAttribute('content', 'width=device-width, initial-scale=1.0, user-scalable=yes');"
    );
    _controller.clearCache();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: WebViewWidget(controller: _controller,),
      )
      );
  }
}
