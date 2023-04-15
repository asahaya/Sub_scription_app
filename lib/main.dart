import 'package:flutter/material.dart';
import 'package:sub_scription_app/add_page.dart';

import 'common.dart';



void main() async {
  WidgetsFlutterBinding.ensureInitialized();
  await Firebase.initializeApp(
    options: DefaultFirebaseOptions.currentPlatform,
  );
  runApp(MyApp());
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
                    Text('2023年4月'),
                    Text('¥10500'),
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
                        height: 50,
                        child: Row(
                          children: [
                            Expanded(child: Image.network(img)),
                            Expanded(
                              child: Text('Flutter大学'),
                            ),
                            Expanded(
                              child: Text('¥5,550'),
                            ),
                          ],
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
          child:const Text('add'),
          onPressed: (){
            Navigator.push(context, MaterialPageRoute(
              builder: (context) => AddPage()
            ),);

          },),
      ),
    );
  }
}
