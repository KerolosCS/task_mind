import 'package:flutter/material.dart';

class InputWidget extends StatelessWidget {
  const InputWidget({
    super.key,
    required this.txt,
    required this.icon,
    this.obs,
    this.validation,
    this.controller,
  });
  final String? Function(String?)? validation;
  final String txt;
  final IconData icon;
  final bool? obs;
  final TextEditingController? controller;
  
  @override
  Widget build(BuildContext context) {
    return TextFormField(
      controller: controller,
      validator: validation,
      obscureText: obs ?? false,
      decoration: InputDecoration(
        isDense: true,
        hintText: txt,
        prefixIcon: Icon(
          icon,
          color: Colors.amber,
        ),
        border: const OutlineInputBorder(
            borderRadius: BorderRadius.all(Radius.circular(15))),
      ),
    );
  }
}
