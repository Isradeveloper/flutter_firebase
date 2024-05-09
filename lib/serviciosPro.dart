import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase/productos.dart';

class serviciosPro {
  final FirebaseFirestore fs = FirebaseFirestore.instance;

  Future<void> crearProducto(String nombre, String precio) async {
    try {
      DocumentReference docRef = await FirebaseFirestore.instance
          .collection("productos")
          .add({'nombre': nombre, 'precio': precio, 'estado': true});
      String proID = docRef.id;
      print(proID);
    } catch (e) {
      print(" error $e");
    }
  }

  Future<void> eliProducto(String id) async {
    try {
      await fs.collection("productos").doc(id).delete();
    } catch (e) {
      print(" error $e");
    }
  }

  Future<void> ediProducto(String id, Map<String, dynamic> dato) async {
    try {
      await fs.collection("productos").doc(id).update(dato);
    } catch (e) {
      print(" error $e");
    }
  }

  Stream<List<Productos>> listaProductos() {
    return FirebaseFirestore.instance.collection("productos").snapshots().map(
        (snap) => snap.docs
            .map((doc) => Productos.fromMap(doc, doc.data()))
            .toList());
  }
}
