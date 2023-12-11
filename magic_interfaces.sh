#!/bin/bash

# Archivo original
original=ICliente.cs

# Array con los nuevos nombres (nombres de entidades)
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
  cp "$original" "I${nombre}.cs"

  # Reemplazar la palabra en el archivo duplicado
  sed -i "s/$reemplazo/$nombre/g" "I${nombre}.cs" 
done


