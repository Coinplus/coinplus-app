class MapResult {
  final Map<String, dynamic> data;

  MapResult(this.data);

  factory MapResult.fromJson(Map<String, dynamic> json) => MapResult(json);

  Map<String, dynamic> toJson() => data;
}
