import 'package:deli_meals/components/main_drawer.dart';
import 'package:deli_meals/models/settings.dart';
import 'package:flutter/material.dart';

class SettingsScreen extends StatefulWidget {
  const SettingsScreen({super.key});

  @override
  State<SettingsScreen> createState() => _SettingsScreenState();
}

class _SettingsScreenState extends State<SettingsScreen> {
  final settings = Settings();
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
      onChanged: onChanged,
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
                  value: settings.isGlutenFree,
                  onChanged: (value) => setState(
                    () => settings.isGlutenFree = value,
                  ),
                ),
                _createSwitch(
                  title: 'Sem Lactose',
                  subtitle: 'Só exibe refeições sem lactose',
                  value: settings.isLactoseFree,
                  onChanged: (value) => setState(
                    () => settings.isLactoseFree = value,
                  ),
                ),
                _createSwitch(
                  title: 'Vegana',
                  subtitle: 'Só exibe refeições veganas',
                  value: settings.isVegan,
                  onChanged: (value) => setState(
                    () => settings.isVegan = value,
                  ),
                ),
                _createSwitch(
                  title: 'Vegetariana',
                  subtitle: 'Só exibe refeições vegetarianas',
                  value: settings.isVegetarian,
                  onChanged: (value) => setState(
                    () => settings.isVegetarian = value,
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
