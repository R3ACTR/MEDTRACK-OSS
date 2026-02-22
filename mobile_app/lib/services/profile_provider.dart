import 'package:flutter/material.dart';
import '../models/dependent.dart';

class ProfileProvider with ChangeNotifier {
  // Mock data for caregivers
  final List<Dependent> _profiles = [
    Dependent(id: 'D001', name: 'Rajesh Kumar (Self)', relation: 'Self'),
    Dependent(id: 'D002', name: 'Aarav Kumar', relation: 'Son'),
    Dependent(id: 'D003', name: 'Meera Devi', relation: 'Mother'),
  ];

  Dependent? _activeProfile;

  ProfileProvider() {
    if (_profiles.isNotEmpty) {
      _activeProfile = _profiles.first;
    }
  }

  List<Dependent> get profiles => _profiles;
  Dependent? get activeProfile => _activeProfile;

  void setActiveProfile(String id) {
    try {
      _activeProfile = _profiles.firstWhere((p) => p.id == id);
      notifyListeners();
    } catch (e) {
      // Profile not found
    }
  }

  void addProfile(Dependent profile) {
    _profiles.add(profile);
    notifyListeners();
  }
}
