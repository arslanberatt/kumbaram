class AppCategory {
  final String? id;
  final String? name;
  final String? type;
  final String? icon;
  final bool? isSystem;
  final String? userId;
  final DateTime? createdAt;
  final DateTime? updateAt;

  AppCategory({
    this.id,
    this.name,
    this.type,
    this.icon,
    this.isSystem,
    this.userId,
    this.createdAt,
    this.updateAt,
  });

  factory AppCategory.fromJson(Map<String, dynamic> json) => AppCategory(
    id: json["id"],
    name: json["name"],
    type: json["type"],
    icon: json["icon"],
    isSystem: json["is_system"],
    userId: json["user_id"],
    createdAt: json["createdAt"] == null
        ? null
        : DateTime.parse(json["createdAt"]),
    updateAt: json["updateAt"] == null
        ? null
        : DateTime.parse(json["updateAt"]),
  );

  Map<String, dynamic> toJson() => {
    "id": id,
    "name": name,
    "type": type,
    "icon": icon,
    "is_system": isSystem,
    "user_id": userId,
    "createdAt": createdAt?.toIso8601String(),
    "updateAt": updateAt?.toIso8601String(),
  };
}
