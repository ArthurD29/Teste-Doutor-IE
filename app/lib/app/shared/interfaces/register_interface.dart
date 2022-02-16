abstract class IRegister {
  /// Get all amenities or search.
  Future<String> sendRegisterData({
    Map<String, dynamic> registerData,
  });
}
