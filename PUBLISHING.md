# Guía de Publicación en Packagist.org

Esta guía te ayudará a publicar el módulo **kalicr/magento2-helloworld** en Packagist.org para que pueda ser instalado vía Composer desde cualquier proyecto.

## 📋 Requisitos Previos

1. **Cuenta en GitHub** - [https://github.com](https://github.com)
2. **Cuenta en Packagist** - [https://packagist.org](https://packagist.org)
3. **Git instalado** en tu sistema
4. **Repositorio funcional** del módulo

---

## 🚀 Paso 1: Crear Repositorio en GitHub

### 1.1 Crear Nuevo Repositorio

1. Ve a GitHub: [https://github.com/new](https://github.com/new)
2. Nombre del repositorio: `kalicr-magento2-helloworld`
3. Descripción: "A simple Hello World module for Magento 2"
4. Selecciona **Público** (Packagist requiere repositorios públicos)
5. **NO** inicialices con README (ya lo tenemos)
6. Click en **"Create repository"**

### 1.2 Subir el Código

```bash
# Navega al directorio del módulo
cd /home/david/Documentos/proyecto-propio/kalicr-magento2-helloworld

# Inicializa Git
git init

# Añade todos los archivos
git add .

# Commit inicial
git commit -m "Initial release v1.0.0 - Kalicr HelloWorld Module for Magento 2"

# Añade el repositorio remoto (reemplaza 'TU_USUARIO' con tu usuario de GitHub)
git remote add origin https://github.com/gamta/kalicr-magento2-helloworld

# Sube el código
git push -u origin master
```

### 1.3 Crear Tag de Versión

Los tags son importantes para que Composer pueda identificar las versiones:

```bash
# Crea un tag para la versión 1.0.0
git tag -a 1.0.0 -m "Release version 1.0.0"

# Sube el tag
git push origin 1.0.0
```

---

## 📦 Paso 2: Registrar en Packagist

### 2.1 Crear Cuenta en Packagist

1. Ve a [https://packagist.org](https://packagist.org)
2. Click en **"Sign in with GitHub"**
3. Autoriza Packagist para acceder a tu cuenta de GitHub
4. Completa tu perfil

### 2.2 Enviar el Paquete

1. En Packagist, click en **"Submit"** (esquina superior derecha)
2. Pega la URL de tu repositorio:
   ```
   https://github.com/gamta/kalicr-magento2-helloworld
   ```
3. Click en **"Check"** para validar
4. Si todo está correcto, click en **"Submit"**

### 2.3 Configurar Auto-Update (Webhook)

Para que Packagist se actualice automáticamente cuando hagas cambios:

1. En Packagist, ve a tu paquete
2. Click en el botón **"Settings"**
3. Copia la URL del webhook
4. Ve a GitHub → Tu Repositorio → **Settings** → **Webhooks** → **Add webhook**
5. Pega la URL del webhook de Packagist
6. Content type: **application/json**
7. Selecciona: **"Just the push event"**
8. Click en **"Add webhook"**

---

## ✅ Paso 3: Verificar la Publicación

### 3.1 Buscar el Paquete

1. Ve a [https://packagist.org](https://packagist.org)
2. Busca: `kalicr/magento2-helloworld`
3. Deberías ver tu paquete listado

### 3.2 Probar la Instalación

En cualquier proyecto Magento 2:

```bash
composer require kalicr/magento2-helloworld
```

Si todo funciona, ¡felicitaciones! Tu módulo está publicado.

---

## 🔄 Paso 4: Publicar Actualizaciones

### 4.1 Hacer Cambios

```bash
# Haz tus cambios en el código
# ...

# Añade los cambios
git add .

# Commit
git commit -m "Fix: Descripción del cambio"

# Sube los cambios
git push origin main
```

### 4.2 Crear Nueva Versión

```bash
# Actualiza el CHANGELOG.md con los cambios
# Actualiza la versión en composer.json si es necesario

# Crea un nuevo tag (por ejemplo, para versión 1.0.1)
git tag -a 1.0.1 -m "Release version 1.0.1 - Bug fixes"

# Sube el tag
git push origin 1.0.1
```

Packagist detectará automáticamente el nuevo tag (si configuraste el webhook).

---

## 📝 Buenas Prácticas

### Versionado Semántico

Usa [Semantic Versioning](https://semver.org/):

- **MAJOR** (1.x.x): Cambios incompatibles con versiones anteriores
- **MINOR** (x.1.x): Nueva funcionalidad compatible
- **PATCH** (x.x.1): Correcciones de bugs

Ejemplos:
- `1.0.0` → Primera versión estable
- `1.0.1` → Bug fix
- `1.1.0` → Nueva característica
- `2.0.0` → Cambio mayor (breaking change)

### Mantener CHANGELOG.md

Documenta todos los cambios en `CHANGELOG.md`:

```markdown
## [1.0.1] - 2025-12-08

### Fixed
- Corregido problema con CSS en móviles

### Added
- Nuevo método para obtener información del usuario
```

### Badges en README

Añade badges para mostrar información importante:

```markdown
![Packagist Version](https://img.shields.io/packagist/v/kalicr/magento2-helloworld)
![Packagist Downloads](https://img.shields.io/packagist/dt/kalicr/magento2-helloworld)
![GitHub Stars](https://img.shields.io/github/stars/TU_USUARIO/kalicr-magento2-helloworld)
```

---

## 🔍 Troubleshooting

### Problema: "Package not found"

**Solución:**
- Verifica que el repositorio sea público
- Verifica que el `composer.json` sea válido
- Espera unos minutos y vuelve a intentar

### Problema: "Invalid composer.json"

**Solución:**
- Valida el JSON en [jsonlint.com](https://jsonlint.com/)
- Verifica el `type: "magento2-module"`
- Verifica el nombre: `"kalicr/magento2-helloworld"`

### Problema: "Version not updating"

**Solución:**
- Verifica que el webhook esté configurado
- Manualmente actualiza en Packagist: Click en "Update"
- Verifica que los tags estén pusheados a GitHub

---

## 📞 Recursos Adicionales

- [Packagist Documentation](https://packagist.org/about)
- [Composer Documentation](https://getcomposer.org/doc/)
- [Magento Composer Documentation](https://devdocs.magento.com/guides/v2.4/extension-dev-guide/build/composer-integration.html)
- [Semantic Versioning](https://semver.org/)
- [Keep a Changelog](https://keepachangelog.com/)

---

## ✨ Checklist Final

Antes de publicar, verifica:

- [ ] `composer.json` es válido y tiene toda la información necesaria
- [ ] Existe un archivo `LICENSE`
- [ ] `README.md` está completo con instrucciones de instalación
- [ ] `CHANGELOG.md` documenta la versión actual
- [ ] `.gitignore` excluye archivos innecesarios
- [ ] El código funciona correctamente en Magento 2
- [ ] Has creado un tag de versión (ej: 1.0.0)
- [ ] El repositorio en GitHub es público
- [ ] Has probado la instalación vía Composer

---

## 🎉 ¡Listo!

Una vez completados estos pasos, tu módulo estará disponible públicamente en Packagist y cualquier persona podrá instalarlo usando:

```bash
composer require kalicr/magento2-helloworld
```

**¡Felicitaciones por tu primera publicación en Packagist!** 🚀

---

_Creado por David Gamboa - Kalicr © 2025_
