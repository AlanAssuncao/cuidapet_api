// ignore_for_file: public_member_api_docs, sort_constructors_first
class User {
  final int? id;
  final String? email;
  final String? password;
  final String? registerType;
  final String? iosToken;
  final String? androidToken;
  final String? refreshToken;
  final String? socialKey;
  final String? imageAvatar;
  final int? supplierId;

  User({
    this.id,
    this.email,
    this.password,
    this.registerType,
    this.iosToken,
    this.androidToken,
    this.refreshToken,
    this.socialKey,
    this.imageAvatar,
    this.supplierId,
  });

  User copyWith({
    int? id,
    String? email,
    String? password,
    String? registerType,
    String? iosToken,
    String? androidToken,
    String? refreshToken,
    String? socialKey,
    String? imageAvatar,
    int? supplierId,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      password: password ?? this.password,
      registerType: registerType ?? this.registerType,
      iosToken: iosToken ?? this.iosToken,
      androidToken: androidToken ?? this.androidToken,
      refreshToken: refreshToken ?? this.refreshToken,
      socialKey: socialKey ?? this.socialKey,
      imageAvatar: imageAvatar ?? this.imageAvatar,
      supplierId: supplierId ?? this.supplierId,
    );
  }
}
