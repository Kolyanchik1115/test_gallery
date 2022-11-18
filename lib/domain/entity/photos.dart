class Photo {
  final String id;
  final String user;
  final String preview;
  final String full;

  const Photo({
    required this.id,
    required this.user,
    required this.preview,
    required this.full,
  });

  factory Photo.fromJson(Map<String, dynamic> json) {
    return Photo(
      id: json['id'],
      user: json['user']['name'],
      preview: json['urls']['thumb'],
      full: json['urls']['regular'],
    );
  }
}
