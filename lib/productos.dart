
import 'package:cloud_firestore/cloud_firestore.dart';
class Productos{
 final String id;
 final String nombre;
 final String precio;
 final bool estado;



  Productos({
    required this.id,
    required this.nombre,
    required this.precio,
    required this.estado,
  });

  factory Productos.fromMap(DocumentSnapshot doc, Map<String, dynamic> dato){
     return Productos(
        id: doc.id,
        nombre: dato["nombre"] ?? '' , 
        precio: dato["precio"] ?? '' ,
        estado: dato["estado"] ?? false,
  );
  }
}