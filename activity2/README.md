# TAREA 2 | ANALIZANDO LAYOUTS 

- Uso de Scaffold.
- Uso de widgets visibles y de distribución.
- Extrcción de widgets a otras clases
- Uso de íconos, botones, texto y snackbars.
- Estilizado en widgets como contenedores, textos. 
- Uso de ListView y ListTile

## Lo que me costó más trabajo 
- Lo que más se me complicó en esta tarea fue el listado de 10 días para que se realizara de forma autómatica. El conocimiento de los widgets básicos como Row, Column, Container, Text, entre algunos otros, cada vez me permite desarrollar de forma más rápida, pero a medida que se van haciendo más complejos los layouts se requiere conocimiento de más widgets, en este caso hice uso de ListTile y ListView, por lo que esta fue la parte más complicada, que hubiera una función devolviendo un listTile iterando 10 veces para lograr los registros. 

## Lo que aprendí 

Aprendí a hacer uso del widget ListTile, exploré más estilos, ya no solo en el widget de Texto, sino ahora para los contenedores, como fondos, bordes, paddings, etc., y también descubrí la opción del snackbar para que se muestre y oculte inmediatamente sin necesidad de completar los segundos establecidos de duración. 

## Screenshots 

https://github.com/Kuryvc/MobileApps/assets/90404985/c78fceab-9acc-4b1b-b4c3-a953326383e2

![activity2_1](https://github.com/Kuryvc/MobileApps/assets/90404985/91520b25-6876-4cd8-bf07-15af7f318285)

![activity2_2](https://github.com/Kuryvc/MobileApps/assets/90404985/81652eb6-6a95-45e3-93af-a4e5b0041aa9)

# OverFlow

Durante esta tarea me enfrenté a un error al estar generando y mostrando el ListView que contenía ListTiles, referente a que al viewport no se le había dado un tamaño fijo. Esto estaba ocurriendo ya que cada elemento que iba creando representaba un hijo de mi Contenedor principal, pero en este caso, el ListView, cuando viene el tiempo renderizarse, este widget pide al padre todo el espacio disponible posible, dejando sin campo a todos los demás, o incluso tendiendo al infinito. Por lo tanto, la solución fue ser lo más explícitio posible, encapsulando al ListView en un Expanded. 

## Referencias
“Widget catalog”. Flutter documentation | Flutter. Accedido el 27 de enero de 2024. [En línea]. Disponible: https://docs.flutter.dev/ui/widgets




