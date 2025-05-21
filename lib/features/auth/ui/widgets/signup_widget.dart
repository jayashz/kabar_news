import 'package:email_validator/email_validator.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';

import 'package:go_router/go_router.dart';

import 'package:kabar_news/common/custom_widgets/custom_textfield.dart';
import 'package:kabar_news/common/router/route_path.dart';

class SignupWidget extends StatefulWidget {
  const SignupWidget({
    super.key,
  });

  @override
  State<SignupWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<SignupWidget> {
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
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
                    'Hello',
                    style: Theme.of(context).textTheme.displayLarge,
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "Signup to get started",
                    style: Theme.of(context).textTheme.bodyMedium?.copyWith(
                          color: Colors.grey,
                          fontSize: 20,
                          fontWeight: FontWeight.w400,
                        ),
                  ),
                  const SizedBox(height: 10),
                  Text(
                    "We're ready \nto serve you \nwith latest news",
                    style: Theme.of(context).textTheme.displayMedium,
                  ),
                  const SizedBox(height: 20),
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
                    obscureText: true,
                    suffixIcon: Icons.remove_red_eye,
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
                  const SizedBox(
                    height: 4,
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
                      onPressed: () async {
                        if (_formKey.currentState!.saveAndValidate()) {
                          try {
                            await FirebaseAuth.instance
                                .createUserWithEmailAndPassword(
                              email: _formKey.currentState!.value["email"],
                              password:
                                  _formKey.currentState!.value["password"],
                            );
                          } on FirebaseAuthException catch (e) {
                            if (e.code == 'weak-password') {
                              Fluttertoast.showToast(msg: e.code);
                            } else if (e.code == 'email-already-in-use') {
                              Fluttertoast.showToast(msg: e.code);
                            }
                          } catch (e) {
                            Fluttertoast.showToast(msg: e.toString());
                          }
                          if (context.mounted &&
                              FirebaseAuth.instance.currentUser != null) {
                            context.go(RoutePath.success);
                          }
                        }
                      },
                      child: Text(
                        "Sign Up",
                      ),
                    ),
                  ),
                  const SizedBox(
                    height: 16,
                  ),
                  // SizedBox(
                  //   width: double.infinity,
                  //   child: Text("or continue with",
                  //       textAlign: TextAlign.center,
                  //       style: Theme.of(context).textTheme.labelSmall),
                  // ),
                  // const SizedBox(
                  //   height: 16,
                  // ),
                  // Row(
                  //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  //   children: [
                  //     Expanded(
                  //       child: TextButton.icon(
                  //         onPressed: () {},
                  //         style: ButtonStyle(
                  //           backgroundColor: WidgetStateProperty.all(
                  //             Color(0xFFEEF1F4),
                  //           ),
                  //           shape: WidgetStateProperty.all(
                  //             RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(8),
                  //             ),
                  //           ),
                  //         ),
                  //         label: Text(
                  //           "Google",
                  //           style: Theme.of(context).textTheme.bodyMedium,
                  //         ),
                  //         icon: Image.asset(
                  //           Assets.google,
                  //           height: 20,
                  //           width: 20,
                  //         ),
                  //       ),
                  //     ),
                  //     Gap(30),
                  //     Expanded(
                  //       child: TextButton.icon(
                  //         onPressed: () {},
                  //         style: ButtonStyle(
                  //           backgroundColor: WidgetStateProperty.all(
                  //             Color(0xFFEEF1F4),
                  //           ),
                  //           shape: WidgetStateProperty.all(
                  //             RoundedRectangleBorder(
                  //               borderRadius: BorderRadius.circular(8),
                  //             ),
                  //           ),
                  //         ),
                  //         label: Text(
                  //           "Facebook",
                  //           style: Theme.of(context).textTheme.bodyMedium,
                  //         ),
                  //         icon: Image.asset(
                  //           Assets.facebook,
                  //           height: 20,
                  //           width: 20,
                  //         ),
                  //       ),
                  //     ),
                  //   ],
                  // ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Text(
                        "Already have an account?",
                        style: Theme.of(context).textTheme.labelSmall,
                      ),
                      TextButton(
                        onPressed: () {
                          Navigator.pop(context);
                        },
                        child: Text("Sign In"),
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
