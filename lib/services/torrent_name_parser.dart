import 'package:parse_torrent_title/parse_torrent_title.dart' as ptt;
import 'package:memoize/memoize.dart';

final parse = memo1((String title) => ptt.parse(title));
