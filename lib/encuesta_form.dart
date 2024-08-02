import 'package:flutter/material.dart';

class EncuestaPage extends StatefulWidget {
  _EncuestaPageState createState() => _EncuestaPageState();
}

class _EncuestaPageState extends State<EncuestaPage> {
  final _formKey = GlobalKey<FormState>();
  final _pregunta1Controller = TextEditingController();
  final _pregunta2Controller = TextEditingController();
  final _pregunta3Controller = TextEditingController();
  final _pregunta4Controller = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          centerTitle: true,
          title: Text(
            "Encuesta",
            style: TextStyle(color: Colors.white),
          ),
          backgroundColor: Color.fromARGB(255, 7, 116, 67),
          leading: IconButton(
              onPressed: () {
                Navigator.pop(context);
              },
              icon: Icon(Icons.arrow_back, color: Colors.white)),
          actionsIconTheme: IconThemeData(color: Colors.white),
        ),
        body: Padding(
          padding: const EdgeInsets.all(47.0),
          child: Form(
            key: _formKey,
            child: ListView(
              children: [
                TextFormField(
                  controller: _pregunta1Controller,
                  decoration: InputDecoration(
                      labelText: '¿Qué bebida prefieres en Starbucks?',
                      prefixIcon: Icon(Icons.question_answer)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, responde la pregunta 1';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _pregunta2Controller,
                  decoration: InputDecoration(
                      labelText: '¿Con qué frecuencia visitas Starbucks?',
                      prefixIcon: Icon(Icons.question_answer)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, responde la pregunta 2';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _pregunta3Controller,
                  decoration: InputDecoration(
                      labelText:
                          '¿Cuál es tu método de pago preferido en Starbucks?',
                      prefixIcon: Icon(Icons.question_answer)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, responde la pregunta 3';
                    }
                    return null;
                  },
                ),
                TextFormField(
                  controller: _pregunta4Controller,
                  decoration: InputDecoration(
                      labelText:
                          '¿Cuál es tu experiencia general con el servicio en Starbucks?',
                      prefixIcon: Icon(Icons.question_answer)),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor, responde la pregunta 4';
                    }
                    return null;
                  },
                ),
                SizedBox(
                  height: 20,
                ),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 7, 116, 67),
                        foregroundColor: Colors.white),
                    onPressed: () {
                      if (_formKey.currentState!.validate()) {
                        ScaffoldMessenger.of(context).showSnackBar(
                          SnackBar(content: Text('Encuesta enviada')),
                        );
                      }
                    },
                    child: Text('Enviar'))
              ],
            ),
          ),
        ));
  }
}
