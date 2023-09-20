class signUpRequest {
  final String email;
  final String name;
  final String password;
  final String nickname;
  final String birthDate;
  final List<String> interestCategories;
  final String roles;

  signUpRequest(
      this.email,
      this.name,
      this.password,
      this.nickname,
      this.birthDate,
      this.interestCategories,
      this.roles,
      );

  Map<String, dynamic> toJson() {
    return {
      'email': email,
      'name': name,
      'password': password,
      'nickname': nickname,
      'birthDate': birthDate,
      'interestCategories': interestCategories,
      'roles': roles,
    };
  }
}
