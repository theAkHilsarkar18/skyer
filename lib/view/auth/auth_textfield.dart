import 'package:flutter/material.dart';

Widget myTextFormField(
    {bool? obscureText,
    required BuildContext context,
    required TextEditingController controller,
    required String labelText,
    required double height,
    required double width}) {
  return Padding(
    padding: const EdgeInsets.all(8.0),
    child: SizedBox(
      height: height * 0.07,
      width: width * 0.95,
      child: TextFormField(
        obscureText: obscureText ?? false,
        controller: controller,
        cursorColor: Colors.black,
        style: Theme.of(context).textTheme.bodyMedium,
        decoration: InputDecoration(
          // fillColor: Colors.grey.shade200,
          // filled: true,
          labelText: labelText,
          labelStyle: Theme.of(context).textTheme.bodySmall,
          border: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          enabledBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 1.5,
            ),
          ),
          focusedBorder: const OutlineInputBorder(
            borderSide: BorderSide(
              color: Colors.black,
              width: 2,
            ),
          ),
        ),
      ),
    ),
  );
}
