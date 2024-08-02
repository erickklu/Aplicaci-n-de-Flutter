import 'package:flutter/material.dart';

class OrdenForm extends StatefulWidget {
  @override
  _OrdenPageState createState() => _OrdenPageState();
}

class _OrdenPageState extends State<OrdenForm> {
  final _formKey = GlobalKey<FormState>();
  final _clienteController = TextEditingController();
  final _telefonoController = TextEditingController();
  final _direccionController = TextEditingController();
  final _ubicacionController = TextEditingController();
  final _inicioController = TextEditingController();
  final _finalizacionController = TextEditingController();
  final _tecnicoController = TextEditingController();

  String? _estado;
  String? _motivoVisita;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        elevation: 0,
        leading: IconButton(
          icon: Icon(Icons.arrow_back, color: Colors.white),
          onPressed: () => Navigator.of(context).pop(),
        ),
      ),
      extendBodyBehindAppBar: true,
      body: Column(
        children: [
          Stack(
            children: [
              Image.network(
                'https://www.reparacioncomputadorasmiami.com/wp-content/uploads/2016/06/reparacion-de-computadoras-a-domicilio-2.jpg',
                height: 100,
                width: double.infinity,
                fit: BoxFit.cover,
              ),
              Container(
                height: 100,
                width: double.infinity,
                color: Colors.black54,
                child: Center(
                  child: Text(
                    'ORDEN DE TRABAJO',
                    style: TextStyle(
                      fontSize: 24,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Expanded(
            child: Padding(
              padding: const EdgeInsets.all(26.0),
              child: Form(
                key: _formKey,
                child: ListView(
                  children: [
                    DropdownButtonFormField<String>(
                      decoration: const InputDecoration(
                        labelText: 'Estado',
                        prefixIcon: Icon(Icons.flag),
                      ),
                      value: _estado,
                      onChanged: (String? newValue) {
                        setState(() {
                          _estado = newValue;
                        });
                      },
                      items: <String>['En curso', 'Finalizado']
                          .map<DropdownMenuItem<String>>((String value) {
                        return DropdownMenuItem<String>(
                          value: value,
                          child: Text(value),
                        );
                      }).toList(),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Seleccione un estado';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _clienteController,
                      decoration: const InputDecoration(
                        labelText: 'Nombre del Cliente',
                        prefixIcon: Icon(Icons.person),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese el nombre del cliente';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _telefonoController,
                      decoration: const InputDecoration(
                        labelText: 'Teléfono',
                        prefixIcon: Icon(Icons.phone),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese un teléfono';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    const Padding(
                      padding: EdgeInsets.only(top: 18.0),
                      child: Text('Motivo de la Visita:'),
                    ),
                    RadioListTile<String>(
                      title: const Text('Reparación'),
                      value: 'Reparación',
                      groupValue: _motivoVisita,
                      onChanged: (String? value) {
                        setState(() {
                          _motivoVisita = value;
                        });
                      },
                      secondary: const Icon(Icons.build),
                    ),
                    RadioListTile<String>(
                      title: const Text('Mantenimiento Preventivo'),
                      value: 'Mantenimiento Preventivo',
                      groupValue: _motivoVisita,
                      onChanged: (String? value) {
                        setState(() {
                          _motivoVisita = value;
                        });
                      },
                      secondary: const Icon(Icons.verified),
                    ),
                    RadioListTile<String>(
                      title: const Text('Mantenimiento Correctivo'),
                      value: 'Mantenimiento Correctivo',
                      groupValue: _motivoVisita,
                      onChanged: (String? value) {
                        setState(() {
                          _motivoVisita = value;
                        });
                      },
                      secondary: const Icon(Icons.build_circle),
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _direccionController,
                      decoration: const InputDecoration(
                        labelText: 'Dirección',
                        prefixIcon: Icon(Icons.location_on),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese una dirección';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _ubicacionController,
                      decoration: const InputDecoration(
                        labelText: 'Ubicación',
                        prefixIcon: Icon(Icons.map),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese una ubicación';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _inicioController,
                      decoration: const InputDecoration(
                        labelText: 'Fecha Prevista de Inicio',
                        prefixIcon: Icon(Icons.calendar_today),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese la fecha prevista de inicio';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _finalizacionController,
                      decoration: const InputDecoration(
                        labelText: 'Fecha de Finalización',
                        prefixIcon: Icon(Icons.calendar_today_outlined),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese la fecha de finalización';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    TextFormField(
                      controller: _tecnicoController,
                      decoration: const InputDecoration(
                        labelText: 'Técnico Asignado',
                        prefixIcon: Icon(Icons.person_outline),
                      ),
                      validator: (value) {
                        if (value == null || value.isEmpty) {
                          return 'Ingrese el nombre del técnico asignado';
                        }
                        return null;
                      },
                    ),
                    const SizedBox(height: 20),
                    ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        backgroundColor: Color.fromARGB(255, 7, 116, 67),
                        foregroundColor: Colors.white,
                      ),
                      onPressed: () {
                        if (_formKey.currentState!.validate()) {
                          ScaffoldMessenger.of(context).showSnackBar(
                            SnackBar(content: Text('Formulario válido')),
                          );
                        }
                      },
                      child: Text('Enviar'),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
