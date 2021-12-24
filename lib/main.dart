import 'package:flutter/material.dart';
import 'package:flutter_lottie_app1/next_page.dart';
import 'package:lottie/lottie.dart';

void main() => runApp(const MyApp());

class MyApp extends StatelessWidget {
  const MyApp({key});

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      title: _title,
      home: MyWidget(),
    );
  }
}

class MyWidget extends StatefulWidget {
  const MyWidget({Key? key}) : super(key: key);

  @override
  _MyWidgetState createState() => _MyWidgetState();
}

class _MyWidgetState extends State<MyWidget> {
  final controller = PageController();

  @override
  void initState() {
    super.initState();
  }

  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        body: Stack(
      children: [
        // Container(child: ElevatedButton(onPressed: (){})), child: Text('next')
        PageView(
          controller: controller,
          children: <Widget>[
            // ElevatedButton(onPressed: (){}, child: Text('next'),),
            page1(),
            page2(),
            page3(),
          ],
        ),
        Container(
          padding: EdgeInsets.only(
            left: MediaQuery.of(context).size.width - 110,
            top: 40,
          ),
          child: ElevatedButton(
            onPressed: () {
              Navigator.push(
                context,
                MaterialPageRoute(builder: (context) => NextPage()),
              );
            },
            child: const Text(
              'スキップ',
              style: TextStyle(
                color: Colors.black,
                fontWeight: FontWeight.bold,
              ),

            ),
            style: ElevatedButton.styleFrom(
              primary: Colors.transparent,
              elevation: 0,
              shadowColor: Colors.transparent,
            ),

          ),
        ),
      ],
    ));
  }

  Widget page1() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/1.json',
          ),
          const Text(
            'ようこそ',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget page2() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/2.json',
          ),
          const Text(
            'さまざまなニュースが受け取れます',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }

  Widget page3() {
    return Center(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Lottie.asset(
            'assets/3.json',
          ),
          const Text(
            '新たな情報に出会えます',
            style: TextStyle(
              fontSize: 20,
            ),
          ),
        ],
      ),
    );
  }
}