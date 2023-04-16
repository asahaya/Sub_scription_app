import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
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
  TextEditingController _pfcontroller = TextEditingController();
  TextEditingController _plancontroller = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _datacontroller.dispose();
    _pfcontroller.dispose();
    _plancontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('新しくサブスクを追加する'),
        backgroundColor: Colors.orange,
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Row(
              children: [
                Expanded(
                    flex: 2,
                    child: Padding(
                      padding: const EdgeInsets.all(8.0),
                      child: ClipRRect(
                          borderRadius: BorderRadius.circular(50),
                          child: Image.network(img)),
                    )),
                Expanded(
                  flex: 3,
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
                      TextFormField(
                        controller: _pfcontroller,
                        decoration: InputDecoration(
                          hintText: 'プラットフォームを入力',
                          fillColor: Colors.blue[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide.none,
                          ),
                        ),
                      ),
                      SizedBox(height: 10),
                      TextFormField(
                        controller: _plancontroller,
                        decoration: InputDecoration(
                          hintText: 'プラン名を入力',
                          fillColor: Colors.blue[100],
                          filled: true,
                          border: OutlineInputBorder(
                            borderRadius: BorderRadius.circular(32),
                            borderSide: BorderSide.none,
                          ),
                        ),
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
                    autofocus: false,
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
                      FocusScope.of(context).requestFocus(new FocusNode());
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
