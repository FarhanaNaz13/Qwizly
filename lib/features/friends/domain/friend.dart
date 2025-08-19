class Friend {
  final String id;
  final String name;
  final String avatarUrl;
  final bool isConnected;

  Friend({
    required this.id,
    required this.name,
    required this.avatarUrl,
    this.isConnected = false,
  });
}
