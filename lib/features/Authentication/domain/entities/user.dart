/// User entity
/// Pure business object representing a user in the domain layer
class User {
  final String id;
  final String email;
  final String? name;
  final String? avatarUrl;
  final DateTime? createdAt;
  final DateTime? updatedAt;

  const User({
    required this.id,
    required this.email,
    this.name,
    this.avatarUrl,
    this.createdAt,
    this.updatedAt,
  });

  /// Creates a copy of this User with updated values
  User copyWith({
    String? id,
    String? email,
    String? name,
    String? avatarUrl,
    DateTime? createdAt,
    DateTime? updatedAt,
  }) {
    return User(
      id: id ?? this.id,
      email: email ?? this.email,
      name: name ?? this.name,
      avatarUrl: avatarUrl ?? this.avatarUrl,
      createdAt: createdAt ?? this.createdAt,
      updatedAt: updatedAt ?? this.updatedAt,
    );
  }

  @override
  bool operator ==(Object other) {
    if (identical(this, other)) return true;
    return other is User && other.id == id;
  }

  @override
  int get hashCode => id.hashCode;

  @override
  String toString() {
    return 'User(id: $id, email: $email, name: $name)';
  }
}
