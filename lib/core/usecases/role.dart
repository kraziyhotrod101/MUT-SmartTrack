enum UserRole { student, lecturer, admin }

class RoleManager {
  // Simulating a singleton or provider-based state for the current user's role
  static final RoleManager _instance = RoleManager._internal();

  factory RoleManager() {
    return _instance;
  }

  RoleManager._internal();

  // Default to student for now, can be changed via login logic
  UserRole _currentRole = UserRole.student;

  UserRole get currentRole => _currentRole;

  void setRole(UserRole role) {
    _currentRole = role;
  }

  bool get isStudent => _currentRole == UserRole.student;
  bool get isLecturer => _currentRole == UserRole.lecturer;
  bool get isAdmin => _currentRole == UserRole.admin;
}
