import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:sub_scription_app/service/platform_upload.dart';
import 'package:sub_scription_app/ui/auth/button_freame.dart';
import 'package:sub_scription_app/ui/auth/login_page.dart';
import '../../common.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int _paceSelectedOption = 1;
  int _startSelectedOption = 1;

  void _paceHandleRadioValueChange(int? value) {
    setState(() {
      _paceSelectedOption = value ?? 1;
    });
  }
  //Asnhyt10ap

  void _startHandleRadioValueChange(int? value) {
    setState(() {
      _startSelectedOption = value ?? 1;
    });
  }

  String? isSelection = 'Movie';

  TextEditingController _datacontroller = TextEditingController();
  TextEditingController pf_name = TextEditingController();
  TextEditingController name = TextEditingController();
  TextEditingController price = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _datacontroller.dispose();
    pf_name.dispose();
    name.dispose();
    price.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final platformUpload = PlatformUpload();
    return Scaffold(
      appBar: AppBar(
        title: const Text('プランを追加する'),
        actions: [
          IconButton(
              onPressed: () async {
                platformUpload.addPlatFormData(
                    _selectedDate!,
                    name.text,
                    pf_name.text,
                    price.text,
                    isSelection!,
                    _startSelectedOption,
                    _paceSelectedOption);
              },
              icon: Icon(Icons.check))
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    child: GestureDetector(
                        onTap: () async {
                          platformUpload.imageUpload();
                        },
                        child: Image.network(img))),
                Expanded(
                  child: Column(
                    children: [
                      DropdownButton(
                        items: const [
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
                        onChanged: (String? value) {
                          setState(() {
                            isSelection = value;
                          });
                        },
                        value: isSelection,
                      ),
                      TextField(
                        controller: pf_name,
                        decoration: InputDecoration(hintText: "プラットフォーム選択"),
                      ),
                      SizedBox(height: 10),
                      TextField(
                        controller: name,
                        decoration: InputDecoration(hintText: "プラン選択"),
                      ),
                    ],
                  ),
                ),
              ],
            ),
            Row(
              children: [
                TitleFlame(title: '開始日'),
                Expanded(
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _datacontroller,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                    onTap: () async {
                      _selectedDate = await showDatePicker(
                        context: context,
                        initialDate: DateTime.now(),
                        firstDate: DateTime(1900),
                        lastDate: DateTime(2100),
                      );
                      if (_selectedDate != null) {
                        setState(() {
                          _datacontroller.text =
                              DateFormat('yyyy/MM/dd').format(_selectedDate!);
                        });
                      }
                    },
                  ),
                ),

                ///
              ],
            ),
            Row(
              children: [
                TitleFlame(title: '支払いペース'),
                Expanded(
                  child: RadioListTile<int>(
                    title: const Text('月額'),
                    value: 1,
                    groupValue: _paceSelectedOption,
                    onChanged: _paceHandleRadioValueChange,
                  ),
                ),
                Expanded(
                  child: RadioListTile<int>(
                    title: const Text('年額'),
                    value: 2,
                    groupValue: _paceSelectedOption,
                    onChanged: _paceHandleRadioValueChange,
                  ),
                ),
              ],
            ),
            //---
            Row(
              children: [
                TitleFlame(title: '支払い開始日'),
                Expanded(
                  child: RadioListTile<int>(
                    title: const Text('月初請求'),
                    value: 1,
                    groupValue: _startSelectedOption,
                    onChanged: _startHandleRadioValueChange,
                  ),
                ),
                Expanded(
                  child: RadioListTile<int>(
                    title: const Text('加入日請求'),
                    value: 2,
                    groupValue: _startSelectedOption,
                    onChanged: _startHandleRadioValueChange,
                  ),
                ),
              ],
            ),

            Row(
              children: [
                TitleFlame(title: '価格'),
                Expanded(
                  child: TextFormField(
                    keyboardType: TextInputType.number,
                    decoration: InputDecoration(
                      hintText: _paceSelectedOption == 1 ? '月額の価格' : '年額の価格',
                      fillColor: Colors.orange[100],
                      filled: true,
                      isDense: true,
                      prefixIcon: const Icon(Icons.price_change),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(32),
                        borderSide: BorderSide.none,
                      ),
                    ),
                  ),
                ),
              ],
            ),
            SizedBox(height: 50),
            ButtonFlame(
                label: 'Logout',
                colors: Colors.red,
                onPressed: () async {
                  await FirebaseAuth.instance.signOut();
                  if (context.mounted) {
                    Navigator.pushAndRemoveUntil(
                        context,
                        MaterialPageRoute(
                            builder: (context) => const LoginPage()),
                        (route) => false);
                  }
                }),
          ],
        ),
      ),
    );
  }
}

class TitleFlame extends StatelessWidget {
  const TitleFlame({required this.title, super.key});
  final String title;

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 50,
      width: 100,
      decoration: BoxDecoration(
        border: Border.all(
          color: Colors.grey,
        ),
      ),
      child: Center(child: Text(title)),
    );
  }
}
