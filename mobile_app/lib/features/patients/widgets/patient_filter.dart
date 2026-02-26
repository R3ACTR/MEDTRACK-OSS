import 'package:flutter/material.dart';

class PatientFilter extends StatefulWidget {
  const PatientFilter({super.key});

  @override
  State<PatientFilter> createState() => _PatientFilterState();
}

class _PatientFilterState extends State<PatientFilter> {
  String _selectedStatus = 'All';
  List<String> options = ['All', 'Stable', 'Critical', 'Recovering'];
  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        SizedBox(
          height: 220,
          child: ListView.builder(
            itemCount: options.length,
            itemBuilder: (context, index) {
              return ListTile(
                title: Text(options[index]),
                selected: _selectedStatus == options[index],
                onTap: () {
                  setState(() {
                    _selectedStatus = options[index];
                    Navigator.pop(context, _selectedStatus);
                  });
                },
              );
            },
          ),
        ),
      ],
    );
  }
}
