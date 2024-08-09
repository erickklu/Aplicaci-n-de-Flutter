import 'package:flutter/material.dart';
import 'database_cuarto.dart';

class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _formKey = GlobalKey<FormState>();
  final _apellidoController = TextEditingController();
  final _nombreController = TextEditingController();
  final _correoController = TextEditingController();
  final _telefonoController = TextEditingController();

  String? _sexo;
  String? _estadocivil;

  late DatabaseCuarto _databaseCuarto;
  List<Map<String, dynamic>> _clients = [];

  @override
  void initState() {
    super.initState();
    _databaseCuarto = DatabaseCuarto();
    _loadClients();
  }

  void _loadClients() async {
    List<Map<String, dynamic>> clients = await _databaseCuarto.getClients();
    setState(() {
      _clients = clients;
    });
  }

  void _addClient() async {
    if (_formKey.currentState!.validate()) {
      Map<String, dynamic> client = {
        'apellido': _apellidoController.text,
        'nombre': _nombreController.text,
        'correo': _correoController.text,
        'telefono': _telefonoController.text,
        'sexo': _sexo,
        'estado_civil': _estadocivil,
      };
      await _databaseCuarto.insertClient(client);
      _loadClients();
      _formKey.currentState!.reset();
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: Text(
          "Formulario Clientes",
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
        child: Column(
          children: [
            Form(
              key: _formKey,
              child: Expanded(
                child: ListView(
                  children: [
                    TextFormField(
                      controller: _apellidoController,
                      decoration: InputDecoration(
                          labelText: 'Apellidos Completos',
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese Apellidos Completos';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _nombreController,
                      decoration: InputDecoration(
                          labelText: 'Nombres Completos',
                          prefixIcon: Icon(Icons.person)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese nombres completos';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _correoController,
                      decoration: InputDecoration(
                          labelText: 'Correo Electrónico',
                          prefixIcon: Icon(Icons.email)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un correo válido';
                        }
                        return null;
                      },
                    ),
                    TextFormField(
                      controller: _telefonoController,
                      decoration: InputDecoration(
                          labelText: 'Teléfono', prefixIcon: Icon(Icons.phone)),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un teléfono celular válido';
                        }
                        return null;
                      },
                    ),
                    Padding(
                      padding: const EdgeInsets.only(top: 18.0),
                      child: Text('Sexo:'),
                    ),
                    RadioListTile<String>(
                      title: const Text('Masculino'),
                      value: 'Masculino',
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        setState(() {
                          _sexo = value;
                        });
                      },
                      secondary: Icon(Icons.male),
                    ),
                    RadioListTile<String>(
                      title: const Text('Femenino'),
                      value: 'Femenino',
                      groupValue: _sexo,
                      onChanged: (String? value) {
                        setState(() {
                          _sexo = value;
                        });
                      },
                      secondary: Icon(Icons.female),
                    ),
                    DropdownButtonFormField<String>(
                      decoration: InputDecoration(
                          labelText: 'Estado Civil',
                          prefixIcon: Icon(Icons.family_restroom)),
                      value: _estadocivil,
                      onChanged: (String? newValue) {
                        setState(() {
                          _estadocivil = newValue;
                        });
                      },
                      items: <String>[
                        'Casado',
                        'Soltero',
                        'Divorciado',
                        'Viudo',
                        'Unión Libre'
                      ].map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Seleccione un estado civil';
                        }
                        return null;
                      },
                    ),
                    SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                          backgroundColor: Color.fromARGB(255, 7, 116, 67),
                          foregroundColor: Colors.white),
                      onPressed: _addClient,
                      child: Text('Enviar'),
                    ),
                  ],
                ),
              ),
            ),
            Container(
              height: 1.0,
              color: Colors.grey,
              margin: EdgeInsets.symmetric(vertical: 20.0),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: _clients.length,
                itemBuilder: (context, index) {
                  final client = _clients[index];
                  return ListTile(
                    title: Text(client['nombre'] + ' ' + client['apellido']),
                    subtitle: Text(
                        'Correo: ${client['correo']}\nTeléfono: ${client['telefono']}'),
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
