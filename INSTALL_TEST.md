# Guía de Instalación y Prueba del Módulo

Esta guía te ayudará a instalar y probar el módulo en tu proyecto Magento 2 actual.

## 📦 Opción 1: Instalación Local (Para Desarrollo)

### Paso 1: Copiar el Módulo

```bash
# Desde el directorio del proyecto Magento
cd /home/david/Documentos/proyecto-propio/Proyecto-v1

# Crear directorio del módulo
mkdir -p app/code/Kalicr/HelloWorld

# Copiar archivos del módulo
cp -r /home/david/Documentos/proyecto-propio/kalicr-magento2-helloworld/* app/code/Kalicr/HelloWorld/

# Remover archivos no necesarios para instalación local
rm -f app/code/Kalicr/HelloWorld/composer.json
rm -f app/code/Kalicr/HelloWorld/.gitignore
```

### Paso 2: Habilitar y Configurar

```bash
# Habilitar el módulo
php bin/magento module:enable Kalicr_HelloWorld

# Actualizar la base de datos
php bin/magento setup:upgrade

# Compilar código (modo producción)
php bin/magento setup:di:compile

# Desplegar contenido estático
php bin/magento setup:static-content:deploy -f es_ES en_US

# Limpiar caché
php bin/magento cache:flush
```

### Paso 3: Verificar Instalación

```bash
# Ver lista de módulos habilitados
php bin/magento module:status

# Deberías ver: Kalicr_HelloWorld
```

---

## 📦 Opción 2: Instalación vía Composer (Después de Publicar)

### Paso 1: Agregar Repositorio (Si es Privado)

Edita `composer.json` del proyecto principal y agrega:

```json
{
    "repositories": [
        {
            "type": "vcs",
            "url": "https://github.com/TU_USUARIO/kalicr-magento2-helloworld"
        }
    ]
}
```

### Paso 2: Instalar el Paquete

```bash
cd /home/david/Documentos/proyecto-propio/Proyecto-v1

# Instalar el módulo
composer require kalicr/magento2-helloworld

# Habilitar el módulo
php bin/magento module:enable Kalicr_HelloWorld

# Actualizar
php bin/magento setup:upgrade

# Compilar
php bin/magento setup:di:compile

# Desplegar estáticos
php bin/magento setup:static-content:deploy -f

# Limpiar caché
php bin/magento cache:flush
```

---

## 🧪 Probar el Módulo

### 1. Verificar que el Módulo está Habilitado

```bash
php bin/magento module:status Kalicr_HelloWorld
```

Deberías ver:
```
List of enabled modules:
Kalicr_HelloWorld
```

### 2. Acceder a la Página

Abre tu navegador y ve a:

```
http://localhost/helloworld
# o
https://tu-dominio.com/helloworld
```

Deberías ver una página con:
- Un header con gradiente morado/azul
- Mensaje "Welcome to Kalicr HelloWorld Module!"
- Información del módulo
- Fecha y hora actual
- Lista de características

### 3. Verificar Archivos Estáticos

Verifica que el CSS se cargue correctamente:

```
http://localhost/pub/static/frontend/[Theme]/[Locale]/Kalicr_HelloWorld/css/helloworld.css
```

### 4. Verificar en Modo Desarrollador

```bash
# Cambiar a modo desarrollador
php bin/magento deploy:mode:set developer

# Limpiar caché
php bin/magento cache:flush

# Visitar la página nuevamente
```

---

## 🔍 Debugging

### Si la Página No Carga (404)

```bash
# Regenerar URLs
php bin/magento setup:upgrade

# Limpiar todo el cache
rm -rf var/cache/* var/page_cache/* var/view_preprocessed/* pub/static/*

# Redesplegar
php bin/magento setup:static-content:deploy -f

# Limpiar cache
php bin/magento cache:flush
```

### Si el CSS No se Aplica

```bash
# Modo desarrollador: Los estáticos se generan on-demand
php bin/magento deploy:mode:set developer

# O forzar despliegue de estáticos
php bin/magento setup:static-content:deploy -f

# Verificar permisos
chmod -R 777 pub/static var
```

### Ver Logs de Errores

```bash
# Ver log del sistema
tail -f var/log/system.log

# Ver log de excepciones
tail -f var/log/exception.log

# Ver log de debug
tail -f var/log/debug.log
```

---

## 🛠️ Comandos Útiles

### Deshabilitar el Módulo

```bash
php bin/magento module:disable Kalicr_HelloWorld
php bin/magento setup:upgrade
php bin/magento cache:flush
```

### Re-habilitar el Módulo

```bash
php bin/magento module:enable Kalicr_HelloWorld
php bin/magento setup:upgrade
php bin/magento cache:flush
```

### Desinstalar el Módulo

```bash
# Si se instaló vía Composer
composer remove kalicr/magento2-helloworld

# O manualmente
php bin/magento module:uninstall Kalicr_HelloWorld

# O eliminar manualmente
rm -rf app/code/Kalicr/HelloWorld
php bin/magento setup:upgrade
```

---

## 📊 Checklist de Pruebas

- [ ] Módulo aparece en lista de módulos habilitados
- [ ] Página `/helloworld` es accesible
- [ ] Header con gradiente se muestra correctamente
- [ ] Mensaje de bienvenida se muestra
- [ ] Información del módulo es correcta (nombre, versión)
- [ ] Fecha y hora actual se muestran
- [ ] Lista de características se visualiza
- [ ] CSS está aplicado correctamente
- [ ] Página es responsive en móviles
- [ ] No hay errores en logs de Magento
- [ ] No hay errores en consola del navegador

---

## 🎨 Personalización para Pruebas

### Cambiar el Mensaje de Bienvenida

Edita: `app/code/Kalicr/HelloWorld/Block/HelloWorld.php`

```php
public function getWelcomeMessage()
{
    return __('¡Hola Mundo desde Kalicr!');
}
```

### Cambiar Colores del Gradiente

Edita: `app/code/Kalicr/HelloWorld/view/frontend/web/css/helloworld.css`

```css
.helloworld-header {
    background: linear-gradient(135deg, #f093fb 0%, #f5576c 100%);
}
```

Después de cualquier cambio:

```bash
php bin/magento cache:flush
# Si estás en modo producción:
php bin/magento setup:static-content:deploy -f
```

---

## ✅ Instalación Exitosa

Si todo funciona correctamente, deberías:

1. ✅ Ver el módulo en la lista de módulos habilitados
2. ✅ Acceder a `/helloworld` sin errores 404
3. ✅ Ver una página bien diseñada con gradientes
4. ✅ No tener errores en los logs
5. ✅ Ver el CSS aplicado correctamente

**¡Felicitaciones! El módulo está instalado y funcionando correctamente.** 🎉

---

## 📞 Soporte

Si encuentras problemas:

1. Verifica los logs: `var/log/system.log` y `var/log/exception.log`
2. Verifica permisos: `chmod -R 777 var pub/static`
3. Limpia todo el cache: `rm -rf var/cache/* var/page_cache/*`
4. Regenera código compilado: `php bin/magento setup:di:compile`

---

_Creado por David Gamboa - Kalicr © 2024_
