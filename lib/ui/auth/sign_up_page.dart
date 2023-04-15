import 'package:flutter/material.dart';
import 'package:flutter/src/widgets/framework.dart';
import 'package:flutter/src/widgets/placeholder.dart';
import 'package:sub_scription_app/ui/auth/button_freame.dart';

class SignUpPage extends StatelessWidget {
  const SignUpPage({super.key});

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