import 'package:flutter/material.dart';

class SettingsPage extends StatefulWidget {
  const SettingsPage({super.key, required this.title});

  final String title;

  @override
  State<SettingsPage> createState() => _SettingsPageState();
}

class _SettingsPageState extends State<SettingsPage> {
  TextEditingController controller = TextEditingController();
  bool? isChecked = false;
  bool isSwitched = false;
  double sliderValue = 0.0;
  String? menuItem;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Settings Page'),
        automaticallyImplyLeading: false,
        leading: BackButton(onPressed: () => Navigator.pop(context)),
      ),
      body: SingleChildScrollView(
        child: Padding(
          padding: const EdgeInsets.all(14.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              ElevatedButton(
                onPressed: () {
                  ScaffoldMessenger.of(context).showSnackBar(
                    SnackBar(
                      content: Text("ini Ceritanya snakck bar"),
                      behavior: SnackBarBehavior.fixed,
                    ),
                  );
                },
                child: Text("Open Snackbar"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AboutDialog();
                    },
                  );
                },
                child: Text("Open About Dialog"),
              ),
              ElevatedButton(
                onPressed: () {
                  showDialog(
                    context: context,
                    builder: (context) {
                      return AlertDialog(
                        content: Text("Ini Alert Dialog"),
                        title: Text("Alert Dialog"),
                        actions: [
                          FilledButton(
                            onPressed: () {
                              Navigator.pop(context);
                            },
                            child: Text("Close"),
                          ),
                        ],
                      );
                    },
                  );
                },
                child: Text("Open Alert Dialog"),
              ),
              DropdownButton(
                value: menuItem,
                hint: Text("Pilih Data"),
                items: [
                  DropdownMenuItem(value: 'd1', child: Text("Data 1")),
                  DropdownMenuItem(value: 'd2', child: Text("data 2")),
                  DropdownMenuItem(value: 'd3', child: Text("data 3")),
                ],
                onChanged: (String? value) {
                  setState(() {
                    menuItem = value;
                  });
                },
              ),
              TextField(
                controller: controller,
                decoration: InputDecoration(border: OutlineInputBorder()),
                onEditingComplete: () => setState(() {}),
              ),
              Text(controller.text),
              Checkbox(
                tristate: true,
                value: isChecked,
                onChanged: (bool? value) => setState(() {
                  isChecked = value;
                }),
              ),
              CheckboxListTile(
                tristate: true,
                title: Text("Click Me!"),
                value: isChecked,
                onChanged: (bool? value) => setState(() {
                  isChecked = value;
                }),
              ),
              Switch(
                value: isSwitched,
                onChanged: (bool value) => {
                  setState(() {
                    isSwitched = value;
                  }),
                },
              ),
              SwitchListTile.adaptive(
                title: Text("Switch Me"),
                value: isSwitched,
                onChanged: (value) => {
                  setState(() {
                    isSwitched = value;
                  }),
                },
              ),
              Slider(
                max: 100,
                divisions: 10,
                value: sliderValue,
                onChanged: (double value) {
                  setState(() {
                    sliderValue = value;
                  });
                },
              ),
              InkWell(
                onTap: () {},
                child: Container(
                  height: 50,
                  width: double.infinity,
                  color: Colors.black45,
                ),
              ),
              ElevatedButton(
                onPressed: () {},
                style: ElevatedButton.styleFrom(
                  backgroundColor: Colors.blue,
                  foregroundColor: Colors.black,
                ),
                child: Text("Click me"),
              ),
              ElevatedButton(onPressed: () {}, child: Text("Click me")),
              OutlinedButton(onPressed: () {}, child: Text("Click me")),
              CloseButton(),
              BackButton(),
              IconButton(onPressed: () {}, icon: Icon(Icons.add)),
            ],
          ),
        ),
      ),
    );
  }
}
