import 'package:b_tools/models/btools.dart';
import 'package:b_tools/utils/mainJsonManager.dart';

class BToolsData{
  static final BToolsData _instance = BToolsData._internal();

  factory BToolsData() {
    return _instance;
  }

  BToolsData._internal();

  BTools bTools = BTools(counts: [],notes: []);

  Future initData() async{
    bTools = bToolsFromJson(await readFromMainJson());
    return 1;
  }

  Future writeData() async{
    await writeToMainJson(bTools);
  }
}