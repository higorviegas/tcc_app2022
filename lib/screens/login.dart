import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import '../utils/validate.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({Key? key}) : super(key: key);

  static const String _title = 'Flutter Code Sample';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Login Screen'),
      ),
      body: const MyStatefulLoginWidget(),
    );
  }
}

class MyStatefulLoginWidget extends StatefulWidget {
  const MyStatefulLoginWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulLoginWidget> createState() => _MyStatefulLoginWidgetState();
}

class _MyStatefulLoginWidgetState extends State<MyStatefulLoginWidget> {
  TextEditingController nameController = TextEditingController();
  TextEditingController passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Material(
      child: Center(
        child: Shortcuts(
          shortcuts: const <ShortcutActivator, Intent>{
            // Pressing space in the field will now move to the next field.
            SingleActivator(LogicalKeyboardKey.space): NextFocusIntent(),
          },
          child: FocusTraversalGroup(
            child: Form(
              autovalidateMode: AutovalidateMode.always,
              onChanged: () {
                Form.of(primaryFocus!.context!)!.save();
              },
              child: Wrap(
                children: <Widget>[
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: nameController,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Usuário',
                      ),
                      validator: (value) {
                        if (value == null || !(value.contains('@'))) {
                          return 'Informe um email valido';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                    padding: const EdgeInsets.all(10),
                    child: TextFormField(
                      controller: passwordController,
                      obscureText: true,
                      decoration: const InputDecoration(
                        border: OutlineInputBorder(),
                        labelText: 'Senha',
                      ),
                      validator: (value) {
                        if (value == null) {
                          return 'Informe uma senha';
                        }
                        return null;
                      },
                    ),
                  ),
                  Container(
                      height: 50,
                      padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                      child: ElevatedButton(
                        child: const Text('Entrar'),
                        onPressed: () {
                          (nameController.text != ""
                              && nameController.text.contains("@")
                              && passwordController.text != "" )
                          ? Navigator.pushNamed(context, '/second')
                          : showDialog<String>(
                            context: context,
                            builder: (BuildContext context) => AlertDialog(
                              title: const Text('Corrija os campos'),
                              content: const Text('Corrija os campos antes de prosseguir'),
                              actions: <Widget>[
                                TextButton(
                                  onPressed: () => Navigator.pop(context, 'OK'),
                                  child: const Text('OK'),
                                ),
                              ],
                            ),
                          );
                          print(nameController.text);
                          print(passwordController.text);
                        },
                      )
                  ),
                ]
                  // return Padding(
                  //   padding: const EdgeInsets.all(8.0),
                  //   child: ConstrainedBox(
                  //     constraints: BoxConstraints.tight(const Size(200, 50)),
                  //     child: TextFormField(
                  //       onSaved: (String? value) {
                  //         debugPrint(
                  //             'Value for field $index saved as "$value"');
                  //       },
                  //     ),
                  //   ),
                  // );
                ,
              ),
            ),
          ),
        ),
      ),
    );
  }
}
//
// value != null && !(value.contains('@'))
// ? "corrija o email"
// : email = value
