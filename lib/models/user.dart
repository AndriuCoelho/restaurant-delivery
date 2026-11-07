class User {
  final String name;
  final String email;
  final String phone;
  final String password;

  // construtor da classe:
  const User({
    required this.name,
    required this.email,
    required this.phone,
    required this.password
  });

  // Método auxiliar, para converter um User em um Json (Map)
  Map<String, dynamic> toJson() {
    return {
      'name': name,
      'email': email,
      'phone': phone,
      'password': password
    };
  }
}