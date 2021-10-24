class GithubResponse {
  final int id;
  final String name;
  final String updatedAt;
  final String? ownerName;
  final String? description;
  final String? imageUrl;

  GithubResponse({
    required this.id,
    required this.name,
    required this.updatedAt,
    this.ownerName,
    this.description,
    this.imageUrl,
  });

  factory GithubResponse.fromMap(Map<String, dynamic> map) {
    return GithubResponse(
      id: map['id'] as int,
      name: map['name'] as String,
      updatedAt: map['updated_at'] as String,
      ownerName: map['owner']['login'] as String?,
      description: map['description'] as String?,
      imageUrl: map['owner']['avatar_url'] as String?,
    );
  }

  @override
  String toString() {
    return 'GithubResponse{id: $id, name: $name, updatedAt: $updatedAt, ownerName: $ownerName, description: $description, imageUrl: $imageUrl}';
  }
}
