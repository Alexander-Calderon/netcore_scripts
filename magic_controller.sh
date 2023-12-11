#!/bin/bash

# Archivo de referencia
archivo_referencia="CargoController.cs"

# Reemplazo base  
reemplazo="Cargo"
reemplazo_pascal="${reemplazo^}"
reemplazo_singular="${reemplazo,,}"

# Array con los nuevos nombres y sus plurales
nombres=(
  "Cargo:Cargos" 
  "Cliente:Clientes"
  "Color:Colores"
  "Departamento:Departamentos"
  "DetalleOrden:DetallesOrdenes" 
  "DetalleVenta:DetallesVentas"
  "Empleado:Empleados"
  "Empresa:Empresas"
  "Estado:Estados"
  "FormaPago:FormasPagos"
  "Genero:Generos"
  "Insumo:Insumos"
  "Inventario:Inventarios"
  "InventarioTalla:InventariosTallas"
  "Municipio:Municipios"
  "Orden:Ordenes"
  "Pais:Paises"
  "Prenda:Prendas"
  "Proveedor:Proveedores"
  "Talla:Tallas"
  "TipoEstado:TiposEstados"
  "TipoPersona:TiposPersonas"
  "TipoProteccion:TiposProtecciones"
  "Venta:Ventas"
  "Usuario:Usuarios"
  "Rol:Roles"
)

# Obtener ruta y directorio
ruta_referencia="$(realpath "$archivo_referencia")"  
directorio="$(pwd)"

for entrada in "${nombres[@]}"
do
  # Separar nombre y plural
  IFS=: read -r nombre plural <<< "$entrada" 
  
  # Formatear nombre  
  nombre_singular="${nombre,,}"
  nombre_pascal="${nombre^}"

  # Crear archivo
  archivo="${directorio}/${nombre_pascal}Controller.cs"
  cp "$ruta_referencia" "$archivo"

  # Reemplazar  
  sed -i "s/${reemplazo}s/$plural/g" "$archivo"
  sed -i "s/$reemplazo_pascal/$nombre_pascal/g" "$archivo"
  sed -i "s/$reemplazo_singular/$nombre_singular/g" "$archivo"

done