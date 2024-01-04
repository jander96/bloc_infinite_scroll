# Ejemplo de aplicación Flutter con arquitectura Bloc, DDD , Multimódulos, Programacion funcional, Environments, Inyeccion de dependencias,
Pagination

Este es un ejemplo de aplicación Flutter que utiliza la arquitectura Bloc, DDD y multimódulos. La aplicación se divide en 2 módulos.
No se trata de una app enfocada en UI sino en Arch y principalmente como podemos hacer uso de una libreria personal de paginacion de listados con Bloc

## Estructura del proyecto

El proyecto se divide en los siguientes módulos:

- `app`: Modulo principal que se encarga de contener las features, Actualmente una sola , encargada de mostrar un listado de personajes de Disney
- `network`: Este módulo contiene la capa de red. 

## Arquitectura

La aplicación utiliza la arquitectura Bloc para manejar el flujo de datos. Aprobechando el uso de la programacion funcional y enfoque DDD
La arquitectura de la aplicación se basa en los principios de Domain Driven Design (DDD). la capa `domain` contiene la lógica de negocio de la aplicación, define las interfaces que deben ser implementadas por la capa `data`.

## Licencia

Este proyecto está licenciado bajo la Licencia MIT. Consulta el archivo [LICENSE](LICENSE) para más detalles.
