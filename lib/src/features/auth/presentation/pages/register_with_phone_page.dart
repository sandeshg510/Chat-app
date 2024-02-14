import 'package:chat_messenger/components/my_text_form_field.dart';
import 'package:chat_messenger/pages/success_phone_page.dart';
import 'package:chat_messenger/services/auth/auth_phone.dart';
import 'package:chat_messenger/services/auth/auth_service.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../components/my_buttons.dart';
import '../components/my_text_field.dart';

class RegisterWithPhone extends StatefulWidget {
  final Function()? onTap;

  const RegisterWithPhone({
    super.key,
    this.onTap,
  });

  @override
  State<RegisterWithPhone> createState() => _RegisterWithPhoneState();
}

class _RegisterWithPhoneState extends State<RegisterWithPhone> {
  TextEditingController _phoneController = TextEditingController();
  TextEditingController _otpController = TextEditingController();
  TextEditingController _nameController = TextEditingController();

  final _formKey = GlobalKey<FormState>();

  final _formKey1 = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.background,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.symmetric(
            horizontal: 40,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const Icon(
                Icons.message,
                size: 100,
              ),
              const SizedBox(
                height: 50,
              ),
              const Text(
                "Sign up with phone number and name",
                style: TextStyle(fontSize: 16),
              ),
              const SizedBox(
                height: 50,
              ),
              MyTextFormField(
                labelText: '    Enter your first name',
                obscureText: false,
                controller: _nameController,
                validator: (value) {
                  if (value!.isEmpty) return "Please enter your name";
                  return null;
                },
                inputType: TextInputType.name,
              ),
              const SizedBox(
                height: 20,
              ),
              Form(
                key: _formKey,
                child: TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: InputDecoration(
                      filled: true,
                      fillColor: Theme.of(context).colorScheme.secondary,
                      prefixText: "+91 ",
                      labelText: "    Enter you phone number",
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(32))),
                  validator: (value) {
                    if (value!.length != 10) return "Invalid phone number";
                    return null;
                  },
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              SizedBox(
                height: 50,
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: () {
                    if (_formKey.currentState!.validate()) {
                      AuthPhone.sentOtp(
                          phone: _phoneController.text,
                          errorStep: () => ScaffoldMessenger.of(context)
                                  .showSnackBar(const SnackBar(
                                content: Text(
                                  "Error in sending OTP",
                                  style: TextStyle(color: Colors.white),
                                ),
                                backgroundColor: Colors.red,
                              )),
                          nextStep: () {
                            showDialog(
                                context: context,
                                builder: (context) => AlertDialog(
                                      title: const Text("OTP Verification"),
                                      content: Column(
                                        mainAxisSize: MainAxisSize.min,
                                        crossAxisAlignment:
                                            CrossAxisAlignment.start,
                                        children: [
                                          const Text("Enter 6 digit OTP"),
                                          const SizedBox(
                                            height: 12,
                                          ),
                                          Form(
                                            key: _formKey1,
                                            child: TextFormField(
                                              keyboardType:
                                                  TextInputType.number,
                                              controller: _otpController,
                                              decoration: InputDecoration(
                                                  labelText:
                                                      "Enter you phone number",
                                                  border: OutlineInputBorder(
                                                      borderRadius:
                                                          BorderRadius.circular(
                                                              32))),
                                              validator: (value) {
                                                if (value!.length != 6)
                                                  return "Invalid OTP";
                                                return null;
                                              },
                                            ),
                                          ),
                                        ],
                                      ),
                                      actions: [
                                        TextButton(
                                            onPressed: () {
                                              if (_formKey1.currentState!
                                                  .validate()) {
                                                AuthPhone.loginWithOtp(
                                                  otp: _otpController.text,
                                                  phone: _phoneController.text,
                                                  name: _nameController.text,
                                                ).then((value) {
                                                  if (value == "Success") {
                                                    Navigator.pop(context);
                                                    Navigator.pushReplacement(
                                                        context,
                                                        MaterialPageRoute(
                                                            builder: (context) =>
                                                                SuccessPage()));
                                                  } else {
                                                    Navigator.pop(context);
                                                    ScaffoldMessenger.of(
                                                            context)
                                                        .showSnackBar(SnackBar(
                                                      content: Text(
                                                        value,
                                                        style: TextStyle(
                                                            color:
                                                                Colors.white),
                                                      ),
                                                      backgroundColor:
                                                          Colors.red,
                                                    ));
                                                  }
                                                });
                                              }
                                            },
                                            child: Text("Submit"))
                                      ],
                                    ));
                          });
                    }
                  },
                  style: ElevatedButton.styleFrom(
                      backgroundColor: Colors.yellow,
                      foregroundColor: Colors.black),
                  child: const Text("Send OTP"),
                ),
              ),
              const SizedBox(
                height: 30,
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text(
                    "  Already a member?  ",
                    style: TextStyle(fontSize: 16),
                  ),
                  GestureDetector(
                    onTap: widget.onTap,
                    child: const Text(
                      "Login now",
                      style: TextStyle(
                          fontSize: 16,
                          fontWeight: FontWeight.bold,
                          color: Colors.blue),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
