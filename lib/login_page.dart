import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Scaffold(
        body: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Image.network(
                "https://www.chargebee.com/blog/wp-content/uploads/2022/07/Chargebee-Subscription-Box-Industry-trends-opportunities-and-Market-Size.png"),
            Text("LOGIN"),
            TextFormField(
              decoration: InputDecoration(
                hintText: 'メールアドレスを入力してください',
                fillColor: Colors.orange[100],
                filled: true,
                isDense: true,
                prefixIcon: const Icon(Icons.man),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            TextFormField(
              obscureText: true,
              decoration: InputDecoration(
                hintText: 'パスワードを入力してください',
                fillColor: Colors.orange[100],
                filled: true,
                isDense: true,
                prefixIcon: const Icon(Icons.password),
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(32),
                  borderSide: BorderSide.none,
                ),
              ),
            ),
            ButtonFlame(
              label: "LOGIN",
              colors: Colors.blue,
              onPressed: () {},
            ),
            ButtonFlame(
              label: "REGISTER",
              colors: Colors.red,
              onPressed: () {},
            ),
          ],
        ),
      ),
    );
  }
}

class ButtonFlame extends StatelessWidget {
  const ButtonFlame(
      {required this.label, required this.onPressed, this.colors, super.key});

  final String label;
  final VoidCallback onPressed;
  final Color? colors;

  @override
  Widget build(BuildContext context) {
    return ElevatedButton(
      style: ButtonStyle(
        backgroundColor: MaterialStateProperty.all(colors),
      ),
      onPressed: () {},
      child: Text(label),
    );
  }
}
