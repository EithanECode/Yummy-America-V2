import 'package:flutter/material.dart';
import '../core/routes/app_router.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';

class VerificationPage extends StatefulWidget {
  const VerificationPage({super.key});

  @override
  State<VerificationPage> createState() => _VerificationPageState();
}

class _VerificationPageState extends State<VerificationPage> {
  bool _dniUploaded = false;
  bool _facialVerificationCompleted = false;
  bool _isLoading = false;

  void _uploadDNI() async {
    setState(() {
      _isLoading = true;
    });

    // TODO: Implementar lógica de subida de DNI
    await Future.delayed(const Duration(seconds: 2));

    if (mounted) {
      setState(() {
        _dniUploaded = true;
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('DNI subido exitosamente'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  void _startFacialVerification() async {
    setState(() {
      _isLoading = true;
    });

    // TODO: Implementar lógica de verificación facial
    await Future.delayed(const Duration(seconds: 3));

    if (mounted) {
      setState(() {
        _facialVerificationCompleted = true;
        _isLoading = false;
      });

      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Verificación facial completada'),
          backgroundColor: AppColors.success,
        ),
      );
    }
  }

  void _completeVerification() {
    if (_dniUploaded && _facialVerificationCompleted) {
      AppRouter.navigateToAndClear(context, AppRouter.map);
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text('Debes completar ambos pasos de verificación'),
          backgroundColor: AppColors.error,
        ),
      );
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Verificación de Identidad'),
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
        automaticallyImplyLeading: false,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              const SizedBox(height: 20),

              // Título
              Text(
                'Verificación de Identidad',
                style: AppTextStyles.headline2.copyWith(
                  color: AppColors.textPrimary,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 8),

              Text(
                'Para tu seguridad, necesitamos verificar tu identidad',
                style: AppTextStyles.bodyLarge.copyWith(
                  color: AppColors.textSecondary,
                ),
              ),
              const SizedBox(height: 32),

              // Paso 1: Subida de DNI
              _buildVerificationStep(
                stepNumber: 1,
                title: 'Subir DNI',
                description: 'Toma una foto clara de tu documento de identidad',
                icon: Icons.credit_card,
                isCompleted: _dniUploaded,
                onTap: _uploadDNI,
                isLoading: _isLoading && !_dniUploaded,
              ),
              const SizedBox(height: 16),

              // Paso 2: Verificación facial
              _buildVerificationStep(
                stepNumber: 2,
                title: 'Verificación Facial',
                description:
                    'Realiza el reconocimiento facial para confirmar tu identidad',
                icon: Icons.face,
                isCompleted: _facialVerificationCompleted,
                onTap: _dniUploaded ? _startFacialVerification : null,
                isLoading: _isLoading && !_facialVerificationCompleted,
                isDisabled: !_dniUploaded,
              ),
              const SizedBox(height: 32),

              // Información adicional
              Container(
                padding: const EdgeInsets.all(16),
                decoration: BoxDecoration(
                  color: AppColors.blue.withValues(alpha: 0.1),
                  borderRadius: BorderRadius.circular(12),
                  border: Border.all(
                    color: AppColors.blue.withValues(alpha: 0.3),
                  ),
                ),
                child: Row(
                  children: [
                    Icon(Icons.security, color: AppColors.blue, size: 24),
                    const SizedBox(width: 12),
                    Expanded(
                      child: Text(
                        'Tu información está protegida y solo se usa para verificar tu identidad',
                        style: AppTextStyles.bodyMedium.copyWith(
                          color: AppColors.blue,
                        ),
                      ),
                    ),
                  ],
                ),
              ),

              const Spacer(),

              // Botón de continuar
              SizedBox(
                width: double.infinity,
                child: ElevatedButton(
                  onPressed: (_dniUploaded && _facialVerificationCompleted)
                      ? _completeVerification
                      : null,
                  style: ElevatedButton.styleFrom(
                    backgroundColor: AppColors.blue,
                    foregroundColor: AppColors.white,
                    padding: const EdgeInsets.symmetric(vertical: 16),
                    shape: RoundedRectangleBorder(
                      borderRadius: BorderRadius.circular(12),
                    ),
                  ),
                  child: Text('Continuar', style: AppTextStyles.buttonText),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget _buildVerificationStep({
    required int stepNumber,
    required String title,
    required String description,
    required IconData icon,
    required bool isCompleted,
    required VoidCallback? onTap,
    required bool isLoading,
    bool isDisabled = false,
  }) {
    return Container(
      decoration: BoxDecoration(
        color: isCompleted
            ? AppColors.success.withValues(alpha: 0.1)
            : AppColors.white,
        borderRadius: BorderRadius.circular(12),
        border: Border.all(
          color: isCompleted
              ? AppColors.success
              : isDisabled
              ? AppColors.borderLight
              : AppColors.blue,
          width: isCompleted ? 2 : 1,
        ),
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
          onTap: isDisabled ? null : onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Row(
              children: [
                // Número del paso
                Container(
                  width: 32,
                  height: 32,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.success
                        : isDisabled
                        ? AppColors.greyLight
                        : AppColors.blue,
                    borderRadius: BorderRadius.circular(16),
                  ),
                  child: Center(
                    child: isCompleted
                        ? const Icon(
                            Icons.check,
                            color: AppColors.white,
                            size: 20,
                          )
                        : Text(
                            stepNumber.toString(),
                            style: AppTextStyles.labelLarge.copyWith(
                              color: isDisabled
                                  ? AppColors.textLight
                                  : AppColors.white,
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                  ),
                ),
                const SizedBox(width: 16),

                // Icono
                Container(
                  width: 48,
                  height: 48,
                  decoration: BoxDecoration(
                    color: isCompleted
                        ? AppColors.success.withValues(alpha: 0.2)
                        : AppColors.blue.withValues(alpha: 0.1),
                    borderRadius: BorderRadius.circular(12),
                  ),
                  child: Icon(
                    icon,
                    color: isCompleted
                        ? AppColors.success
                        : isDisabled
                        ? AppColors.textLight
                        : AppColors.blue,
                    size: 24,
                  ),
                ),
                const SizedBox(width: 16),

                // Contenido
                Expanded(
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        title,
                        style: AppTextStyles.labelLarge.copyWith(
                          fontWeight: FontWeight.w600,
                          color: isDisabled
                              ? AppColors.textLight
                              : AppColors.textPrimary,
                        ),
                      ),
                      const SizedBox(height: 4),
                      Text(
                        description,
                        style: AppTextStyles.bodySmall.copyWith(
                          color: isDisabled
                              ? AppColors.textLight
                              : AppColors.textSecondary,
                        ),
                      ),
                    ],
                  ),
                ),

                // Indicador de estado
                if (isLoading)
                  const SizedBox(
                    width: 20,
                    height: 20,
                    child: CircularProgressIndicator(
                      strokeWidth: 2,
                      valueColor: AlwaysStoppedAnimation<Color>(AppColors.blue),
                    ),
                  )
                else if (!isCompleted && !isDisabled)
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
}
