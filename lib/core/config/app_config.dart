class AppConfig {
  static const String appName = 'Yummy America';
  static const String appVersion = '1.0.0';
  static const String appDescription = 'Aplicación de transporte de pasajeros';

  // Configuración de API
  static const String apiBaseUrl = 'https://api.yummyamerica.com';
  static const int apiTimeout = 30000; // 30 segundos

  // Configuración de la aplicación
  static const bool enableAnalytics = true;
  static const bool enableCrashlytics = true;

  // Configuración de mapas
  static const String mapsApiKey = 'YOUR_MAPS_API_KEY';

  // Configuración de Supabase
  static const String supabaseUrl = 'YOUR_SUPABASE_URL';
  static const String supabaseAnonKey = 'YOUR_SUPABASE_ANON_KEY';
}
