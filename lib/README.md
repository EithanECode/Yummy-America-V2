# Yummy America - Estructura del Proyecto

## Descripción

Aplicación de transporte de pasajeros desarrollada con Flutter, enfocada en la experiencia del usuario con prioridad en seguridad, eficiencia e interfaz intuitiva.

## Estructura de Carpetas

### 📁 `core/`

Contiene la configuración base y componentes centrales de la aplicación.

#### `config/`

- `app_config.dart` - Configuración general de la aplicación (API keys, URLs, etc.)

#### `routes/`

- `app_router.dart` - Sistema de navegación y rutas de la aplicación

#### `theme/`

- `app_colors.dart` - Paleta de colores de la aplicación
- `app_text_styles.dart` - Estilos de texto tipográficos
- `app_theme.dart` - Configuración de temas (claro/oscuro)

### 📁 `pages/`

Páginas principales de la aplicación.

- `splash_page.dart` - Pantalla de carga inicial
- `welcome_page.dart` - Pantalla de bienvenida
- `auth_hub_page.dart` - Hub de autenticación
- `login_page.dart` - Página de inicio de sesión
- `register_page.dart` - Página de registro
- `verification_page.dart` - Verificación de identidad (DNI + Facial)
- `map_page.dart` - Pantalla principal del mapa

### 📁 `widgets/`

Componentes reutilizables de la interfaz.

- `custom_button.dart` - Botón personalizado reutilizable
- `custom_text_field.dart` - Campo de texto personalizado

### 📁 `utils/`

Utilidades y helpers de la aplicación.

- `validators.dart` - Utilidades de validación de formularios

## Paleta de Colores

### Colores Principales

- **Azul** (`#2196F3`) - Elementos interactivos primarios
- **Negro** (`#000000`) - Fondos principales y contraste
- **Amarillo** (`#FFD700`) - Llamadas a acción clave
- **Blanco** (`#FFFFFF`) - Texto y elementos secundarios

### Colores de Estado

- **Error** (`#E53935`) - Errores y alertas
- **Éxito** (`#4CAF50`) - Confirmaciones exitosas
- **Advertencia** (`#FF9800`) - Advertencias
- **Info** (`#2196F3`) - Información

## Flujo de Navegación

1. **Splash Screen** → Pantalla de carga inicial (3 segundos)
2. **Welcome Screen** → Introducción con botones de registro/login
3. **Auth Hub** → Opciones de autenticación (Google, Email, Teléfono)
4. **Login/Register** → Formularios de autenticación
5. **Verification** → Verificación obligatoria de identidad
6. **Map** → Pantalla principal de la aplicación

## Principios de Diseño

### Código Limpio

- Separación de responsabilidades
- Componentes reutilizables
- Nomenclatura clara y descriptiva
- Documentación inline

### Arquitectura

- **Estructura simple** - Organización directa y fácil de navegar
- **Componentes modulares** - Widgets reutilizables
- **Escalabilidad** - Fácil de expandir cuando sea necesario

### UI/UX

- Diseño moderno y minimalista
- Consistencia visual
- Accesibilidad
- Feedback visual claro

## Tecnologías

- **Framework**: Flutter
- **Base de Datos**: Supabase (configurado)
- **Navegación**: Navigator 2.0
- **Estado**: StatefulWidget (por ahora)
- **Temas**: Material 3

## Próximos Pasos

1. Implementar gestión de estado (Provider/Riverpod)
2. Integrar Supabase para autenticación
3. Implementar funcionalidades de mapa
4. Agregar tests unitarios y de widgets
5. Configurar CI/CD
6. Implementar notificaciones push
7. Agregar funcionalidades de pago

## Comandos Útiles

```bash
# Ejecutar la aplicación
flutter run

# Limpiar y reconstruir
flutter clean && flutter pub get

# Generar código
flutter packages pub run build_runner build

# Ejecutar tests
flutter test
```
