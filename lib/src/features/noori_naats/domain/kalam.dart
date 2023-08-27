class Kalam {
  final String type;
  final String typeEng;
  final String subject;
  final String poet;
  final List<String> lines;

  Kalam({
    required this.type,
    required this.typeEng,
    required this.subject,
    required this.poet,
    required this.lines,
  });

  factory Kalam.fromJson(Map json) {
    return Kalam(
      type: json['type'],
      typeEng: json['typeEng'],
      subject: json['subject'],
      poet: json['poet'],
      lines: (json['lines'] as List).map((e) => e.toString()).toList(),
    );
  }
}

class Hamd {
  final String type;
  final String typeEng;
  final String subject;
  final String poet;
  final List<String> lines;

  Hamd({
    required this.type,
    required this.typeEng,
    required this.subject,
    required this.poet,
    required this.lines,
  });

  factory Hamd.fromJson(Map json) {
    return Hamd(
      type: json['type'],
      typeEng: json['typeEng'],
      subject: json['subject'],
      poet: json['poet'],
      lines: (json['lines'] as List).map((e) => e.toString()).toList(),
    );
  }
}

class Naat {
  final String type;
  final String typeEng;
  final String subject;
  final String poet;
  final List<String> lines;

  Naat({
    required this.type,
    required this.typeEng,
    required this.subject,
    required this.poet,
    required this.lines,
  });

  factory Naat.fromJson(Map json) {
    return Naat(
      type: json['type'],
      typeEng: json['typeEng'],
      subject: json['subject'],
      poet: json['poet'],
      lines: (json['lines'] as List).map((e) => e.toString()).toList(),
    );
  }
}

class Manqabat {
  final String type;
  final String typeEng;
  final String subject;
  final String poet;
  final List<String> lines;

  Manqabat({
    required this.type,
    required this.typeEng,
    required this.subject,
    required this.poet,
    required this.lines,
  });

  factory Manqabat.fromJson(Map json) {
    return Manqabat(
      type: json['type'],
      typeEng: json['typeEng'],
      subject: json['subject'],
      poet: json['poet'],
      lines: (json['lines'] as List).map((e) => e.toString()).toList(),
    );
  }
}

class Salam {
  final String type;
  final String typeEng;
  final String subject;
  final String poet;
  final List<String> lines;

  Salam({
    required this.type,
    required this.typeEng,
    required this.subject,
    required this.poet,
    required this.lines,
  });

  factory Salam.fromJson(Map json) {
    return Salam(
      type: json['type'],
      typeEng: json['typeEng'],
      subject: json['subject'],
      poet: json['poet'],
      lines: (json['lines'] as List).map((e) => e.toString()).toList(),
    );
  }
}
