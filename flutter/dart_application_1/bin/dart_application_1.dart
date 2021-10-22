import 'package:path/path.dart' as path;
import 'dart:io' show Platform, Directory;
import 'package:ffi/ffi.dart';
import 'dart:ffi';

void main(List<String> arguments) async {
  // var libary_path = 'bls-signatures-main/build/src/libblstest.dylib';
  var libary_path = path.join(
      Directory.current.parent.parent.path, 'build/src/', 'libblstest.dylib');
  var dylib = DynamicLibrary.open(libary_path);
  Pointer<Void> Function() blsfunction = dylib
      .lookup<NativeFunction<Pointer<Void> Function()>>('bls_create')
      .asFunction();
  Pointer<Void> blsObject = blsfunction();

  void Function(Pointer<Void>) generateKeys = dylib
      .lookup<NativeFunction<Void Function(Pointer<Void>)>>('bls_generate')
      .asFunction();
  generateKeys(blsObject);

  Pointer<Utf8> Function(Pointer<Void>) privateKey = dylib
      .lookup<NativeFunction<Pointer<Utf8> Function(Pointer<Void>)>>(
          'get_private_key')
      .asFunction();
  Pointer<Utf8> Function(Pointer<Void>) publicKey = dylib
      .lookup<NativeFunction<Pointer<Utf8> Function(Pointer<Void>)>>(
          'get_public_key')
      .asFunction();
  Pointer<Utf8> Function(Pointer<Void>) signature = dylib
      .lookup<NativeFunction<Pointer<Utf8> Function(Pointer<Void>)>>(
          'get_signature')
      .asFunction();
  print({
    'signature',
    signature(blsObject).toDartString(),
    'public key',
    publicKey(blsObject).toDartString(),
    'private key',
    privateKey(blsObject).toDartString()
  });
}
