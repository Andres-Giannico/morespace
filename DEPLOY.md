# Subir a GitHub y desplegar en Vercel

## 1. Crear el repositorio en GitHub

1. Entra en [github.com](https://github.com) y haz clic en **New repository**.
2. Nombre sugerido: `morespace`.
3. **No** marques "Add a README" (ya tienes uno).
4. Crea el repo y copia la URL (ej: `https://github.com/tu-usuario/morespace.git`).

## 2. Subir el código a GitHub

En la terminal, desde la carpeta del proyecto:

```bash
cd /Users/andresgiannico/Developer/Morespace

# Si aún no hiciste el primer commit (si sale error "trailer", usa la línea siguiente):
git add .
git commit -m "Initial commit"
# Alternativa si git commit falla con error "trailer":
# git -c core.hooksPath=/dev/null commit -m "Initial commit"

# Añadir el remoto (sustituye TU-USUARIO y NOMBRE-REPO por los tuyos)
git remote add origin https://github.com/TU-USUARIO/NOMBRE-REPO.git

# Subir (la primera vez)
git branch -M main
git push -u origin main
```

Si usas SSH:

```bash
git remote add origin git@github.com:TU-USUARIO/NOMBRE-REPO.git
git branch -M main
git push -u origin main
```

## 3. Conectar con Vercel

1. Entra en [vercel.com](https://vercel.com) e inicia sesión (con GitHub).
2. **Add New** → **Project**.
3. Importa el repositorio que acabas de subir.
4. Vercel detectará que es un sitio estático (HTML).
5. **Deploy** → en unos segundos tendrás una URL tipo `tu-proyecto.vercel.app`.

Cada vez que hagas `git push` a `main`, Vercel desplegará automáticamente.

## 4. SEO e indexación

El sitio incluye:
- **robots.txt**: Permite crawlers de Google, Bing, OpenAI (GPTBot, OAI-SearchBot) y otros.
- **sitemap.xml**: Lista todas las URLs para indexación.
- **Meta tags**: Open Graph, Twitter Card, canonical, hreflang (ES/EN).
- **JSON-LD**: Schema.org LocalBusiness y FAQPage para rich snippets.

**Si usas dominio propio** (ej: morespace.es), reemplaza `https://morespace.vercel.app` por tu URL en:
- `public/robots.txt` (línea Sitemap)
- `public/sitemap.xml` (todas las URLs)
- `public/index.html` y `public/en/index.html` (canonical, og:url, og:image, etc.)

**Para acelerar la indexación:**
1. [Google Search Console](https://search.google.com/search-console): añade la propiedad y envía el sitemap.
2. [Bing Webmaster Tools](https://www.bing.com/webmasters): igual.
