import 'package:flutter/material.dart';
import 'package:mobile_app/routes.dart';

import '../../models/medication.dart';
import 'package:mobile_app/features/medications/widgets/medication_card.dart';
import 'package:mobile_app/features/medications/widgets/medication_error_boundary.dart';
import 'package:mobile_app/features/medications/widgets/medication_skeleton.dart';

class MedicationsScreen extends StatefulWidget {
  const MedicationsScreen({super.key});
  static const String route = '/medications';

  @override
  State<MedicationsScreen> createState() => _MedicationsScreenState();
}

class _MedicationsScreenState extends State<MedicationsScreen> {
  // Mock medication data
  List<Medication> medications = [
    Medication(
      id: 1,
      name: 'Lisinopril',
      dosage: '10 mg',
      frequency: 'Once daily',
      frequencyWeekly: [true, true, true, true, true, true, true],
      purpose: 'Blood pressure control',
      icon: '💊',
      color: const Color(0xFFFF6B6B),
      nextDue: '2:00 PM',
      isActive: true,
    ),
    Medication(
      id: 2,
      name: 'Metformin',
      dosage: '500 mg',
      frequency: 'Twice daily',
      frequencyWeekly: [true, false, true, false, true, false, true],
      purpose: 'Diabetes management',
      icon: '💉',
      color: const Color(0xFF00B4D8),
      nextDue: '1:30 PM',
      isActive: true,
    ),
    Medication(
      id: 3,
      name: 'Atorvastatin',
      dosage: '20 mg',
      frequency: 'Once daily',
      frequencyWeekly: [true, true, true, true, true, true, true],
      purpose: 'Cholesterol control',
      icon: '⚕️',
      color: const Color(0xFF4CAF50),
      nextDue: '8:00 PM',
      isActive: true,
    ),
    Medication(
      id: 4,
      name: 'Aspirin',
      dosage: '81 mg',
      frequency: 'Once daily',
      frequencyWeekly: [true, true, true, true, true, true, true],
      purpose: 'Blood thinner',
      icon: '💊',
      color: const Color(0xFFFFC107),
      nextDue: 'Tomorrow 8:00 AM',
      isActive: false,
    ),
  ];

  String _filterValue = 'All';
  bool _isLoading = true;
  bool _hasError = false;

  @override
  void initState() {
    super.initState();
    _fetchMedications();
  }

  Future<void> _fetchMedications() async {
    setState(() {
      _isLoading = true;
      _hasError = false;
    });
    
    // Simulate network delay for skeleton loading
    await Future.delayed(const Duration(milliseconds: 1500));
    
    if (mounted) {
      setState(() {
        _isLoading = false;
      });
    }
  }

  @override
  Widget build(BuildContext context) {
    final filteredMeds = _filterValue == 'All'
        ? medications
        : _filterValue == 'Active'
            ? medications.where((m) => m.isActive).toList()
            : medications.where((m) => !m.isActive).toList();

    return Scaffold(
      appBar: AppBar(
        title: const Text('Medications'),
        elevation: 0,
      ),
      body: Column(
        children: [
          // Filter Chips
          Container(
            padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
            child: SingleChildScrollView(
              scrollDirection: Axis.horizontal,
              child: Row(
                children: [
                  _FilterChip(
                    label: 'All',
                    isActive: _filterValue == 'All',
                    onTap: () {
                      setState(() => _filterValue = 'All');
                    },
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Active',
                    isActive: _filterValue == 'Active',
                    onTap: () {
                      setState(() => _filterValue = 'Active');
                    },
                  ),
                  const SizedBox(width: 8),
                  _FilterChip(
                    label: 'Inactive',
                    isActive: _filterValue == 'Inactive',
                    onTap: () {
                      setState(() => _filterValue = 'Inactive');
                    },
                  ),
                ],
              ),
            ),
          ),
          // Medications List
          Expanded(
            child: MedicationErrorBoundary(
              hasError: _hasError,
              onRetry: _fetchMedications,
              child: _isLoading
                  ? ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: 4,
                      itemBuilder: (context, index) => const MedicationSkeleton(),
                    )
                  : ListView.builder(
                      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
                      itemCount: filteredMeds.length,
                      itemBuilder: (context, index) {
                        final medication = filteredMeds[index];
                        return MedicationCard(
                          medication: medication,
                          onEdit: () => _editMedication(context, medication),
                        );
                      },
                    ),
            ),
          ),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () async {
          await _newMedication(context);
        },
        heroTag: 'add_medication_fab',
        backgroundColor: const Color(0xFF0066CC),
        child: const Icon(Icons.add_rounded),
      ),
    );
  }

  Future<void> _newMedication(BuildContext context) async {
    final newMedication =
        await Navigator.pushNamed(context, Routes.addMedication);
    if (newMedication != null && newMedication is Medication) {
      setState(() {
        medications.add(newMedication);
      });
    }
  }

  Future<void> _editMedication(
      BuildContext context, Medication medicationToEdit) async {
    final updatedMedication = await Navigator.pushNamed(
        context, Routes.addMedication,
        arguments: medicationToEdit);

    if (updatedMedication != null && updatedMedication is Medication) {
      setState(() {
        int index = medications.indexWhere((m) => m.id == updatedMedication.id);
        if (index != -1) {
          medications[index] = updatedMedication;
        }
      });
    }
  }
}

class _FilterChip extends StatelessWidget {
  final String label;
  final bool isActive;
  final VoidCallback onTap;

  const _FilterChip({
    required this.label,
    required this.isActive,
    required this.onTap,
  });

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: onTap,
      child: Container(
        decoration: BoxDecoration(
          color: isActive ? const Color(0xFF0066CC) : Colors.grey[100],
          borderRadius: BorderRadius.circular(20),
          border: Border.all(
            color: isActive ? const Color(0xFF0066CC) : Colors.grey[300]!,
          ),
        ),
        padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
        child: Text(
          label,
          style: TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w600,
            color: isActive ? Colors.white : Colors.black54,
          ),
        ),
      ),
    );
  }
}


