#!/bin/bash

# Script para inicializar el repositorio Git y prepararlo para publicación
# Autor: David Gamboa - Kalicr
# Fecha: 2024-12-07

echo "🚀 Inicializando repositorio Git para Kalicr HelloWorld Module..."
echo ""

# Colores para output
GREEN='\033[0;32m'
BLUE='\033[0;34m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Verificar si Git está instalado
if ! command -v git &> /dev/null; then
    echo "❌ Git no está instalado. Por favor instala Git primero."
    exit 1
fi

# Obtener directorio actual
SCRIPT_DIR="$(cd "$(dirname "${BASH_SOURCE[0]}")" && pwd)"
cd "$SCRIPT_DIR"

echo -e "${BLUE}Directorio de trabajo: ${SCRIPT_DIR}${NC}"
echo ""

# Inicializar Git si no existe
if [ ! -d ".git" ]; then
    echo -e "${YELLOW}📦 Inicializando repositorio Git...${NC}"
    git init
    echo -e "${GREEN}✓ Repositorio Git inicializado${NC}"
else
    echo -e "${GREEN}✓ Repositorio Git ya existe${NC}"
fi
echo ""

# Configurar Git si es necesario
echo -e "${YELLOW}⚙️  Configurando Git...${NC}"
read -p "Ingresa tu nombre para Git (ej: David Gamboa): " git_name
read -p "Ingresa tu email para Git (ej: david@kalicr.com): " git_email

git config user.name "$git_name"
git config user.email "$git_email"
echo -e "${GREEN}✓ Configuración de Git completa${NC}"
echo ""

# Añadir todos los archivos
echo -e "${YELLOW}📝 Añadiendo archivos al staging...${NC}"
git add .
echo -e "${GREEN}✓ Archivos añadidos${NC}"
echo ""

# Crear commit inicial
echo -e "${YELLOW}💾 Creando commit inicial...${NC}"
git commit -m "Initial release v1.0.0

- Frontend route /helloworld implementation
- Custom block with helper methods
- Responsive template with modern design
- Complete Magento 2 module structure
- Documentation and installation guides
- MIT License
- Ready for Packagist publication"
echo -e "${GREEN}✓ Commit inicial creado${NC}"
echo ""

# Renombrar rama a main
echo -e "${YELLOW}🔀 Renombrando rama a 'main'...${NC}"
git branch -M main
echo -e "${GREEN}✓ Rama renombrada a 'main'${NC}"
echo ""

# Crear tag de versión
echo -e "${YELLOW}🏷️  Creando tag de versión 1.0.0...${NC}"
git tag -a 1.0.0 -m "Release version 1.0.0

First stable release of Kalicr HelloWorld Module for Magento 2.

Features:
- Frontend route with custom controller
- Beautiful gradient UI design
- Responsive CSS
- Complete documentation
- Composer support
- PSR-4 autoloading

Tested on: Magento 2.4.6-p10
PHP: 7.4, 8.1, 8.2"
echo -e "${GREEN}✓ Tag 1.0.0 creado${NC}"
echo ""

# Mostrar instrucciones para GitHub
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo -e "${GREEN}✅ ¡Repositorio Git inicializado correctamente!${NC}"
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${YELLOW}📋 Próximos pasos:${NC}"
echo ""
echo "1. Crea un repositorio en GitHub:"
echo "   https://github.com/new"
echo ""
echo "   Nombre: kalicr-magento2-helloworld"
echo "   Descripción: A simple Hello World module for Magento 2"
echo "   Público: ✓ (requerido para Packagist)"
echo "   NO inicialices con README"
echo ""
echo "2. Conecta tu repositorio local con GitHub:"
read -p "Ingresa la URL de tu repositorio GitHub (ej: https://github.com/usuario/kalicr-magento2-helloworld.git): " repo_url
echo ""
echo -e "${YELLOW}🔗 Añadiendo repositorio remoto...${NC}"
git remote add origin "$repo_url"
echo -e "${GREEN}✓ Repositorio remoto añadido${NC}"
echo ""

echo "3. Ejecuta estos comandos para subir tu código:"
echo ""
echo -e "${BLUE}   git push -u origin main${NC}"
echo -e "${BLUE}   git push origin 1.0.0${NC}"
echo ""
echo "4. Una vez en GitHub, ve a Packagist:"
echo "   https://packagist.org/packages/submit"
echo ""
echo "   Pega la URL de tu repositorio y haz click en 'Submit'"
echo ""
echo -e "${BLUE}━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━━${NC}"
echo ""
echo -e "${GREEN}📚 Consulta PUBLISHING.md para más detalles${NC}"
echo ""
echo -e "${GREEN}¡Buena suerte con tu publicación en Packagist! 🚀${NC}"
echo ""
