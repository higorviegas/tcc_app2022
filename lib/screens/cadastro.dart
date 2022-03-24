import 'package:flutter/material.dart';
import '../utils/validate.dart';


class CadastroScreen extends StatelessWidget {
  const CadastroScreen({Key? key}) : super(key: key);

  static const String _title = 'Sample App';

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('TELA CADASTRO'),
      ),
      body: const MyStatefulCadastroWidget(),
    );
  }
}

class MyStatefulCadastroWidget extends StatefulWidget {
  const MyStatefulCadastroWidget({Key? key}) : super(key: key);

  @override
  State<MyStatefulCadastroWidget> createState() => _MyStatefulCadastroWidgetState();
}

class _MyStatefulCadastroWidgetState extends State<MyStatefulCadastroWidget> {
  TextEditingController firstnameController = TextEditingController();
  TextEditingController lastnameController = TextEditingController();
  TextEditingController telephoneController = TextEditingController();
  TextEditingController emailController = TextEditingController();
  TextEditingController addressController = TextEditingController();
  TextEditingController numberController = TextEditingController();
  TextEditingController districtController = TextEditingController();
  TextEditingController cityController = TextEditingController();
  TextEditingController countryController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Padding(
        padding: const EdgeInsets.all(10),
        child: ListView(
          children: <Widget>[
            Container(
                alignment: Alignment.center,
                padding: const EdgeInsets.all(10),
                child: const Text(
                  'Esqueceram de Mim',
                  style: TextStyle(
                      color: Colors.blue,
                      fontWeight: FontWeight.w500,
                      fontSize: 30),
                )),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: firstnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'PrimeiroNome',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: lastnameController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Sobrenome',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: telephoneController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Telefone',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: emailController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'E-mail',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: addressController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Endereço',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: numberController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Numero',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: districtController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Bairro',
                ),
              ),
            ),
            Container(
              padding: const EdgeInsets.all(10),
              child: TextFormField(
                controller: cityController,
                decoration: const InputDecoration(
                  border: OutlineInputBorder(),
                  labelText: 'Cidade',
                ),
              ),
            ),

            Container(
                height: 50,
                padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
                child: ElevatedButton(
                  child: const Text('Confirmar'),
                  onPressed: () {
                    Navigator.pushNamed(context, '/password');
                  },
                )
            ),
        ],
     ));
}

String? Function(String?)? idValidator = (String? value) {
  if (value!.isEmpty) {
    return 'Id Must be entered';
  } else {
    return int.tryParse(value) == null ? 'Id Must be number' : null;
  }
};
}