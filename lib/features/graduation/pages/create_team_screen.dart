import 'package:edumate/core/consts/const_variebles.dart';
import 'package:edumate/core/themes/conts_colors.dart';
import 'package:edumate/core/themes/fonts.dart';
import 'package:edumate/features/graduation/widgets/max_member_stepper.dart';
import 'package:edumate/features/graduation/widgets/team_form_field.dart';
import 'package:edumate/features/graduation/widgets/supervisor_search_field.dart';
import 'package:edumate/features/graduation/widgets/supervisor_select_tile.dart';
import 'package:edumate/features/home/custom_app_bar.dart';
import 'package:flutter/material.dart';

class _SupervisorOption {
  final String id;
  final String name;
  const _SupervisorOption(this.id, this.name);
}

const List<_SupervisorOption> _allSupervisors = [
  _SupervisorOption('1', 'Dr. Sarah Jenkins'),
  _SupervisorOption('2', 'Dr. Elena Rodriguez'),
];

class CreateTeamScreen extends StatefulWidget {
  const CreateTeamScreen({super.key});

  @override
  State<CreateTeamScreen> createState() => _CreateTeamScreenState();
}

class _CreateTeamScreenState extends State<CreateTeamScreen> {
  final _nameController = TextEditingController();
  final _descController = TextEditingController();
  final _searchController = TextEditingController();

  int _maxMembers = 6;
  String _query = '';
  String? _selectedSupervisorId;

  @override
  void dispose() {
    _nameController.dispose();
    _descController.dispose();
    _searchController.dispose();
    super.dispose();
  }

  List<_SupervisorOption> get _filteredSupervisors {
    if (_query.isEmpty) return _allSupervisors;
    return _allSupervisors
        .where((s) => s.name.toLowerCase().contains(_query.toLowerCase()))
        .toList();
  }

  void _handleSave() {
    // TODO: pass _nameController.text, _descController.text, _maxMembers,
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color(0xFFF5F6FA),
      appBar: CustomAppBar(
        title: 'Edit Team',
        actions: [
          ElevatedButton(
            style: ElevatedButton.styleFrom(
              backgroundColor: Color(ConstsColors.kblue),
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(10),
              ),
            ),
            onPressed: _handleSave,
            child: Text('Save', style: Fonts.boldwhitestyle16),
          ),
          const SizedBox(width: 16),
        ],
      ),
      body: SingleChildScrollView(
        padding: ConstVariebles.fullpadding10,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            TeamFormField(
              label: 'Team Name',
              hint: 'e.g. AI Research Group',
              controller: _nameController,
            ),
            const SizedBox(height: 18),
            TeamFormField(
              label: 'Project Description',
              hint: 'Describe your project goal...',
              controller: _descController,
              maxLines: 4,
            ),
            const SizedBox(height: 18),
            MaxMembersStepper(
              value: _maxMembers,
              onChanged: (v) => setState(() => _maxMembers = v),
            ),
            const SizedBox(height: 24),
            const Text(
              'CHOOSE SUPERVISOR',
              style: TextStyle(
                fontSize: 12,
                fontWeight: FontWeight.bold,
                color: Colors.grey,
                letterSpacing: 0.5,
              ),
            ),
            const SizedBox(height: 10),
            SupervisorSearchField(
              controller: _searchController,
              onChanged: (v) => setState(() => _query = v),
            ),
            const SizedBox(height: 8),
            ..._filteredSupervisors.map(
              (s) => SupervisorSelectTile(
                name: s.name,
                isSelected: _selectedSupervisorId == s.id,
                onSelect: () => setState(() => _selectedSupervisorId = s.id),
              ),
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
