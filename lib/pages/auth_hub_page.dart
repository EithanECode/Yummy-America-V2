import 'package:flutter/material.dart';
import '../core/routes/app_router.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class AuthHubPage extends StatelessWidget {
  const AuthHubPage({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Autenticación'),
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              const SizedBox(height: 40),

              // Título
              Text(
                '¿Cómo quieres continuar?',
                style: AppTextStyles.headline3.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 16),

              Text(
                'Elige la opción que prefieras para acceder a tu cuenta',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
                textAlign: TextAlign.center,
              ),
              const SizedBox(height: 48),

              // Botón de Google
              _buildAuthButton(
                context: context,
                icon: Icons.g_mobiledata,
                title: 'Continuar con Google',
                subtitle: 'Acceso rápido y seguro',
                onPressed: () {
                  // TODO: Implementar autenticación con Google
                  _showComingSoon(context);
                },
              ),
              const SizedBox(height: 16),

              // Botón de Email
              _buildAuthButton(
                context: context,
                icon: Icons.email_outlined,
                title: 'Registrarse con Email',
                subtitle: 'Crear cuenta nueva',
                onPressed: () {
                  AppRouter.navigateTo(context, AppRouter.register);
                },
              ),
              const SizedBox(height: 16),

              // Botón de Teléfono
              _buildAuthButton(
                context: context,
                icon: Icons.phone_outlined,
                title: 'Registrarse con Teléfono',
                subtitle: 'Verificación por SMS',
                onPressed: () {
                  // TODO: Implementar registro con teléfono
                  _showComingSoon(context);
                },
              ),
              const SizedBox(height: 32),

              // Enlace para iniciar sesión
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Text(
                    '¿Ya tienes una cuenta? ',
                    style: AppTextStyles.bodyMedium.copyWith(
                      color: AppColors.textSecondary,
                    ),
                  ),
                  TextButton(
                    onPressed: () {
                      AppRouter.navigateTo(context, AppRouter.login);
                    },
                    child: Text(
                      'Iniciar Sesión',
                      style: AppTextStyles.buttonText.copyWith(
                        color: AppColors.blue,
                        fontSize: 14,
                      ),
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildAuthButton({
    required BuildContext context,
    required IconData icon,
    required String title,
    required String subtitle,
    required VoidCallback onPressed,
  }) {
    return Container(
      width: double.infinity,
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
          onTap: onPressed,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
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
                Icon(
                  Icons.arrow_forward_ios,
                  color: AppColors.textLight,
                  size: 16,
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
