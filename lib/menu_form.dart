import 'package:flutter/material.dart';
import 'cliente_form.dart';
import 'orden_form.dart';
import 'encuesta_form.dart';
import 'localizacion_form.dart';
import 'inicio_menu.dart';

class MenuFormPage extends StatefulWidget {
  _MenuFormPageState createState() => _MenuFormPageState();
}

class _MenuFormPageState extends State<MenuFormPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Menu de opciones'),
      ),
      drawer: Drawer(
        backgroundColor: Color.fromARGB(255, 7, 116, 67),
        child: ListView(
          padding: EdgeInsets.zero,
          children: <Widget>[
            DrawerHeader(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: <Widget>[
                  CircleAvatar(
                    radius: 40,
                    backgroundImage:
                        AssetImage('assets/logo_famoso_starbucks.webp'),
                  ),
                  SizedBox(
                    height: 10,
                  ),
                  Text('Menu',
                      style: TextStyle(
                        color: Colors.white,
                        fontSize: 25,
                      ))
                ],
              ),
            ),
            ListTile(
              leading: Icon(Icons.home, color: Colors.white),
              title: Text(
                'Inicio',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
              },
            ),
            ListTile(
              leading: Icon(Icons.account_circle_rounded, color: Colors.white),
              title: Text(
                'Clientes',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => MyHomePage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.work, color: Colors.white),
              title: Text(
                'Orden Trabajo',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => OrdenForm()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.book, color: Colors.white),
              title: Text(
                'Encuestas',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => EncuestaPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.location_on, color: Colors.white),
              title: Text(
                'Localización',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(
                      builder: (context) => UbicacionActualPage()),
                );
              },
            ),
            ListTile(
              leading: Icon(Icons.exit_to_app, color: Colors.white),
              title: Text(
                'Cerrar Sesión',
                style: TextStyle(color: Colors.white),
              ),
              onTap: () {
                Navigator.pop(context);
                Navigator.push(
                  context,
                  MaterialPageRoute(builder: (context) => InicioFormPage()),
                );
              },
            )
          ],
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: ListView(
          children: [
            Image.asset(
              'assets/logo_famoso_starbucks.webp', // Asegúrate de tener la imagen en la carpeta assets
              height: 100,
            ),
            SizedBox(height: 16),
            Text(
              'Sobre Starbucks',
              style: TextStyle(
                  fontSize: 24,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 16),
            Text(
              'Starbucks es la cadena de cafeterías más grande del mundo, '
              'con más de 30,000 locales en más de 70 países. Fundada en 1971 '
              'en Seattle, Washington, Starbucks ha crecido para convertirse en '
              'una de las marcas más reconocidas a nivel global. '
              'Ofrecemos una variedad de productos de alta calidad que incluyen '
              'cafés especiales, tés, pasteles y más.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Misión',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              'Inspirar y nutrir el espíritu humano: una persona, una taza y una comunidad a la vez.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Valores',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              '• Crear una cultura de calidez y pertenencia, donde todos son bienvenidos.\n'
              '• Actuar con coraje, desafiando el status quo y encontrando nuevas formas de crecer nuestra empresa y a nosotros mismos.\n'
              '• Ser transparentes, dignos de confianza y cumplir con altos estándares de excelencia.\n'
              '• Ser responsables de conseguir resultados positivos a través de las acciones de todos los días.',
              style: TextStyle(fontSize: 16),
            ),
            SizedBox(height: 16),
            Text(
              'Contactar',
              style: TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
            SizedBox(height: 8),
            Text(
              'Si tienes alguna pregunta o necesitas más información, visita nuestra página web oficial o contacta con nosotros a través de nuestras redes sociales.',
              style: TextStyle(fontSize: 16),
            ),
          ],
        ),
      ),
    );
  }
}
