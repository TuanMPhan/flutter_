import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';

/// useTextEditingController
/// useState: create a variable and subscribe to it
/// use effect: side effect. do something when something happened


class ExistingHooksPage extends HookWidget {
  const ExistingHooksPage({super.key});

  @override
  Widget build(BuildContext context) {
    final controller = useTextEditingController();
    final text = useState('');
    useEffect(() {
      controller.addListener(() {
        text.value = controller.text;
      });
      return null;
    }, [controller]);
    return Scaffold(
      appBar: AppBar(
        title: const Text('Home Page'),
      ),
      body: Column(
        children: [
          TextField(
            controller: controller,
          ),
          Text('You typed ${text.value}')
        ],
      ),
    );
  }
}