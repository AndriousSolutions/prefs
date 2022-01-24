import 'package:flutter/material.dart';

import 'package:flutter/services.dart';

import 'package:prefs/prefs.dart';

void main() => runApp(const PrefsDemoApp());

class PrefsDemoApp extends StatelessWidget {
  const PrefsDemoApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) =>
      const MaterialApp(home: SharedPreferencesDemo());
}

class SharedPreferencesDemo extends StatefulWidget {
  const SharedPreferencesDemo({Key? key}) : super(key: key);
  @override
  _SharedPreferencesDemoState createState() => _SharedPreferencesDemoState();
}

class _SharedPreferencesDemoState extends State<SharedPreferencesDemo> {
  @override
  void dispose() {
    /// Clean up
    Prefs.dispose();
    super.dispose();
  }

  final _formKey = GlobalKey<FormState>();

  bool get radioButton => _radioButton ??= Prefs.getBool('boolean', false);
  set radioButton(bool radio) => _radioButton = radio;
  bool? _radioButton;

  @override
  Widget build(BuildContext context) => Scaffold(
        appBar: AppBar(
          title: const Text('Preferences Demo'),
        ),
        body: FutureBuilder<bool>(
            future: initPrefs(),
            builder: (_, snapshot) {
              //
              if (snapshot.hasData) {
                //
                if (snapshot.data != null) {
                  return form;
                } else {
                  //
                  return const Text('Failed to startup');
                }
              } else if (snapshot.hasError) {
                //
                return Text('${snapshot.error}');
              }
              // By default, show a loading spinner.
              return const Center(child: CircularProgressIndicator());
            }),
      );

  Widget get form => Form(
        key: _formKey,
        child: Column(crossAxisAlignment: CrossAxisAlignment.start, children: <
            Widget>[
          TextFormField(
            key: const Key('string'),
            initialValue: Prefs.getString('string'),
            onSaved: (String? newValue) => Prefs.setString('string', newValue),
            decoration: const InputDecoration(
              labelText: 'Enter one or two words',
            ),
            keyboardType: TextInputType.text,
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.singleLineFormatter,
            ],
          ),
          TextFormField(
            key: const Key('integer'),
            initialValue: Prefs.getInt('integer').toString(),
            onSaved: (String? newValue) {
              if (newValue!.isNotEmpty) {
                Prefs.setInt('integer', int.parse(newValue));
              }
            },
            decoration: const InputDecoration(
              labelText: 'Enter a integer',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: false),
            inputFormatters: <TextInputFormatter>[
              FilteringTextInputFormatter.digitsOnly,
            ],
          ),
          TextFormField(
            key: const Key('double'),
            initialValue: Prefs.getDouble('double').toString(),
            onSaved: (String? newValue) {
              if (newValue!.isNotEmpty) {
                Prefs.setDouble('double', double.parse(newValue));
              }
            },
            decoration: const InputDecoration(
              labelText: 'Enter a Double number',
            ),
            keyboardType: const TextInputType.numberWithOptions(decimal: true),
            // inputFormatters: <TextInputFormatter>[
            //   FilteringTextInputFormatter.allow(RegExp(r'[0-9]')),
            // ],
          ),

          // True - False Radio Button
          _RadioButton(this),
          Align(
            alignment: Alignment.bottomRight,
            child: Padding(
              padding: const EdgeInsets.all(20),
              child: ElevatedButton(
                key: const Key('Save'),
                onPressed: () {
                  _formKey.currentState!.save();
                  Prefs.setBool('boolean', _radioButton);
                },
                child: const Text('Save'),
              ),
            ),
          ),
        ]),
      );

  Future<bool> initPrefs() async {
    // Initialize SharedPreferences
    final SharedPreferences? prefs = await Prefs.init();
    return prefs != null;
  }
}

class _RadioButton extends StatefulWidget {
  const _RadioButton(this.state, {Key? key}) : super(key: key);
  final _SharedPreferencesDemoState state;
  @override
  State<StatefulWidget> createState() => _RadioButtonState();
}

class _RadioButtonState extends State<_RadioButton> {
  @override
  Widget build(BuildContext context) => Row(
        mainAxisAlignment: MainAxisAlignment.center,
        children: [
          Flexible(
            child: RadioListTile<bool>(
              key: const Key('true'),
              value: true,
              groupValue: widget.state.radioButton,
              onChanged: (newValue) {
                widget.state.radioButton = newValue as bool;
                setState(() {});
              },
              title: const Text('True'),
            ),
          ),
          Flexible(
            child: RadioListTile<bool>(
              key: const Key('false'),
              value: false,
              groupValue: widget.state.radioButton,
              onChanged: (newValue) {
                widget.state.radioButton = newValue as bool;
                setState(() {});
              },
              title: const Text('False'),
            ),
          ),
        ],
      );
}
