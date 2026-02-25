import 'dart:io';

void agregarProducto(List<Map<String, dynamic>> productos) {

  // ===== VALIDAR NOMBRE =====
  String nombre;
  do {
    stdout.write("Nombre del producto: ");
    nombre = stdin.readLineSync()?.trim() ?? '';
    if (nombre.isEmpty) {
      print("El nombre no puede estar vacío.");
    }
  } while (nombre.isEmpty);

  // ===== VERIFICAR SI YA EXISTE =====
  Map<String, dynamic>? productoExistente = productos.firstWhere(
    (p) => p['nombre'].toLowerCase() == nombre.toLowerCase(),
    orElse: () => {},
  );

  if (productoExistente.isNotEmpty) {
    int cantidadSumar;
    do {
      stdout.write("El producto ya existe. Ingrese la cantidad a sumar: ");
      cantidadSumar = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
      if (cantidadSumar <= 0) {
        print("Ingrese una cantidad válida mayor a 0.");
      }
    } while (cantidadSumar <= 0);

    productoExistente['cantidad'] += cantidadSumar;
    print("Cantidad actualizada. Ahora hay ${productoExistente['cantidad']} unidades.");
    return;
  }

  // ===== VALIDAR PRECIO =====
  double precio;
  do {
    stdout.write("Precio del producto: ");
    precio = double.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (precio <= 0) {
      print("Ingrese un precio válido mayor a 0.");
    }
  } while (precio <= 0);

  // ===== VALIDAR CANTIDAD =====
  int cantidad;
  do {
    stdout.write("Cantidad disponible: ");
    cantidad = int.tryParse(stdin.readLineSync() ?? '') ?? -1;
    if (cantidad <= 0) {
      print("Ingrese una cantidad válida mayor a 0.");
    }
  } while (cantidad <= 0);

  productos.add({
    'nombre': nombre,
    'precio': precio,
    'cantidad': cantidad,
  });

  print("Producto agregado correctamente.");
}

void listarProductos(List<Map<String, dynamic>> productos) {
  if (productos.isEmpty) {
    print("No hay productos.");
    return;
  }

  print("\n===== LISTA DE PRODUCTOS =====");

  for (int i = 0; i < productos.length; i++) {
    print(
      "${i + 1}. ${productos[i]['nombre']} - \$${productos[i]['precio']} - Cantidad: ${productos[i]['cantidad']}"
    );
  }
}