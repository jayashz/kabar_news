import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:go_router/go_router.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/custom_widgets/custom_textfield.dart';
import 'package:kabar_news/common/router/route_path.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({super.key});

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();
  bool? isChecked = false;
  bool obsecureText = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: SingleChildScrollView(
            child: FormBuilder(
              key: _formKey,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    "Hello",
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  Text(
                    "Again!",
                    style: Theme.of(context)
                        .textTheme
                        .displayLarge!
                        .copyWith(color: Theme.of(context).primaryColor),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Welcome back you've \nbeen missed",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 40),
                  CustomTextField(
                    label: "Username*",
                    fieldName: "email",
                    hintText: "",
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Email field cannot be empty";
                      }
                      final isvalid = EmailValidator.validate(val);
                      if (isvalid) {
                        return null;
                      } else {
                        return "Enter valid email address";
                      }
                    },
                  ),
                  CustomTextField(
                    label: "Password*",
                    fieldName: "password",
                    hintText: "",
                    obscureText: obsecureText,
                    suffixIcon: Icons.visibility_off,
                    validator: (val) {
                      if (val == null || val.isEmpty) {
                        return "Password field cannot be empty";
                      } else if (val.length < 4) {
                        return "Password field must be at least 4 character long";
                      } else {
                        return null;
                      }
                    },
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Row(
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
                      TextButton(
                        style: Theme.of(context).textButtonTheme.style,
                        onPressed: () {},
                        child: Text("Forgot the password?"),
                      ),
                    ],
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  SizedBox(
                    width: double.infinity,
                    child: ElevatedButton(
                      style: Theme.of(context).elevatedButtonTheme.style,
                      onPressed: () async {
                        if (_formKey.currentState!.saveAndValidate()) {
                          try {
                            await FirebaseAuth.instance
                                .signInWithEmailAndPassword(
                                    email:
                                        _formKey.currentState!.value["email"],
                                    password: _formKey
                                        .currentState!.value["password"]);
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'user-not-found') {
                              Fluttertoast.showToast(msg: e.code);
                            } else if (e.code == 'wrong-password') {
                              Fluttertoast.showToast(
                                  msg:
                                      "Wrong password provided for that user.");
                            }
                            Fluttertoast.showToast(msg: e.code);
                          }
                          if (context.mounted &&
                              FirebaseAuth.instance.currentUser != null) {
                            context.go(RoutePath.home);
                          }
                        }
                      },
                      child: Text(
                        "Login",
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
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Color(0xFFEEF1F4),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          label: Text(
                            "Google",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          icon: Image.asset(
                            Assets.google,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                      const SizedBox(
                        width: 10,
                      ),
                      Expanded(
                        child: TextButton.icon(
                          onPressed: () {},
                          style: ButtonStyle(
                            backgroundColor: WidgetStateProperty.all(
                              Color(0xFFEEF1F4),
                            ),
                            shape: WidgetStateProperty.all(
                              RoundedRectangleBorder(
                                borderRadius: BorderRadius.circular(8),
                              ),
                            ),
                          ),
                          label: Text(
                            "Facebook",
                            style: Theme.of(context).textTheme.labelMedium,
                          ),
                          icon: Image.asset(
                            Assets.facebook,
                            height: 20,
                            width: 20,
                          ),
                        ),
                      ),
                    ],
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "dont have an account?",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          context.push(RoutePath.signup);
                        },
                        child: Text("Sign Up"),
                      )
                    ],
                  )
                ],
              ),
            ),
          ),
        ),
      ),
    );
  }
}
