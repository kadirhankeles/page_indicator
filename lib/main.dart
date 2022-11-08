import 'package:flutter/material.dart';
import 'package:page_indicator/page_indicator.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        // This is the theme of your application.
        //
        // Try running your application with "flutter run". You'll see the
        // application has a blue toolbar. Then, without quitting the app, try
        // changing the primarySwatch below to Colors.green and then invoke
        // "hot reload" (press "r" in the console where you ran "flutter run",
        // or simply save your changes to "hot reload" in a Flutter IDE).
        // Notice that the counter didn't reset back to zero; the application
        // is not restarted.
        primarySwatch: Colors.blue,
      ),
      home: const MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key, required this.title});

  // This widget is the home page of your application. It is stateful, meaning
  // that it has a State object (defined below) that contains fields that affect
  // how it looks.

  // This class is the configuration for the state. It holds the values (in this
  // case the title) provided by the parent (in this case the App widget) and
  // used by the build method of the State. Fields in a Widget subclass are
  // always marked "final".

  final String title;

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
 
late PageController controller;

  GlobalKey<PageContainerState> key = GlobalKey();

  @override
  void initState() {
    super.initState();
    controller = PageController();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  int counter = 0;
 

 @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Container(
        color: Colors.red,
        child: Container(
          height: 320.0,
          child: PageIndicatorContainer(
            key: key,
            child: PageView(
              children: <Widget>[
                Image(image: NetworkImage("https://images.ctfassets.net/az3stxsro5h5/24L2UM6hV3m4csMvBzkHbj/9d4583541bdb29ae0c6a9ff2b60f1313/After.jpeg?w=2389&h=2986&fl=progressive&q=50&fm=jpg")),
                Image(image: NetworkImage("https://i0.wp.com/photofocus.com/wp-content/uploads/2019/11/IMG_1199.jpg?fit=2560%2C1440&ssl=1")),
                Image(image: NetworkImage("https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcTm5yvdWvw8L51KNbi9fkVvU9EiXyQfp7bORsmRLvAJPTrYMr0yW69CAlJC16pxbhI5HDc&usqp=CAU")),
              ],
              controller: controller,
              reverse: false,
            ),
            align: IndicatorAlign.bottom,
            length: 3,
            indicatorSpace: 15.0,
          ),
        ),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.refresh),
        tooltip: "force refresh indicator",
        onPressed: () {
          key.currentState?.forceRefreshState();
        },
      ),
    );
  }
}
