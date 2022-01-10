// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';
import 'package:node_flutter/screens/register.dart';

class LoginPage extends StatefulWidget {
  LoginPage({Key? key}) : super(key: key);

  @override
  _LoginPageState createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final _formkey = GlobalKey<FormState>();

  bool _obscureText = true;

  String? _email, _password;

  Widget _showTitle() {
    return const Text(
      "Login",
    );
  }

  Widget _passwordInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _password = val,
        validator: (val) => val!.length < 6
            ? 'Password must be at least 6 characters long'
            : null,
        obscureText: _obscureText,
        decoration: InputDecoration(
            border: const OutlineInputBorder(),
            labelText: "Password",
            hintText: "Enter your passwrod",
            suffixIcon: GestureDetector(
              child: Icon(
                _obscureText ? Icons.visibility : Icons.visibility_off,
                color: Colors.grey,
              ),
              onTap: () {
                setState(() {
                  _obscureText = !_obscureText;
                });
              },
            ),
            icon: const Icon(
              Icons.lock,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget _emailInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _email = val,
        validator: (value) =>
            !value!.contains('@') ? 'Please enter a valid email' : null,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Email",
            hintText: "Enter your email",
            icon: Icon(
              Icons.email,
              color: Colors.grey,
            )),
      ),
    );
  }

  Widget _formInputs() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: Column(
        children: [
          ElevatedButton(
            onPressed: _submit,
            child: Text(
              'Submit',
              style: Theme.of(context).textTheme.button,
            ),
          ),
          FlatButton(
              onPressed: () =>
                  Navigator.pushReplacementNamed(context, "/register"),
              child: Text("New user? Regiser here")),
        ],
      ),
    );
  }

  void _submit() {
    final form = _formkey.currentState;

    if (form!.validate()) {
      form.save();
      print(_password);
      print(_email);
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: _showTitle(),
      ),
      body: Container(
        padding: const EdgeInsets.symmetric(horizontal: 20.0),
        child: Center(
          child: SingleChildScrollView(
              child: Form(
            key: _formkey,
            child: Column(
              children: [
                Text(
                  "Login",
                  style: Theme.of(context).textTheme.headline1,
                ),
                _emailInput(),
                _passwordInput(),

                // ignore: prefer_const_literals_to_create_immutables
                _formInputs(),
              ],
            ),
          )),
        ),
      ),
    );
  }
}
