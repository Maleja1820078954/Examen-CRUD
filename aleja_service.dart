import 'dart:io';

void actualizarProducto(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print("No hay productos para actualizar.");
    return;
  }

  print("\n===== PRODUCTOS =====");
  for (int i = 0; i < productos.length; i++) {
    print("${i + 1}. ${productos[i]['nombre']} - Cantidad: ${productos[i]['cantidad']}");
  }

  int index;

  do {
    stdout.write("Número del producto a actualizar: ");
    index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (index <= 0 || index > productos.length) {
      print("Número inválido.");
    }
  } while (index <= 0 || index > productos.length);

  Map<String, dynamic> producto = productos[index - 1];

  // ===== NOMBRE OPCIONAL =====
  stdout.write("Nuevo nombre (${producto['nombre']}): ");
  String nuevoNombre = stdin.readLineSync()?.trim() ?? '';

  if (nuevoNombre.isNotEmpty) {
    producto['nombre'] = nuevoNombre;
  }

  // ===== PRECIO OPCIONAL =====
  stdout.write("Nuevo precio (${producto['precio']}): ");
  String inputPrecio = stdin.readLineSync() ?? '';

  if (inputPrecio.isNotEmpty) {
    double? nuevoPrecio = double.tryParse(inputPrecio);
    if (nuevoPrecio != null && nuevoPrecio > 0) {
      producto['precio'] = nuevoPrecio;
    } else {
      print("Precio inválido. Se mantiene el anterior.");
    }
  }

  // ===== CANTIDAD OPCIONAL =====
  stdout.write("Nueva cantidad (${producto['cantidad']}): ");
  String inputCantidad = stdin.readLineSync() ?? '';

  if (inputCantidad.isNotEmpty) {
    int? nuevaCantidad = int.tryParse(inputCantidad);
    if (nuevaCantidad != null && nuevaCantidad > 0) {
      producto['cantidad'] = nuevaCantidad;
    } else {
      print("Cantidad inválida. Se mantiene la anterior.");
    }
  }

  print("Producto actualizado correctamente.");
}

void eliminarProducto(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print("No hay productos para eliminar.");
    return;
  }

  print("\n===== PRODUCTOS =====");
  for (int i = 0; i < productos.length; i++) {
    print("${i + 1}. ${productos[i]['nombre']} - Cantidad: ${productos[i]['cantidad']}");
  }

  int index;

  do {
    stdout.write("Número del producto a eliminar: ");
    index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (index <= 0 || index > productos.length) {
      print("Número inválido.");
    }
  } while (index <= 0 || index > productos.length);

  productos.removeAt(index - 1);
  print("Producto eliminado correctamente.");
}