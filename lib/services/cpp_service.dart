import 'dart:ffi';
import 'package:ffi/ffi.dart';

class CppService {
  static DynamicLibrary _lib = DynamicLibrary.open('cpp_service.dll');

  static Future<Map<String, double>> getUsageData() async {
    final getUsage = _lib.lookupFunction<Void Function(Pointer<Double>, Pointer<Double>), void Function(Pointer<Double>, Pointer<Double>)>('get_usage');
    final cpu = calloc<Double>();
    final ram = calloc<Double>();
    getUsage(cpu, ram);
    final usageData = {
      'cpu': cpu.value,
      'ram': ram.value,
    };
    calloc.free(cpu);
    calloc.free(ram);
    return usageData;
  }
}
