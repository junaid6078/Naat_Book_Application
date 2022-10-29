class Kalam {
  final String type;
  final String subject;
  final String poet;
  final List<String> lines;

  Kalam({
    required this.type,
    required this.subject,
    required this.poet,
    required this.lines,
  });

  factory Kalam.fromJson(Map json) {
    return Kalam(
      type: json['type'],
      subject: json['subject'],
      poet: json['poet'],
      lines: (json['lines'] as List).map((e) => e.toString()).toList(),
    );
  }
}
