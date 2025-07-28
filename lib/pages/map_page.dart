import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class MapPage extends StatefulWidget {
  const MapPage({super.key});

  @override
  State<MapPage> createState() => _MapPageState();
}

class _MapPageState extends State<MapPage> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      body: SafeArea(
        child: Column(
          children: [
            // Header con barra de búsqueda
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, 2),
                  ),
                ],
              ),
              child: Column(
                children: [
                  // Barra de búsqueda
                  Container(
                    padding: const EdgeInsets.symmetric(
                      horizontal: 16,
                      vertical: 12,
                    ),
                    decoration: BoxDecoration(
                      color: AppColors.greyLight,
                      borderRadius: BorderRadius.circular(12),
                      border: Border.all(color: AppColors.borderLight),
                    ),
                    child: Row(
                      children: [
                        Icon(
                          Icons.search,
                          color: AppColors.textSecondary,
                          size: 20,
                        ),
                        const SizedBox(width: 12),
                        Expanded(
                          child: Text(
                            '¿A dónde vas?',
                            style: AppTextStyles.bodyMedium.copyWith(
                              color: AppColors.textSecondary,
                            ),
                          ),
                        ),
                        Icon(Icons.mic, color: AppColors.blue, size: 20),
                      ],
                    ),
                  ),
                  const SizedBox(height: 12),

                  // Botones de acción rápida
                  Row(
                    children: [
                      Expanded(
                        child: _buildQuickActionButton(
                          icon: Icons.home,
                          label: 'Casa',
                          onTap: () {
                            // TODO: Implementar navegación a casa
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildQuickActionButton(
                          icon: Icons.work,
                          label: 'Trabajo',
                          onTap: () {
                            // TODO: Implementar navegación al trabajo
                          },
                        ),
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: _buildQuickActionButton(
                          icon: Icons.favorite,
                          label: 'Favoritos',
                          onTap: () {
                            // TODO: Implementar navegación a favoritos
                          },
                        ),
                      ),
                    ],
                  ),
                ],
              ),
            ),

            // Área del mapa (placeholder)
            Expanded(
              child: Container(
                color: AppColors.greyLight,
                child: Center(
                  child: Column(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Icon(Icons.map, size: 80, color: AppColors.textLight),
                      const SizedBox(height: 16),
                      Text(
                        'Mapa de la aplicación',
                        style: AppTextStyles.headline4.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                      const SizedBox(height: 8),
                      Text(
                        'Aquí se mostrará el mapa interactivo',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.textLight,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),

            // Barra inferior con opciones
            Container(
              padding: const EdgeInsets.all(16),
              decoration: BoxDecoration(
                color: AppColors.white,
                boxShadow: [
                  BoxShadow(
                    color: AppColors.black.withValues(alpha: 0.05),
                    blurRadius: 10,
                    offset: const Offset(0, -2),
                  ),
                ],
              ),
              child: Row(
                children: [
                  Expanded(
                    child: _buildBottomActionButton(
                      icon: Icons.history,
                      label: 'Viajes',
                      onTap: () {
                        // TODO: Implementar historial de viajes
                      },
                    ),
                  ),
                  Expanded(
                    child: _buildBottomActionButton(
                      icon: Icons.person,
                      label: 'Perfil',
                      onTap: () {
                        // TODO: Implementar perfil de usuario
                      },
                    ),
                  ),
                  Expanded(
                    child: _buildBottomActionButton(
                      icon: Icons.support_agent,
                      label: 'Soporte',
                      onTap: () {
                        // TODO: Implementar soporte
                      },
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          // TODO: Implementar solicitud de viaje
          _showRideRequestDialog(context);
        },
        backgroundColor: AppColors.blue,
        foregroundColor: AppColors.white,
        child: const Icon(Icons.local_taxi),
      ),
    );
  }

  Widget _buildQuickActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 12),
        decoration: BoxDecoration(
          color: AppColors.greyLight,
          borderRadius: BorderRadius.circular(8),
        ),
        child: Column(
          children: [
            Icon(icon, color: AppColors.blue, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  Widget _buildBottomActionButton({
    required IconData icon,
    required String label,
    required VoidCallback onTap,
  }) {
    return InkWell(
      onTap: onTap,
      borderRadius: BorderRadius.circular(8),
      child: Container(
        padding: const EdgeInsets.symmetric(vertical: 8),
        child: Column(
          children: [
            Icon(icon, color: AppColors.textSecondary, size: 24),
            const SizedBox(height: 4),
            Text(
              label,
              style: AppTextStyles.labelSmall.copyWith(
                color: AppColors.textSecondary,
              ),
            ),
          ],
        ),
      ),
    );
  }

  void _showRideRequestDialog(BuildContext context) {
    showModalBottomSheet(
      context: context,
      isScrollControlled: true,
      backgroundColor: Colors.transparent,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height * 0.7,
        decoration: const BoxDecoration(
          color: AppColors.white,
          borderRadius: BorderRadius.vertical(top: Radius.circular(20)),
        ),
        child: Padding(
          padding: const EdgeInsets.all(24),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              // Handle
              Center(
                child: Container(
                  width: 40,
                  height: 4,
                  decoration: BoxDecoration(
                    color: AppColors.greyMedium,
                    borderRadius: BorderRadius.circular(2),
                  ),
                ),
              ),
              const SizedBox(height: 24),

              // Título
              Text(
                'Solicitar Viaje',
                style: AppTextStyles.headline3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 16),

              // Opciones de viaje
              _buildRideOption(
                icon: Icons.local_taxi,
                title: 'Taxi Estándar',
                subtitle: 'Viaje económico y confiable',
                price: '\$15.00',
                onTap: () {
                  Navigator.pop(context);
                  _showComingSoon(context);
                },
              ),
              const SizedBox(height: 12),

              _buildRideOption(
                icon: Icons.directions_car,
                title: 'Auto Ejecutivo',
                subtitle: 'Mayor comodidad y espacio',
                price: '\$25.00',
                onTap: () {
                  Navigator.pop(context);
                  _showComingSoon(context);
                },
              ),
              const SizedBox(height: 12),

              _buildRideOption(
                icon: Icons.airport_shuttle,
                title: 'Van Compartida',
                subtitle: 'Ideal para grupos grandes',
                price: '\$35.00',
                onTap: () {
                  Navigator.pop(context);
                  _showComingSoon(context);
                },
              ),

              const Spacer(),

              // Botón de cancelar
              SizedBox(
                width: double.infinity,
                child: OutlinedButton(
                  onPressed: () {
                    Navigator.pop(context);
                  },
                  style: OutlinedButton.styleFrom(
                    foregroundColor: AppColors.textSecondary,
                    side: const BorderSide(color: AppColors.borderMedium),
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text(
                    'Cancelar',
                    style: AppTextStyles.buttonText.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildRideOption({
    required IconData icon,
    required String title,
    required String subtitle,
    required String price,
    required VoidCallback onTap,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(color: AppColors.borderLight),
        boxShadow: [
          BoxShadow(
            color: AppColors.black.withValues(alpha: 0.05),
            blurRadius: 10,
            offset: const Offset(0, 2),
          ),
        ],
      ),
      child: Material(
        color: Colors.transparent,
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16),
            child: Row(
              children: [
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: AppColors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(icon, color: AppColors.blue, size: 24),
                ),
                const SizedBox(width: 16),
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.labelLarge.copyWith(
                          fontWeight: FontWeight.w600,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        subtitle,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),
                Text(
                  price,
                  style: AppTextStyles.headline5.copyWith(
                    color: AppColors.blue,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }

  void _showComingSoon(BuildContext context) {
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(
        content: Text('Esta funcionalidad estará disponible pronto'),
        backgroundColor: AppColors.info,
      ),
    );
  }
}
