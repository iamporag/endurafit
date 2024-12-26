
class UserModel {
  final String email;
  final String password;

  const UserModel({required this.email, required this.password});

  // Dummy user data
  static List<UserModel> dummyUsers = [
    const UserModel(email: 'test@example.com', password: 'password123'),
    const UserModel(email: 'user2@example.com', password: 'password2'),
  ];

  // Method to find user by email
  static UserModel? findByEmail(String email) {
    try {
      return dummyUsers.firstWhere((user) => user.email == email);
    } catch (e) {
      return null; // Return null if no user is found
    }
  }

}

