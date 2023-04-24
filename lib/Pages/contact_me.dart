import 'package:flutter/material.dart';
import 'package:url_launcher/url_launcher.dart';

class ContactMeScreen extends StatefulWidget {
  @override
  _ContactMeScreenState createState() => _ContactMeScreenState();
}

class _ContactMeScreenState extends State<ContactMeScreen> {
  final _formKey = GlobalKey<FormState>();
  final _nameController = TextEditingController();
  final _emailController = TextEditingController();
  final _messageController = TextEditingController();

  @override
  void dispose() {
    _nameController.dispose();
    _emailController.dispose();
    _messageController.dispose();
    super.dispose();
  }

  Future<void> _submitForm() async {
    if (_formKey.currentState!.validate()) {
      final name = _nameController.text;
      final email = _emailController.text;
      final message = _messageController.text;

      final subject = 'New message from $name';
      final body = 'Email: $email\n\n$message';

      final emailLaunchUri = Uri(
        scheme: 'mailto',
        path: 'myinbox@example.com',
        queryParameters: {
          'subject': subject,
          'body': body,
        },
      );

      if (await canLaunch(emailLaunchUri.toString())) {
        await launch(emailLaunchUri.toString());
      } else {
        throw 'Could not launch $emailLaunchUri';
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      width: MediaQuery.of(context).size.width,
      height: MediaQuery.of(context).size.height,
      child: Form(
        key: _formKey,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TextFormField(
              controller: _nameController,
              decoration: InputDecoration(
                labelText: 'Name',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your name';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _emailController,
              decoration: InputDecoration(
                labelText: 'Email',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter your email';
                }
                if (!value.contains('@')) {
                  return 'Please enter a valid email address';
                }
                return null;
              },
            ),
            SizedBox(height: 16),
            TextFormField(
              controller: _messageController,
              maxLines: 5,
              decoration: InputDecoration(
                labelText: 'Message',
              ),
              validator: (value) {
                if (value == null || value.isEmpty) {
                  return 'Please enter a message';
                }
                return null;
              },
            ),
            SizedBox(height: 32),
            Center(
              child: ElevatedButton(
                onPressed: _submitForm,
                child: Text('Send Message'),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
