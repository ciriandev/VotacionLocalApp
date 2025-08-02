class VotingOption {
  final String label;
  int votes;

  VotingOption({required this.label, this.votes = 0});

  void increment() => votes++;

  // Para futuro: convertir a JSON si usamos sockets
  Map<String, dynamic> toJson() => {
        'label': label,
        'votes': votes,
      };

  factory VotingOption.fromJson(Map<String, dynamic> json) => VotingOption(
        label: json['label'],
        votes: json['votes'] ?? 0,
      );
}
