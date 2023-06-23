import 'package:app_genesis/cliente.dart';
import 'package:flutter/material.dart';
import 'dart:convert';
import 'package:flutter/services.dart';
import 'carousel_page.dart';

class HomePage extends StatefulWidget {
  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  List<Cliente> clientes = [];

  @override
  void initState() {
    super.initState();
    _leerDatosTabla();
  }

  Future<void> _leerDatosTabla() async {
    try {
      String jsonData = await rootBundle.loadString('assets/data.json');
      if (jsonData != null) {
        Map<String, dynamic> jsonMap = json.decode(jsonData);
        List<dynamic> tabla = jsonMap['tablav'];

        List<Cliente> listaClientes = tabla.map((json) {
          return Cliente(
            nombre: json['NOMBRE_CLIENTE'],
            prestamo: double.parse(json['PRESTAMO']),
            dpi: json['DPI'],
            fud: json['FUD'],
          );
        }).toList();

        setState(() {
          clientes = listaClientes;
        });
      } else {
        print('Error: No se pudo leer el archivo JSON');
      }
    } catch (error) {
      print('Error al leer el archivo JSON: $error');
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Home'),
      ),
      body: Column(
        children: [
          CarouselPage(),
          DataTable(
            columns: [
              DataColumn(label: Text('NOMBRE')),
              DataColumn(label: Text('PRÉSTAMO')),
              DataColumn(label: Text('DPI')),
              DataColumn(label: Text('FUD')),
            ],
            rows: clientes.map((cliente) {
              return DataRow(cells: [
                DataCell(Text(cliente.nombre)),
                DataCell(Text(cliente.prestamo.toString())),
                DataCell(Text(cliente.dpi)),
                DataCell(Text(cliente.fud)),
              ]);
            }).toList(),
          ),
        ],
      ),
    );
  }
}
