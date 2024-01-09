import 'dart:developer';

import 'package:firebase_storage/firebase_storage.dart';
import 'package:flutter_cache_manager/flutter_cache_manager.dart';

import '../flutter_cache_manager_firebase.dart';

/// [FirebaseHttpFileService] is another common file service which parses a
/// firebase reference into, to standard url which can be passed to the
/// standard [HttpFileService].
class FirebaseHttpFileService extends HttpFileService {
  @override
  Future<FileServiceResponse> get(String url,
      {Map<String, String>? headers}) async {

        var fileinfo = await FirebaseCacheManager().getFileFromCache(url);
if(fileinfo != null)
   {
     return super.get(fileinfo.file.path);
   }else{

    var ref = FirebaseStorage.instance.ref().child(url);
    var _url = await ref.getDownloadURL();
    log(_url);
    log('test');
    log(url);
    // var file = await FirebaseCacheManager().putFile(
    //       imageUrl,
    //       imageBytes!,
    //       key: imagePath,);

    return super.get(_url);
   }
  }
}
