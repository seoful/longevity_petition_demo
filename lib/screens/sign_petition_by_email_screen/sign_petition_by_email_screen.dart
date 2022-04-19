import 'package:flutter/material.dart';
import 'package:in_time_petition_demo/components/animated_button.dart';
import 'package:in_time_petition_demo/components/appbar.dart';
import 'package:in_time_petition_demo/core/routes/global_routes.dart';
import 'package:in_time_petition_demo/core/utils.dart';

class SignPetitionByEmailScreen extends StatelessWidget {
  SignPetitionByEmailScreen({Key? key}) : super(key: key);

  final _formKey = GlobalKey<FormState>();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: SafeArea(
        child: GestureDetector(
          onTap: () {
            FocusManager.instance.primaryFocus?.unfocus();
          },
          child: Stack(
            children: [
              Container(
                child: Column(
                  mainAxisSize: MainAxisSize.min,
                  children: [
                    CustomAppbar(
                      title: "Be a volunteer",
                      padding: const EdgeInsets.symmetric(
                          horizontal: 20, vertical: 18),
                      trailing: Icons.close_rounded,
                      onTrailingTap: () {
                        Utils.mainNavigatorKey.currentState?.pop();
                      },
                    ),
                    const SizedBox(
                      height: 10,
                    ),
                    SingleChildScrollView(
                      physics: const BouncingScrollPhysics(),
                      child: Form(
                        key: _formKey,
                        child: Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              TextFormField(
                                validator: (value) =>
                                    value == "" ? "The field is empty" : null,
                                decoration:
                                    const InputDecoration(hintText: "Name"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) => validateEmail(value),
                                keyboardType: TextInputType.emailAddress,
                                decoration:
                                    const InputDecoration(hintText: "Email"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value == "" ? "The field is empty" : null,
                                decoration:
                                    const InputDecoration(hintText: "Country"),
                              ),
                              const SizedBox(
                                height: 20,
                              ),
                              TextFormField(
                                validator: (value) =>
                                    value == "" ? "The field is empty" : null,
                                keyboardType: TextInputType.multiline,
                                maxLines: null,
                                decoration:
                                    const InputDecoration(hintText: "Message"),
                              ),
                            ],
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(
                      height: 80,
                    ),
                  ],
                ),
              ),
              Positioned(
                left: 20,
                right: 20,
                bottom: MediaQuery.of(context).viewInsets.bottom + 20,
                child: AnimatedButton(
                  onTap: () {
                    if (_formKey.currentState?.validate() ?? false) {
                      Utils.mainNavigatorKey.currentState
                          ?.pushNamed(GlobalRoutes.thanksScreen);
                    }
                  },
                  child: Container(
                    padding: const EdgeInsets.all(12),
                    decoration: BoxDecoration(
                      borderRadius: BorderRadius.circular(100),
                      color: Utils.accentColor,
                      // boxShadow: [
                      //   BoxShadow(
                      //     color: Colors.grey.withOpacity(0.3),
                      //     spreadRadius: 3,
                      //     blurRadius: 10,
                      //   ),
                      // ],
                    ),
                    child: const Center(
                      child: Text(
                        "Send",
                        style: TextStyle(
                            color: Colors.white,
                            fontWeight: FontWeight.w600,
                            fontSize: 16),
                      ),
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String? validateEmail(String? value) {
    String pattern =
        r"^[a-zA-Z0-9.!#$%&'*+/=?^_`{|}~-]+@[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?(?:\.[a-zA-Z0-9](?:[a-zA-Z0-9-]"
        r"{0,253}[a-zA-Z0-9])?)*$";
    RegExp regex = RegExp(pattern);
    if (value == null || value.isEmpty || !regex.hasMatch(value))
      return 'Enter a valid email address';
    else
      return null;
  }
}
