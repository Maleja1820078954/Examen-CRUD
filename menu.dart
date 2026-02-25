import 'dart:io';
import 'eimy_service.dart';
import 'aleja_service.dart';

void main() {
  List<Map<String, dynamic>> productos = [];
  bool salir = false;

  while (!salir) {
    print("\n===== MENÚ PRINCIPAL =====");
    print("1. Agregar producto");
    print("2. Listar productos");
    print("3. Actualizar producto");
    print("4. Eliminar producto");
    print("5. Salir");

    stdout.write("Seleccione una opción: ");
    int opcion = int.tryParse(stdin.readLineSync() ?? '') ?? 0;

    switch (opcion) {
      case 1:
        agregarProducto(productos); // Eimy
        break;
      case 2:
        listarProductos(productos); // Eimy
        break;
      case 3:
        actualizarProducto(productos); // Aleja
        break;
      case 4:
        eliminarProducto(productos); // Aleja
        break;
      case 5:
        print("Saliendo del programa...");
        salir = true;
        break;
      default:
        print("Opción inválida.");
    }
  }
}