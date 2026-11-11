class LoginViewmodel {

  // E-mail: obrigatório, no formato nome@dominio.com
  String? validateEmail(String? value) {
    final email = value?.trim() ?? '';
    if (email.isEmpty) return 'Informe o seu e-mail';

    final emailRegex = RegExp(r'^[\w.+-]+@[\w-]+\.[\w.]+$');
    if (!emailRegex.hasMatch(email)) return 'E-mail inválido';
    return null;
  }

  // Senha: no login, só precisa estar preenchida
  String? validatePassword(String? value) {
    if (value == null || value.isEmpty) return 'Informe a sua senha';
    return null;
  }

  Future<String?> login({
    required String email,
    required String password,
  }) async {
    // mock: simula o tempo de uma chamada ao servidor
    await Future.delayed(const Duration(seconds: 2));

    return null; // null = deu certo
  }
}