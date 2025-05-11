import 'package:flutter/material.dart';
import 'package:flutter_form_builder/flutter_form_builder.dart';

class CustomTextField extends StatefulWidget {
  final String label;
  final String hintText;
  final String fieldName;
  final TextInputType? textInputType;
  final double bottomPadding;
  final bool obscureText;
  final bool toggleObscure;
  final bool readOnly;
  final IconData? suffixIcon;
  final TextEditingController? controller;
  final FormFieldValidator<String>? validator;

  const CustomTextField({
    super.key,
    required this.label,
    required this.fieldName,
    required this.hintText,
    this.bottomPadding = 16,
    this.obscureText = false,
    this.textInputType,
    this.readOnly = false,
    this.suffixIcon,
    this.controller,
    this.validator,
    this.toggleObscure = false,
  });

  @override
  State<CustomTextField> createState() => _CustomTextFieldState();
}

class _CustomTextFieldState extends State<CustomTextField> {
  late bool _obsecureText;
  @override
  void initState() {
    super.initState();
    _obsecureText = widget.obscureText;
  }

  void toggleVis() {
    setState(() {
      _obsecureText = !_obsecureText;
    });
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final textTheme = theme.textTheme;
    final ColorScheme clrScheme = theme.colorScheme;
    return Container(
      margin: EdgeInsets.only(bottom: widget.bottomPadding),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Text(
            widget.label,
            style: textTheme.labelSmall,
          ),
          const SizedBox(height: 4),
          FormBuilderTextField(
            name: widget.fieldName,
            style: Theme.of(context).textTheme.bodyMedium,
            controller: widget.controller,
            maxLines: 1,
            keyboardType: TextInputType.text,
            obscureText: _obsecureText,
            readOnly: widget.readOnly,
            validator: widget.validator,
            decoration: InputDecoration(
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
              errorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red),
              ),
              enabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: clrScheme.primary),
              ),
              focusedBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: clrScheme.primary),
              ),
              disabledBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: clrScheme.onSurface),
              ),
              focusedErrorBorder: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
                borderSide: BorderSide(color: Colors.red),
              ),
              fillColor: clrScheme.brightness == Brightness.dark
                  ? Color(0xFF3A3B3C)
                  : Colors.white,
              filled: true,
              contentPadding: const EdgeInsets.symmetric(
                vertical: 20,
                horizontal: 12,
              ),
              counterText: "",
              hintText: widget.hintText,
              hintStyle: textTheme.labelSmall,
              suffixIcon: widget.obscureText
                  ? InkWell(
                      onTap: toggleVis,
                      child: _obsecureText
                          ? Icon(
                              Icons.remove_red_eye,
                              size: 26,
                              color: textTheme.labelSmall!.color,
                            )
                          : Icon(widget.suffixIcon),
                    )
                  : null,
            ),
          ),
        ],
      ),
    );
  }
}
