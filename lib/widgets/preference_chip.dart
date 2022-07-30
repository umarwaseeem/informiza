import 'package:flutter/material.dart';

class PreferenceChip extends StatefulWidget {
  final String title;
  final IconData icon;

  const PreferenceChip({Key? key, required this.title, required this.icon})
      : super(key: key);

  @override
  State<PreferenceChip> createState() => _PreferenceChipState();
}

class _PreferenceChipState extends State<PreferenceChip>
    with SingleTickerProviderStateMixin {
  bool selected = false;

  @override
  Widget build(BuildContext context) {
    return GestureDetector(
      onTap: () {
        setState(() => selected = !selected);
      },
      child: Padding(
        padding: const EdgeInsets.all(8.0),
        child: AnimatedContainer(
          duration: const Duration(seconds: 200),
          child: Chip(
            label: Text(widget.title),
            elevation: selected ? 0 : 5,
            backgroundColor: selected ? Colors.green : Colors.white,
            avatar: Icon(
              widget.icon,
              color: selected ? Colors.white : Colors.black,
            ),
            shadowColor: Colors.green,
            labelStyle: TextStyle(
              color: selected ? Colors.white : Colors.black,
              fontSize: 16,
            ),
          ),
        ),
      ),
    );
  }
}

List<PreferenceChip> getChips() {
  return [
    const PreferenceChip(title: "Health", icon: Icons.local_hospital),
    const PreferenceChip(title: "Sports", icon: Icons.sports_baseball),
    const PreferenceChip(title: "Fitness", icon: Icons.fitness_center),
    const PreferenceChip(title: "Technology", icon: Icons.laptop),
    const PreferenceChip(title: "Automotive Industry", icon: Icons.local_taxi),
    const PreferenceChip(title: "Politics", icon: Icons.person),
    const PreferenceChip(title: "Life Hacks", icon: Icons.home),
  ];
}
