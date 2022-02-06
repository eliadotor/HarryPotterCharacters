#  HarryPotterCharacters
Proyecto para mostrar conceptos de arquiectura VIPER.

## Instalación:

Clonar el repositorio y ejecutar pod install en el directorio del proyecto.

## Explicación del proyecto:

El objetivo del proyecto es demostrar la adquisición de conocimientos sobre el correcto uso de la arquitectura VIPER, el correcto uso de la memoria, la persistencia de datos, el ajuste de la interfaz para distintos dispositivos y distintos tamaños de pantalla, la gestión de permisos y la tradución de la aplicación. 

Las pantallas se encuentran en el directorio Modules y cada una de ellas (por regla general) consta de los siguientes elementos:

* UI: ViewController y su Storyboard
* Presenter: Maneja la lógica de presentación, recibe datos de los interactos y se los pasa a la vista. A su vez, recibe la interacción con el usuario y las envia al wireframe para navegar por la aplicación.
* Interactor: Contiene la lógica de negocio según los datos recibidos de los providers.
* Wireframe: Se encarga de la lógica de navegación, tras la interacción del usuario.
* Builder: Gestionan las dependencias de las pantallas y genera el viewController a mostrar.
* Los provider se encargan de recibir los datos de la API o del sistema y de pasarselos al interactor.

Algunas de las pantallas comparten elementos entre sí y no cuentan con todos ellos de manera individual, debido a que esta estructura permite la reutilización completa de la lógica de presentación.

En cuanto a los modelos de datos se encuentran en la carpeta Models.

Por otro lado, en la carpeta Supporting files encontramos los localizables (EN/ES), asi como también las assets y los colores personalizados que se han usado para la aplicación.

InitialControllerBuilder es la clase encargada de mostrar el viewController inicial y de saber a qué pantallas se puede navegar y cómo hacerlo.




