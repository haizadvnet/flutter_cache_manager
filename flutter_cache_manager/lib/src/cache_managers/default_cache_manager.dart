import 'package:flutter_cache_manager/flutter_cache_manager.dart';
import 'package:flutter_cache_manager/src/storage/file_system/file_system_io.dart';

/// The DefaultCacheManager that can be easily used directly. The code of
/// this implementation can be used as inspiration for more complex cache
/// managers.
class DefaultCacheManager extends CacheManager with ImageCacheManager {
  static const key = 'libCachedImageData';

  static final DefaultCacheManager _instance = DefaultCacheManager._();

  factory DefaultCacheManager() {
    return _instance;
  }

  DefaultCacheManager._() : super(Config(key,fileSystem: IOFileSystem(key)));
}
