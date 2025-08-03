import 'package:flutter/material.dart';
import '../models/voting_option.dart';

class VoteController extends ChangeNotifier {
  static final VoteController _instance = VoteController._internal();
  factory VoteController() => _instance;
  VoteController._internal();

  final List<VotingOption> _options = [];
  int _votesReceived = 0;

  List<VotingOption> get options => _options;
  int get votesReceived => _votesReceived;

  void setOptions(List<String> labels) {
    _options.clear();
    _options.addAll(labels.map((e) => VotingOption(label: e)));
    _votesReceived = 0;
    notifyListeners();
  }

  void vote(String label) {
    final option = _options.firstWhere((o) => o.label == label, orElse: () => throw Exception('Opción no encontrada'));
    option.increment();
    _votesReceived++;
    notifyListeners();
  }

  void reset() {
    _options.clear();
    _votesReceived = 0;
    notifyListeners();
  }
}
