# More Space

Web de More Space — empresa de trasteros en Ibiza.

## Estructura

- `index.html` — página principal (ES).
- `public/css/styles.css` — estilos (compartidos; clases neutras para ES/EN).
- `public/` — logo, imágenes y assets.

## Idiomas (futuro)

La web está preparada para una versión en inglés: el CSS usa solo clases neutras y no textos. Para añadir EN puedes usar una de estas opciones:

- **Opción A:** Crear `en/index.html` (copia de estructura con textos en inglés) y enlazar el mismo `../public/css/styles.css`.
- **Opción B:** Usar `lang` en `<html>` y sustituir textos por `data-i18n="key"` + un pequeño script que cargue traducciones según el idioma.

## Despliegue

- **Vercel**: Conecta este repositorio en [vercel.com](https://vercel.com) para despliegue automático.
