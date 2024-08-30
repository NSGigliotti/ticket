// ignore_for_file: file_names

import 'package:flutter/material.dart';

class LoginFormFildComponent extends StatefulWidget {
  const LoginFormFildComponent({
    super.key,
    required this.controller,
    required this.labelText,
    this.isPassword = false,
  });

  final TextEditingController controller;
  final String labelText;
  final bool isPassword;

  @override
  State<LoginFormFildComponent> createState() => _LoginFormFildComponentState();
}

class _LoginFormFildComponentState extends State<LoginFormFildComponent> {
  bool _passwordVisible = false;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 15, vertical: 10),
      child: TextFormField(
        controller: widget.controller,
        validator: (value) {
          if (value!.isEmpty) {
            return '${widget.labelText} obrigatorio';
          }
          return null;
        },
        style: const TextStyle(color: Colors.white),
        obscureText: widget.isPassword? !_passwordVisible : false,
        decoration: InputDecoration(
          labelText: widget.labelText,
          suffixIcon: IconButton(
            icon: Icon(
              widget.isPassword
                  ?  _passwordVisible
                      ? Icons.visibility
                      : Icons.visibility_off
                  : null
            ),
            onPressed: () {
              setState(() {
                _passwordVisible = !_passwordVisible;
              });
            },
          ),
        ),
      ),
    );
  }
}
