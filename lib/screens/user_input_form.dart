import 'package:flutter/material.dart';

/// A screen demonstrating user input collection and validation using
/// Form, TextFormField, and ElevatedButton with SnackBar feedback.
class UserInputForm extends StatefulWidget {
  const UserInputForm({super.key});

  @override
  State<UserInputForm> createState() => _UserInputFormState();
}

class _UserInputFormState extends State<UserInputForm> {
  // GlobalKey uniquely identifies the Form and allows validation.
  final GlobalKey<FormState> _formKey = GlobalKey<FormState>();

  // Controllers manage the text input values for each field.
  final TextEditingController _nameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('User Input Form'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          // Form widget groups TextFormFields and enables collective validation
          // via the _formKey.
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                // ---- NAME FIELD ----
                // TextFormField provides built-in validation through the
                // validator callback, which runs when _formKey.currentState!.validate()
                // is called.
                TextFormField(
                  controller: _nameController,
                  decoration: const InputDecoration(
                    labelText: 'Name',
                    border: OutlineInputBorder(),
                  ),
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your name';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 16),

                // ---- EMAIL FIELD ----
                TextFormField(
                  controller: _emailController,
                  decoration: const InputDecoration(
                    labelText: 'Email',
                    border: OutlineInputBorder(),
                  ),
                  keyboardType: TextInputType.emailAddress,
                  validator: (value) {
                    if (value == null || value.trim().isEmpty) {
                      return 'Please enter your email';
                    }
                    if (!value.contains('@')) {
                      return 'Enter a valid email address';
                    }
                    return null;
                  },
                ),

                const SizedBox(height: 24),

                // ---- SUBMIT BUTTON ----
                // Calls _formKey.currentState!.validate() to trigger all
                // TextFormField validators. If every validator returns null
                // the form is considered valid.
                Center(
                  child: ElevatedButton(
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          const SnackBar(
                            content: Text('Form Submitted Successfully!'),
                          ),
                        );
                      }
                    },
                    child: const Text('Submit'),
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
