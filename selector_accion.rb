def selector_acciones(precios)
  max_ganancia = 0
  dia_compra = 0
  dia_venta = 0

  # Iterar sobre los días de compra posibles
  precios.each_with_index do |precio_compra, indice_compra|
    # Iterar sobre los días de venta posibles (después del día de compra)
    precios[indice_compra + 1..-1].each_with_index do |precio_venta, indice_venta|
      # Calcular la ganancia potencial
      ganancia = precio_venta - precio_compra

      # Actualizar el mejor día de compra y venta si se encuentra una ganancia mayor
      if ganancia > max_ganancia
        max_ganancia = ganancia
        dia_compra = indice_compra
        dia_venta = indice_compra + indice_venta + 1
      end
    end
  end

  return [dia_compra, dia_venta]
end

# Ejemplo de uso
precios = [17, 3, 6, 9, 15, 8, 6, 1, 10]
resultado = selector_acciones(precios)
puts resultado.inspect
