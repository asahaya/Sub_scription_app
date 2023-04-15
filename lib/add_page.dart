import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sub_scription_app/main.dart';

import 'common.dart';


 
class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {

String? isSelection='Movie';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title:const Text('プランを追加する'),
        actions: [
          IconButton(onPressed: (){

          }, icon: Icon(Icons.check))
        ],
      ),
      body: Column(
        children: [
          Row(
            children: [
            Expanded(child: Image.network(img)),
              Expanded(
                child: Column(
                  children: [
                    DropdownButton(
                      items: const[
                      DropdownMenuItem(
                        child: Text('Movie'),
                        value: 'Movie',
                      ),
                      DropdownMenuItem(
                        child: Text('Audio'),
                        value: 'Audio',
                      ),
                      DropdownMenuItem(
                        child: Text('Skill'),
                        value: 'Skill',
                      ),
                      DropdownMenuItem(
                        child: Text('other'),
                        value: 'other',
                      ),
                    ],
                     onChanged: (String? value){
                      setState(() {
                        isSelection=value;
                      });
                    },
                    value: isSelection,
                    ),
                    
                    TextFormField(),
                    TextFormField(),
                  ],
                ),
              ),
            ],
          ),

          TitleFlame(title: '開始日'),
        ],
      ),
    );
  }
}

class TitleFlame extends StatelessWidget {
  const TitleFlame({required this.title,super.key});
 final String title;

  @override
  Widget build(BuildContext context) {
    return  Container(
        height: 50,
        decoration: BoxDecoration(
          border: Border.all(color: Colors.grey,),
        ),
        child: Center(child: Text(title)),
    );
  }
}