import 'package:deli_meals/components/main_drawer.dart';
import 'package:deli_meals/models/settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({
    super.key,
    required this.onSettingsChange,
    required this.settings,
  });
  final void Function(Settings) onSettingsChange;
  final Settings settings;

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  Widget _createSwitch({
    required final String title,
    required final String subtitle,
    required final bool value,
    required final void Function(bool) onChanged,
  }) {
    return SwitchListTile.adaptive(
      title: Text(title),
      subtitle: Text(subtitle),
      value: value,
      onChanged: (value) {
        onChanged(value);
        widget.onSettingsChange(widget.settings);
      },
    );
  }

  @override
  Widget build(final BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Configurações'),
      ),
      drawer: const MainDrawer(),
      body: Column(
        children: [
          Container(
            padding: const EdgeInsets.all(20),
            child: Text(
              'Configurações',
              style: Theme.of(context).textTheme.titleMedium,
            ),
          ),
          Expanded(
            child: ListView(
              children: [
                _createSwitch(
                  title: 'Sem Glúten',
                  subtitle: 'Só exibe refeições sem glúten',
                  value: widget.settings.isGlutenFree,
                  onChanged: (value) => setState(
                    () => widget.settings.isGlutenFree = value,
                  ),
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Só exibe refeições sem lactose',
                  value: widget.settings.isLactoseFree,
                  onChanged: (value) => setState(
                    () => widget.settings.isLactoseFree = value,
                  ),
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibe refeições veganas',
                  value: widget.settings.isVegan,
                  onChanged: (value) => setState(
                    () => widget.settings.isVegan = value,
                  ),
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subtitle: 'Só exibe refeições vegetarianas',
                  value: widget.settings.isVegetarian,
                  onChanged: (value) => setState(
                    () => widget.settings.isVegetarian = value,
                  ),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}
