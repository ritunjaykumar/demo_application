import 'package:demo_application/screen/setting/setting_model.dart';
import 'package:demo_application/screen/setting/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../widget/custom_arc.dart';

class SettingScreen extends StatelessWidget {
  const SettingScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<SettingProvider>(
      create: (ctx) => SettingProvider(context)..init(),
      child: const _SettingScreenMain(),
    );
  }
}

///
class _SettingScreenMain extends StatefulWidget {
  const _SettingScreenMain();

  @override
  State<_SettingScreenMain> createState() => _SettingScreenMainState();
}

class _SettingScreenMainState extends State<_SettingScreenMain> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Setting'),
        centerTitle: true,
      ),
      body: Column(
        children: [
          Selector<SettingProvider, SettingDetail>(
              builder: (_, settingDetail, child) {
                return ListTile(
                  title: const Text('Weather Unit'),
                  subtitle: const Text('Change Weather Unit'),
                  leading: const CircleAvatar(child: Icon(Icons.ac_unit_sharp)),
                  trailing: DropdownButton<String>(
                    borderRadius: BorderRadius.circular(12),
                    value: settingDetail.temperature,
                    items: [('Celsius', 'metric'), ('Fahrenheit', 'imperial')]
                        .map((e) => DropdownMenuItem<String>(value: e.$2, child: Text(e.$1)))
                        .toList(),
                    onChanged: (value) => context.read<SettingProvider>().onChange(value!),
                  ),
                );
              },
              selector: (_, SettingProvider settingProvider) => settingProvider.settingDetail,
              shouldRebuild: (old, newData) =>
                  old == newData //old.temperature == newData.temperature,
              ),
          Selector<SettingProvider, (List<String>, SettingDetail)>(
            builder: (_, data, child) {
              return ListTile(
                title: const Text('News Category'),
                subtitle: const Text('Select News Category'),
                leading: const CircleAvatar(child: Icon(Icons.newspaper)),
                trailing: DropdownButton<String?>(
                  borderRadius: BorderRadius.circular(12),
                  value: data.$2.category ?? 'none',
                  items: data.$1
                      .map((e) => DropdownMenuItem<String>(value: e, child: Text(capitalize(e))))
                      .toList(),
                  onChanged: (value) => context.read<SettingProvider>().onCategoryChange(value!),
                ),
              );
            },
            selector: (_, SettingProvider settingProvider) => (
              settingProvider.categories,
              settingProvider.settingDetail,
            ),
            shouldRebuild: (old, newData) =>
                old.$2.category == null ? true : old.$2.category == old.$2.category,
          ),
        ],
      ),
    );
  }
}

String capitalize(String value) {
  return '${value[0].toUpperCase()}${value.substring(1)}';
}


