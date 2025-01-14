import 'package:flutter/material.dart';
import 'package:flutter/scheduler.dart';
import 'package:flutter/services.dart';
import 'package:flutter_displaymode/flutter_displaymode.dart';

class SetDiaplayMode extends StatefulWidget {
  const SetDiaplayMode({super.key});

  @override
  State<SetDiaplayMode> createState() => _SetDiaplayModeState();
}

class _SetDiaplayModeState extends State<SetDiaplayMode> {
  List<DisplayMode> modes = <DisplayMode>[];
  DisplayMode? active;
  DisplayMode? preferred;

  final ValueNotifier<int> page = ValueNotifier<int>(0);
  late final PageController controller = PageController()
    ..addListener(() {
      page.value = controller.page!.round();
    });
  @override
  void initState() {
    super.initState();
    init();
    SchedulerBinding.instance.addPostFrameCallback((_) {
      fetchAll();
    });
  }

  Future<void> fetchAll() async {
    preferred = await FlutterDisplayMode.preferred;
    active = await FlutterDisplayMode.active;
    // GStorage().setDisplayModeType(preferred!);
    setState(() {});
  }

  Future<void> init() async {
    try {
      modes = await FlutterDisplayMode.supported;
    } on PlatformException catch (e) {
      print(e);
    }
    // var res = await GStorage().getDisplayModeType();
    // preferred = modes.toList().firstWhere((el) => el == res);
    FlutterDisplayMode.setPreferredMode(preferred!);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('屏幕帧率设置')),
      body: SafeArea(
        top: false,
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            if (modes.isEmpty) const Text('Nothing here'),
            Padding(
              padding: const EdgeInsets.only(left: 25, top: 10, bottom: 5),
              child: Text(
                '没有生效？重启app试试',
                style: TextStyle(color: Theme.of(context).colorScheme.outline),
              ),
            ),
            Expanded(
              child: ListView.builder(
                itemCount: modes.length,
                itemBuilder: (_, int i) {
                  final DisplayMode mode = modes[i];
                  return RadioListTile<DisplayMode>(
                    value: mode,
                    title: mode == DisplayMode.auto
                        ? const Text('自动')
                        : Text('$mode${mode == active ? "  [系统]" : ""}'),
                    groupValue: preferred,
                    onChanged: (DisplayMode? newMode) async {
                      await FlutterDisplayMode.setPreferredMode(newMode!);
                      await Future<dynamic>.delayed(
                        const Duration(milliseconds: 100),
                      );
                      await fetchAll();
                    },
                  );
                },
              ),
            ),
          ],
        ),
      ),
    );
  }
}
