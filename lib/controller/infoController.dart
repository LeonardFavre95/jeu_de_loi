import 'package:jeu_de_loi/model/Info.dart';

class InfoController {
  late InfoController _infoController;
  InfoController get infoController => _infoController;

  final List<Info> _infos = sampleInfo
      .map(
        (info) => Info(
          id: info['id'],
          text: info['text'],
        ),
      )
      .toList();

  List<Info> get infos => _infos;
}
