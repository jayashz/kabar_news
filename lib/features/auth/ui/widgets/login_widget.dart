import 'package:flutter/material.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/custom_widgets/custom_textfield.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
          child: SingleChildScrollView(
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  'Hello',
                  style: Theme.of(context).textTheme.displayLarge,
                ),
                const SizedBox(height: 10),
                Text(
                  'Again!',
                  style: Theme.of(context).textTheme.displayLarge?.copyWith(
                      color: Theme.of(context)
                          .primaryColor), // <-- Replace with your color
                ),
                const SizedBox(height: 10),
                Text(
                  "Welcome back you've\nbeen missed",
                  style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                        color: Colors.grey,
                        fontSize: 20,
                        fontWeight: FontWeight.w400,
                      ),
                ),
                const SizedBox(height: 20),
                CustomTextField(
                    label: "Username*", fieldName: "sdhd", hintText: ""),
                CustomTextField(
                  label: "Password*",
                  fieldName: "as",
                  hintText: "",
                  obscureText: true,
                  suffixIcon: Icons.remove_red_eye,
                ),
                const SizedBox(
                  height: 4,
                ),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Container(
                      child: Row(
                        children: [
                          Checkbox(
                            value: isChecked,
                            fillColor:
                                Theme.of(context).checkboxTheme.fillColor,
                            onChanged: (value) {
                              setState(() {
                                isChecked = value;
                              });
                            },
                          ),
                          Text(
                            "Remember me",
                            style: Theme.of(context).textTheme.labelSmall,
                          ),
                        ],
                      ),
                    ),
                    TextButton(
                      style: Theme.of(context).textButtonTheme.style,
                      onPressed: () {},
                      child: Text("Forgot the password?"),
                    )
                  ],
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    style: Theme.of(context).elevatedButtonTheme.style,
                    onPressed: () {},
                    child: Text(
                      "Login",
                      style: Theme.of(context).textTheme.labelMedium,
                    ),
                  ),
                ),
                const SizedBox(
                  height: 16,
                ),
                SizedBox(
                  width: double.infinity,
                  child: Text("or continue with",
                      textAlign: TextAlign.center,
                      style: Theme.of(context).textTheme.labelSmall),
                ),
                const SizedBox(
                  height: 16,
                ),
                TextButton.icon(
                  onPressed: () {},
                  style: ButtonStyle(
                    backgroundColor: WidgetStateProperty.all(
                      Color(0xFFEEF1F4),
                    ),
                  shape: WidgetStateProperty.all(Border.symmetric())
                  ),
                  label: Text(
                    "Google",
                    style: Theme.of(context).textTheme.bodyMedium,
                  ),
                  icon: Image.asset(
                    Assets.google,
                    height: 20,
                    width: 20,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
