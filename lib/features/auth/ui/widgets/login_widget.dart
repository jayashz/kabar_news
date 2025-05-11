import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';
import 'package:fluttertoast/fluttertoast.dart';
import 'package:gap/gap.dart';
import 'package:kabar_news/common/bloc/assets.dart';
import 'package:kabar_news/common/bloc/common_state.dart';
import 'package:kabar_news/common/custom_widgets/custom_textfield.dart';
import 'package:kabar_news/features/auth/cubit/login_cubit.dart';
import 'package:kabar_news/features/auth/repository/user_repository.dart';
import 'package:kabar_news/features/homepage/pages/homepage.dart';
import 'package:page_transition/page_transition.dart';

class LoginWidget extends StatefulWidget {
  const LoginWidget({
    super.key,
  });

  @override
  State<LoginWidget> createState() => _LoginWidgetState();
}

class _LoginWidgetState extends State<LoginWidget> {
  final UserRepository userRepository = UserRepository();
  final GlobalKey<FormBuilderState> _formKey = GlobalKey<FormBuilderState>();

  bool? isChecked = true;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: BlocListener<LoginCubit, CommonState>(
        listener: (context, state) {
          if (state is CommonLoadingState) {
            //show loader here
          } else {
            //hide loader here
          }
          if (state is CommonErrorState) {
            Fluttertoast.showToast(msg: state.message);
          } else if (state is CommonSuccessState) {
            Fluttertoast.showToast(msg: "User Logged in");
            Navigator.of(context).pushAndRemoveUntil(
                PageTransition(
                  type: PageTransitionType.fade,
                  child: Homepage(),
                ),
                (route) => false);
          }
        },
        child: SafeArea(
          child: Padding(
            padding: const EdgeInsets.symmetric(vertical: 15, horizontal: 15),
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
                        onPressed: () {
                          if (_formKey.currentState!.saveAndValidate()) {
                            context.read<LoginCubit>().login(
                                  email: _formKey.currentState!.value["email"],
                                  password:
                                      _formKey.currentState!.value["password"],
                                );
                          }
                        },
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
                              style: Theme.of(context).textTheme.bodyMedium,
                            ),
                            icon: Image.asset(
                              Assets.google,
                              height: 20,
                              width: 20,
                            ),
                          ),
                        ),
                        Gap(30),
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
                              style: Theme.of(context).textTheme.bodyMedium,
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
                          onPressed: () {},
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
      ),
    );
  }
}
