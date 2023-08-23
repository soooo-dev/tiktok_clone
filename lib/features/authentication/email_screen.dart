import 'package:flutter/material.dart';
import 'package:tiktok_clone/constants/gaps.dart';
import 'package:tiktok_clone/constants/sizes.dart';
import 'package:tiktok_clone/features/authentication/widgets/form_button.dart';

class EamilScreen extends StatefulWidget {
  const EamilScreen({super.key});

  @override
  State<EamilScreen> createState() => _EamilScreenState();
}

class _EamilScreenState extends State<EamilScreen> {
  final TextEditingController _usernamecontroller = TextEditingController();

  String _username = "";

  @override
  void initState() {
    super.initState();

    _usernamecontroller.addListener(() {
      setState(() {
        _username = _usernamecontroller.text;
      });
    });
  }

  @override
  void dispose() {
    _usernamecontroller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          "Sign up",
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.symmetric(
          horizontal: Sizes.size36,
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Gaps.v40,
            const Text(
              "What is your email?",
              style: TextStyle(
                fontSize: Sizes.size24,
                fontWeight: FontWeight.w700,
              ),
            ),
            Gaps.v16,
            TextField(
              controller: _usernamecontroller,
              decoration: InputDecoration(
                hintText: "Email",
                enabledBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
                focusedBorder: UnderlineInputBorder(
                  borderSide: BorderSide(
                    color: Colors.grey.shade400,
                  ),
                ),
              ),
              cursorColor: Theme.of(context).primaryColor,
            ),
            Gaps.v16,
            FromButton(disabled: _username.isEmpty)
          ],
        ),
      ),
    );
  }
}
