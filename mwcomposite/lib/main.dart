import 'package:flutter/material.dart';
// import 'package:mwcomposite/widgets/main_header.dart';

import 'package:smooth_scroll_web/smooth_scroll_web.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'Midwest Composite',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: MyHomePage(title: 'Flutter Demo Home Page'),
    );
  }
}

class MyHomePage extends StatefulWidget {
  MyHomePage({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  ScrollController _scrollController;
  double position = 0;

  @override
  void initState() {
    super.initState();
    _scrollController = ScrollController()
      ..addListener(() {
        // print("offset = ${_scrollController.offset}");
        setState(() {
          position = _scrollController.offset;
        });
      });
  }

  @override
  Widget build(BuildContext context) {
    var size = MediaQuery.of(context).size;
    return Scaffold(
      body: CustomScrollView(
        // physics: NeverScrollableScrollPhysics(),
        // physics: BouncingScrollPhysics(),
        physics: ClampingScrollPhysics(),
        // physics: AlwaysScrollableScrollPhysics(),
        controller: _scrollController,
        slivers: [
          SliverAppBar(
            backgroundColor: Colors.white,
            expandedHeight: size.height * 0.11,
            actions: [],
            flexibleSpace: Container(
              height: double.infinity,
              child: Row(
                crossAxisAlignment: CrossAxisAlignment.center,
                // main
                children: [
                  SizedBox(
                    width: 20,
                  ),
                  position < size.height * .075
                      ? Image.asset(
                          "assets/MWCOMPOSITES.PNG",
                        )
                      : Image.asset(
                          "assets/MWCOMPOSITES-LOGO.PNG",
                        ),
                  SizedBox(
                    width: 20,
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "page1",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "page3",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "page2",
                    ),
                  ),
                  TextButton(
                    onPressed: () {},
                    child: Text(
                      "page4",
                    ),
                  ),
                ],
              ),
            ),
            floating: true,
            pinned: true,
            snap: true,
          ),
          // SliverPersistentHeader(
          //   floating: true,
          //   pinned: true,
          //   delegate: MainHeader(
          //     min: size.height * 0.05,
          //     max: size.height * 0.1,
          //   ),
          // ),
          // SliverFillRemaining(),
          SliverToBoxAdapter(
            child: Container(
              height: size.height * 0.5,
              color: Colors.green,
              padding: const EdgeInsets.all(8.0),
              child: Text('Section 1', style: TextStyle(fontSize: 24)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: size.height * 0.5,
              color: Colors.yellow,
              padding: const EdgeInsets.all(8.0),
              child: Text('Section 2', style: TextStyle(fontSize: 24)),
            ),
          ),
          SliverToBoxAdapter(
            child: Container(
              height: size.height * 0.5,
              color: Colors.blue,
              padding: const EdgeInsets.all(8.0),
              child: Text('Section 3', style: TextStyle(fontSize: 24)),
            ),
          ),
        ],
      ),
    );
  }

  @override
  void dispose() {
    _scrollController
        .dispose(); // it is a good practice to dispose the controller
    super.dispose();
  }
}
