import 'package:flutter/material.dart';
import 'package:flutter_firebase/productos.dart';
import 'serviciosPro.dart';

class lista_productos extends StatelessWidget {
  //  const lista_productos({super.key});

  final serviciosPro spro = serviciosPro();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text("Firestore"),
        ),
        body: StreamBuilder<List<Productos>>(
          stream: spro.listaProductos(),
          builder: ((context, snapshot) {
            if (!snapshot.hasData) {
              return CircularProgressIndicator();
            }
            List<Productos> pr = snapshot.data!;
            return ListView.builder(
                itemCount: pr.length,
                itemBuilder: ((context, index) {
                  Productos prod = pr[index];
                  return ListTile(
                    title: Text(prod.nombre),
                    subtitle: Text(prod.precio),
                    trailing: Checkbox(
                        value: prod.estado,
                        onChanged: ((value) {
                          spro.ediProducto(
                              prod.id, {'estado': value, 'nombre': 'jabon'});
                        })),
                    onLongPress: () {
                      print(prod.id);
                      spro.eliProducto(prod.id);
                    },
                  );
                }));
          }),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: (() {
            spro.crearProducto("ddd", "123000");
          }),
          child: Icon(Icons.add),
        ));
  }
}
