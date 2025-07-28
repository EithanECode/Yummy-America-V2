import 'package:flutter/material.dart';
import '../core/theme/app_colors.dart';
import '../core/theme/app_text_styles.dart';
import 'phone_verification_page.dart';

class AddPhonePage extends StatefulWidget {
  const AddPhonePage({super.key});

  @override
  State<AddPhonePage> createState() => _AddPhonePageState();
}

class _AddPhonePageState extends State<AddPhonePage> {
  final _formKey = GlobalKey<FormState>();
  final _phoneController = TextEditingController();
  bool _isLoading = false;

  @override
  void dispose() {
    _phoneController.dispose();
    super.dispose();
  }

  void _handleAddPhone() async {
    if (_formKey.currentState!.validate()) {
      setState(() {
        _isLoading = true;
      });

      // TODO: Implementar envío de código SMS
      await Future.delayed(const Duration(seconds: 1));

      if (mounted) {
        setState(() {
          _isLoading = false;
        });

        // Navegar a verificación de teléfono
        Navigator.push(
          context,
          MaterialPageRoute(
            builder: (context) => PhoneVerificationPage(
              phoneNumber: _phoneController.text,
              isFromGoogle: true,
            ),
          ),
        );
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: AppColors.backgroundPrimary,
      appBar: AppBar(
        title: const Text('Agregar Teléfono'),
        backgroundColor: AppColors.backgroundPrimary,
        elevation: 0,
      ),
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                const SizedBox(height: 40),

                // Icono de éxito
                Center(
                  child: Container(
                    width: 80,
                    height: 80,
                    decoration: BoxDecoration(
                      color: AppColors.success.withValues(alpha: 0.1),
                      borderRadius: BorderRadius.circular(40),
                    ),
                    child: const Icon(
                      Icons.check_circle,
                      color: AppColors.success,
                      size: 40,
                    ),
                  ),
                ),
                const SizedBox(height: 32),

                // Título
                Text(
                  '¡Cuenta creada exitosamente!',
                  style: AppTextStyles.headline2.copyWith(
                    color: AppColors.textPrimary,
                    fontWeight: FontWeight.bold,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 16),

                Text(
                  'Ahora necesitamos verificar tu número de teléfono para completar tu registro.',
                  style: AppTextStyles.bodyLarge.copyWith(
                    color: AppColors.textSecondary,
                    height: 1.5,
                  ),
                  textAlign: TextAlign.center,
                ),
                const SizedBox(height: 48),

                // Campo de teléfono
                TextFormField(
                  controller: _phoneController,
                  keyboardType: TextInputType.phone,
                  decoration: const InputDecoration(
                    labelText: 'Número de teléfono',
                    hintText: '+1 234 567 8900',
                    prefixIcon: Icon(Icons.phone_outlined),
                    helperText: 'Te enviaremos un código de verificación',
                  ),
                  validator: (value) {
                    if (value == null || value.isEmpty) {
                      return 'Por favor ingresa tu número de teléfono';
                    }
                    if (value.length < 10) {
                      return 'El teléfono debe tener al menos 10 dígitos';
                    }
                    return null;
                  },
                ),
                const SizedBox(height: 32),

                // Botón de continuar
                SizedBox(
                  width: double.infinity,
                  child: ElevatedButton(
                    onPressed: _isLoading ? null : _handleAddPhone,
                    style: ElevatedButton.styleFrom(
                      backgroundColor: AppColors.blue,
                      foregroundColor: AppColors.white,
                      padding: const EdgeInsets.symmetric(vertical: 16),
                      shape: RoundedRectangleBorder(
                        borderRadius: BorderRadius.circular(12),
                      ),
                    ),
                    child: _isLoading
                        ? const SizedBox(
                            height: 20,
                            width: 20,
                            child: CircularProgressIndicator(
                              strokeWidth: 2,
                              valueColor: AlwaysStoppedAnimation<Color>(
                                AppColors.white,
                              ),
                            ),
                          )
                        : Text('Continuar', style: AppTextStyles.buttonText),
                  ),
                ),
                const SizedBox(height: 24),

                // Información adicional
                Container(
                  padding: const EdgeInsets.all(16),
                  decoration: BoxDecoration(
                    color: AppColors.backgroundSecondary,
                    borderRadius: BorderRadius.circular(12),
                    border: Border.all(color: AppColors.borderLight, width: 1),
                  ),
                  child: Row(
                    children: [
                      const Icon(
                        Icons.info_outline,
                        color: AppColors.info,
                        size: 20,
                      ),
                      const SizedBox(width: 12),
                      Expanded(
                        child: Text(
                          'Tu número de teléfono se usará para contactarte sobre tus viajes y para verificar tu identidad.',
                          style: AppTextStyles.bodySmall.copyWith(
                            color: AppColors.textSecondary,
                          ),
                        ),
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
        ),
      ),
    );
  }
}
