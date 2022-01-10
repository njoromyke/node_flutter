// ignore_for_file: avoid_print, deprecated_member_use

import 'package:flutter/material.dart';

class RegisterPage extends StatefulWidget {
  RegisterPage({Key? key}) : super(key: key);

  @override
  _RegisterPageState createState() => _RegisterPageState();
}

class _RegisterPageState extends State<RegisterPage> {
  final _formkey = GlobalKey<FormState>();
  String? _username, _email, _password;

  Widget _showTitle() {
    return const Text(
      "Register",
    );
  }

  Widget _userNameInput() {
    return Padding(
      padding: const EdgeInsets.only(top: 20.0),
      child: TextFormField(
        onSaved: (val) => _username = val,
        validator: (val) => val!.length < 6
            ? 'Username must be at least 6 characters long'
            : null,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Username",
            hintText: "Enter your username",
            icon: Icon(
              Icons.face,
              color: Colors.grey,
            )),
      ),
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
        obscureText: true,
        decoration: const InputDecoration(
            border: OutlineInputBorder(),
            labelText: "Password",
            hintText: "Enter your passwrod",
            icon: Icon(
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
              style: Theme.of(context)
                  .textTheme
                  .bodyText1
                  ?.copyWith(color: Colors.black),
            ),
          ),
          FlatButton(
              onPressed: () => Navigator.pushNamed(context, '/login'),
              child: Text("Existing user?Login"))
        ],
      ),
    );
  }

  void _submit() {
    final form = _formkey.currentState;

    if (form!.validate()) {
      form.save();
      print(_username);
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
                  "Register",
                  style: Theme.of(context).textTheme.headline1,
                ),
                _userNameInput(),
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
