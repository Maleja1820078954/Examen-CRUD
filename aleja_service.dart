import 'dart:io';

void actualizarProducto(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print("No hay productos para actualizar.");
    return;
  }

  for (int i = 0; i < productos.length; i++) {
    print("${i + 1}. ${productos[i]['nombre']} - Cantidad: ${productos[i]['cantidad']}");
  }

  stdout.write("Número del producto a actualizar: ");
  int index = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (index > 0 && index <= productos.length) {
    Map<String, dynamic> producto = productos[index - 1];

    stdout.write("Nuevo nombre (${producto['nombre']}): ");
    String nuevoNombre = stdin.readLineSync()?.trim() ?? producto['nombre'];
    producto['nombre'] = nuevoNombre;

    stdout.write("Nuevo precio (${producto['precio']}): ");
    double nuevoPrecio = double.tryParse(stdin.readLineSync() ?? '') ?? producto['precio'];
    producto['precio'] = nuevoPrecio;

    stdout.write("Nueva cantidad (${producto['cantidad']}): ");
    int nuevaCantidad = int.tryParse(stdin.readLineSync() ?? '') ?? producto['cantidad'];
    producto['cantidad'] = nuevaCantidad;

    print("Producto actualizado correctamente.");
  } else {
    print("Número inválido.");
  }
}

void eliminarProducto(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print("No hay productos para eliminar.");
    return;
  }

  for (int i = 0; i < productos.length; i++) {
    print("${i + 1}. ${productos[i]['nombre']} - Cantidad: ${productos[i]['cantidad']}");
  }

  stdout.write("Número del producto a eliminar: ");
  int index = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (index > 0 && index <= productos.length) {
    productos.removeAt(index - 1);
    print("Producto eliminado correctamente.");
  } else {
    print("Número inválido.");
  }
}