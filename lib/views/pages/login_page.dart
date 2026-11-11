import 'package:flutter/material.dart';
import 'package:guia_restaurantes/viewmodels/login_viewmodel.dart';
import 'package:guia_restaurantes/views/pages/sign_up_page.dart';

class LoginPage extends StatefulWidget {

  static const _ifoodRed = Color(0xFFEA1D2C);

  const LoginPage({
    super.key
  });

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {

  final _viewModel = LoginViewmodel();
  final _formKey = GlobalKey<FormState>();

  final _emailController = TextEditingController();
  final _passwordController = TextEditingController();

  bool _obscurePassword = true;
  bool _isLoading = false;

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<void> _submit() async {
    // 1. valida os campos
    final isValid = _formKey.currentState!.validate();
    if (!isValid) return;

    // 2. liga o carregamento
    setState(() {
      _isLoading = true;
    });

    // 3. pede o login ao ViewModel e espera a resposta
    final error = await _viewModel.login(
      email: _emailController.text,
      password: _passwordController.text,
    );

    // 4. se a tela foi fechada durante a espera, para aqui
    if (!mounted) return;

    setState(() {
      _isLoading = false;
    });

    // 5. erro: mostra a mensagem e fica na tela
    if (error != null) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(content: Text(error)),
      );
      return;
    }

    // 6. deu certo: avisa e volta para o Perfil
    ScaffoldMessenger.of(context).showSnackBar(
      const SnackBar(content: Text('Que bom te ver de novo!')),
    );
    Navigator.pop(context);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.white,
      appBar: AppBar(
        backgroundColor: Colors.white,
        title: const Text('Entrar'),
      ),
      body: SafeArea(
        child: SingleChildScrollView(
          padding: const EdgeInsets.all(16),
          child: Form(
            key: _formKey,
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.stretch,
              children: [
                _buildHeader(),
                const SizedBox(height: 24),

                _buildField(
                  label: 'E-mail',
                  icon: Icons.mail_outline,
                  keyboardType: TextInputType.emailAddress,
                  controller: _emailController,
                  validator: _viewModel.validateEmail,
                ),
                const SizedBox(height: 16),

                _buildField(
                  label: 'Senha',
                  icon: Icons.lock_outline,
                  obscureText: _obscurePassword,
                  controller: _passwordController,
                  validator: _viewModel.validatePassword,
                  suffixIcon: IconButton(
                    onPressed: () {
                      setState(() {
                        _obscurePassword = !_obscurePassword;
                      });
                    },
                    icon: Icon(
                      _obscurePassword ? Icons.visibility_off_outlined : Icons.visibility_outlined,
                    ),
                  ),
                ),

                _buildForgotPassword(),
                const SizedBox(height: 16),

                _buildSubmitButton(),
                const SizedBox(height: 8),

                _buildSignUpLink(),
              ],
            ),
          ),
        ),
      ),
    );
  }

  Widget _buildHeader() {
    return const Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Text(
          'Que bom te ver\nde novo!',
          style: TextStyle(fontSize: 22, fontWeight: FontWeight.w600),
        ),
        SizedBox(height: 8),
        Text(
          'Entre com o seu e-mail e a sua senha.',
          style: TextStyle(color: Colors.grey),
        ),
      ],
    );
  }

  Widget _buildField({required String label,
    required IconData icon,
    TextInputType keyboardType = TextInputType.text,
    bool obscureText = false,
    Widget? suffixIcon,
    String? Function(String?)? validator,
    TextEditingController? controller}) {

    return TextFormField(
      keyboardType: keyboardType,
      obscureText: obscureText,
      controller: controller,
      validator: validator,
      decoration: InputDecoration(
        labelText: label,
        prefixIcon: Icon(icon),
        suffixIcon: suffixIcon,
        border: OutlineInputBorder(borderRadius: BorderRadius.circular(10)),
        focusedBorder: OutlineInputBorder(
          borderRadius: BorderRadius.circular(10),
          borderSide: const BorderSide(color: LoginPage._ifoodRed, width: 2),
        ),
        floatingLabelStyle: const TextStyle(color: LoginPage._ifoodRed),
      ),
    );
  }

  Widget _buildForgotPassword() {
    return Align(
      alignment: Alignment.centerRight,
      child: TextButton(
        onPressed: () {
          // a seguir: tela de recuperação de senha
        },
        style: TextButton.styleFrom(foregroundColor: LoginPage._ifoodRed),
        child: const Text('Esqueci minha senha'),
      ),
    );
  }

  Widget _buildSubmitButton() {
    return ElevatedButton(
      onPressed: _isLoading ? null : _submit,
      style: ElevatedButton.styleFrom(
        backgroundColor: LoginPage._ifoodRed,
        foregroundColor: Colors.white,
        disabledBackgroundColor: LoginPage._ifoodRed.withValues(alpha: 0.6),
        padding: const EdgeInsets.symmetric(vertical: 16),
        shape: RoundedRectangleBorder(borderRadius: BorderRadius.circular(10)),
      ),
      child: _isLoading
          ? const SizedBox(
        height: 20,
        width: 20,
        child: CircularProgressIndicator(strokeWidth: 2, color: Colors.white),
      )
          : const Text(
        'Entrar',
        style: TextStyle(fontSize: 16, fontWeight: FontWeight.w600),
      ),
    );
  }

  Widget _buildSignUpLink() {
    return TextButton(
      onPressed: () {
        Navigator.pushReplacement(
          context,
          MaterialPageRoute(builder: (context) => const SignUpPage()),
        );
      },
      style: TextButton.styleFrom(foregroundColor: LoginPage._ifoodRed),
      child: const Text('Ainda não tenho conta'),
    );
  }
}