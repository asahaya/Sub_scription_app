import 'package:flutter/material.dart';

import 'package:flutter/src/widgets/placeholder.dart';
import 'package:intl/intl.dart';
import 'package:sub_scription_app/main.dart';

import 'common.dart';

class AddPage extends StatefulWidget {
  const AddPage({super.key});

  @override
  State<AddPage> createState() => _AddPageState();
}

class _AddPageState extends State<AddPage> {
  int _selectedOption = 1;

  void _handleRadioValueChange(int? value) {
    setState(() {
      _selectedOption = value ?? 1;
    });
  }

  String? isSelection = 'Movie';

  TextEditingController _datacontroller = TextEditingController();
  DateTime? _selectedDate;

  @override
  void dispose() {
    _datacontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('プランを追加する'),
        actions: [IconButton(onPressed: () {}, icon: Icon(Icons.check))],
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
                    Text("ここにプラットフォーム選択"),
                    SizedBox(height: 10),
                    Text("ここにプラン選択"),
                  ],
                ),
              ),
            ],
          ),
          Row(
            children: [
              TitleFlame(title: '開始日'),
              Expanded(
                child: GestureDetector(
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
                  child: TextFormField(
                    textAlign: TextAlign.center,
                    controller: _datacontroller,
                    decoration: InputDecoration(
                      labelText: 'Date',
                      suffixIcon: Icon(Icons.calendar_today),
                    ),
                  ),
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
                  groupValue: _selectedOption,
                  onChanged: _handleRadioValueChange,
                ),
              ),
              Expanded(
                child: RadioListTile<int>(
                  title: const Text('年額'),
                  value: 2,
                  groupValue: _selectedOption,
                  onChanged: _handleRadioValueChange,
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
                    hintText: _selectedOption == 1 ? '月額の価格' : '年額の価格',
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
