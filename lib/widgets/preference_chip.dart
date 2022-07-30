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
      child: AnimatedContainer(
        margin: const EdgeInsets.all(10),
        duration: const Duration(milliseconds: 100),
        curve: Curves.easeInOutCirc,
        // width: 200,
        decoration: BoxDecoration(
          gradient: LinearGradient(
            colors: [
              selected ? Colors.green : Colors.white54,
              selected ? Colors.green.shade900 : Colors.white24,
              // selected ? Colors.green.shade900 : Colors.black54,
            ],
            begin: Alignment.topLeft,
            end: Alignment.bottomRight,
          ),
          borderRadius: BorderRadius.circular(20),
          // color: selected
          //     ? Theme.of(context).appBarTheme.backgroundColor
          //     : Colors.white38,
        ),
        child: Padding(
            padding: const EdgeInsets.all(10.0),
            child: Row(
              children: [
                Icon(
                  widget.icon,
                  color: selected ? Colors.white : Colors.black,
                ),
                const SizedBox(width: 8),
                Text(
                  widget.title,
                  style: TextStyle(
                      fontSize: 14,
                      color: selected ? Colors.white : Colors.black),
                ),
              ],
            )),
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
    const PreferenceChip(title: "Climate", icon: Icons.wb_sunny),
  ];
}
