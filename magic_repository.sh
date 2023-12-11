#!/bin/bash

# Archivo original
original=ClienteRepository.cs

# Array con los nuevos nombres  
nombres=(
DetallePedido
Empleado
GamaProducto
Oficina
Pago
Pedido
Producto
)

# Palabra a reemplazar
reemplazo=Cliente

for nombre in "${nombres[@]}"
do
  # Duplicar el archivo original
  cp "$original" "${nombre}Repository.cs"

  # Reemplazar la palabra en el archivo duplicado
  sed -i "s/$reemplazo/$nombre/g" "${nombre}Repository.cs" 
done

