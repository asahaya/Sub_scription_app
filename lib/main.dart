import 'package:flutter/material.dart';
import 'package:sub_scription_app/add_page.dart';
import 'package:sub_scription_app/login_page.dart';

import 'common.dart';

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
        primarySwatch: Colors.blue,
      ),
      home: const FirstPage(),
    );
  }
}

class FirstPage extends StatefulWidget {
  const FirstPage({super.key});

  @override
  State<FirstPage> createState() => _FirstPageState();
}

class _FirstPageState extends State<FirstPage> {
  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          children: [
            Expanded(
              flex: 1,
              child: Container(
                decoration: BoxDecoration(color: Colors.amber),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    Expanded(
                      flex: 1,
                      child: InkWell(
                       child: Icon(Icons.arrow_left),
                       onTap: (){},
                      )
                    ),
                    Expanded(
                      flex: 8,
                      child: Center(
                        child: RichText(
                          text: TextSpan(
                            text: '2023',
                            style: TextStyle(fontSize: 20, color: Colors.black),
                            children: const <TextSpan>[
                              TextSpan(
                                text: '年',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '4',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '月',
                                style: TextStyle(
                                    fontSize: 20, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: 'の支払い',
                                style: TextStyle(
                                    fontSize: 15, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '¥',
                                style: TextStyle(
                                    fontSize: 30, fontWeight: FontWeight.bold),
                              ),
                              TextSpan(
                                text: '10900',
                                style: TextStyle(
                                    fontSize: 40, fontWeight: FontWeight.bold),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    SizedBox(
                      width: 10,
                    ),
                    Expanded(
                      flex: 1,
                      child: InkWell(
                       child: Icon(Icons.arrow_right),
                       onTap: (){},
                      )
                    ),
                  ],
                ),
              ),
            ),
            Expanded(
              flex: 10,
              child: ListView.builder(
                itemCount: 24,
                itemBuilder: (context, index) {
                  return Column(
                    children: [
                      SizedBox(
                        height: 100,
                        child: Container(
                          alignment: Alignment.center,
                          margin: const EdgeInsets.all(10),
                          decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(15),
                              gradient: const LinearGradient(
                                  begin: Alignment.topRight,
                                  end: Alignment.bottomLeft,
                                  colors: [
                                    Colors.amberAccent,
                                    Colors.deepOrange,
                                  ]),
                              boxShadow: const [
                                BoxShadow(
                                    color: Colors.grey,
                                    spreadRadius: 1,
                                    blurRadius: 10,
                                    offset: Offset(4, 4))
                              ]),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Expanded(flex: 1, child: Image.network(img)),
                              SizedBox(width: 20),
                              Expanded(
                                flex: 5,
                                child: Text(
                                  'Flutter大学',
                                  style: TextStyle(fontSize: 20),
                                ),
                              ),
                              Expanded(
                                flex: 3,
                                child: RichText(
                                  text: TextSpan(
                                    text: '¥',
                                    style: TextStyle(
                                        fontSize: 30, color: Colors.black),
                                    children: const <TextSpan>[
                                      TextSpan(
                                          text: '5500',
                                          style: TextStyle(
                                              fontSize: 40,
                                              fontWeight: FontWeight.bold)),
                                    ],
                                  ),
                                ),
                              ),
                              Icon(Icons.alarm)
                            ],
                          ),
                        ),
                      ),
                    ],
                  );
                },
              ),
            ),
          ],
        ),
        floatingActionButton: FloatingActionButton(
          child: const Text('add'),
          onPressed: () {
            Navigator.push(
              context,
              MaterialPageRoute(builder: (context) => AddPage()),
            );
          },
        ),
      ),
    );
  }
}
