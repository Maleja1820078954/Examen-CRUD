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

  // ===== VALIDAR SELECCIÓN =====
  do {
    stdout.write("Número del producto a actualizar: ");
    index = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (index <= 0 || index > productos.length) {
      print("Número inválido.");
    }
  } while (index <= 0 || index > productos.length);

  Map<String, dynamic> producto = productos[index - 1];

  // ===== VALIDAR NUEVO NOMBRE =====
  String nuevoNombre;
  do {
    stdout.write("Nuevo nombre (${producto['nombre']}): ");
    nuevoNombre = stdin.readLineSync()?.trim() ?? '';

    if (nuevoNombre.isEmpty) {
      print("El nombre no puede estar vacío.");
    }
  } while (nuevoNombre.isEmpty);

  // ===== VALIDAR NUEVO PRECIO =====
  double nuevoPrecio;
  do {
    stdout.write("Nuevo precio (${producto['precio']}): ");
    nuevoPrecio = double.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (nuevoPrecio <= 0) {
      print("Ingrese un precio válido mayor a 0.");
    }
  } while (nuevoPrecio <= 0);

  // ===== VALIDAR NUEVA CANTIDAD =====
  int nuevaCantidad;
  do {
    stdout.write("Nueva cantidad (${producto['cantidad']}): ");
    nuevaCantidad = int.tryParse(stdin.readLineSync() ?? '') ?? -1;

    if (nuevaCantidad <= 0) {
      print("Ingrese una cantidad válida mayor a 0.");
    }
  } while (nuevaCantidad <= 0);

  producto['nombre'] = nuevoNombre;
  producto['precio'] = nuevoPrecio;
  producto['cantidad'] = nuevaCantidad;

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

  // ===== VALIDAR SELECCIÓN =====
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