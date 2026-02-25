import 'dart:io';

void agregarProducto(List<Map<String, dynamic>> productos) {
  stdout.write("Nombre del producto: ");
  String nombre = stdin.readLineSync()?.trim() ?? '';

  Map<String, dynamic>? productoExistente = productos.firstWhere(
      (p) => p['nombre'].toLowerCase() == nombre.toLowerCase(),
      orElse: () => {});
  
  if (productoExistente.isNotEmpty) {
    stdout.write("El producto ya existe. Ingrese la cantidad a sumar: ");
    int cantidad = int.tryParse(stdin.readLineSync() ?? '') ?? 0;
    productoExistente['cantidad'] += cantidad;
    print("Cantidad actualizada. Ahora hay ${productoExistente['cantidad']} unidades.");
    return;
  }

  stdout.write("Precio del producto: ");
  double precio = double.tryParse(stdin.readLineSync() ?? '') ?? 0;

  stdout.write("Cantidad disponible: ");
  int cantidad = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

  if (nombre.isEmpty || precio <= 0 || cantidad <= 0) {
    print("Datos inválidos. No se agregó el producto.");
    return;
  }

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
        "${i + 1}. ${productos[i]['nombre']} - \$${productos[i]['precio']} - Cantidad: ${productos[i]['cantidad']}");
  }
}