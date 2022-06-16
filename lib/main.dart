import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:flutter_dotenv/flutter_dotenv.dart';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:music2/model/PlaylistResponse.dart';
import 'package:music2/spotify.dart';
import 'package:music2/youtube.dart';
import 'package:spotify_sdk/spotify_sdk.dart';

Future<void> main() async {
  await dotenv.load(fileName: '.env');
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return const MaterialApp(
      home: HomePage(),
    );
  }
}

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Home"),
      ),
      body: Container(
        child: Padding(
          padding: const EdgeInsets.all(8.0),
          child: Center(
            child: Column(
                crossAxisAlignment: CrossAxisAlignment.center,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: const [
                  SpotifyForm(),
                ]),
          ),
        ),
      ),
    );
  }
}

class SpotifyForm extends StatefulWidget {
  const SpotifyForm({Key? key}) : super(key: key);

  @override
  State<SpotifyForm> createState() => _SpotifyFormState();
}

class _SpotifyFormState extends State<SpotifyForm> {
  bool load = false;
  String token = "";
  SpotifyApi? api;
  String? playlistId;
  PlaylistResponse? playlistResponse;

  GoogleSignInAccount? _currentUser;
  youtubeApi? youapi;
  final GoogleSignIn _googleSignIn = GoogleSignIn(
    clientId: dotenv.env['GOOGLE_CLIENT_ID'].toString(),
    scopes: <String>['https://www.googleapis.com/auth/youtube'],
  );

  @override
  void initState() {
    super.initState();
    _googleSignIn.onCurrentUserChanged.listen((GoogleSignInAccount? account) {
      setState(() {
        _currentUser = account;
        if(_currentUser != null){
          youapi = youtubeApi(user: _currentUser);
        }
      });
    });
  }

  Future getAccessToken() async {
    try {
      var authenticationToken = await SpotifySdk.getAccessToken(
          clientId: dotenv.env['CLIENT_ID'].toString(),
          redirectUrl: dotenv.env['REDIRECT_URL'].toString(),
          scope: 'app-remote-control, '
              'user-modify-playback-state, '
              'playlist-read-private , '
              'playlist-modify-public,user-read-currently-playing');
      setState(() {
        token = authenticationToken;
      });

      api = SpotifyApi(token: token);

      PlaylistResponse? playlist = await api?.MyPlaylists();

      setState(() {
        playlistResponse = playlist;
      });
    } on PlatformException catch (e) {
      return Future.error('$e.code: $e.message');
    } on MissingPluginException {
      return Future.error('not implemented');
    }
  }

  @override
  Widget build(BuildContext context) {
    if (token.isEmpty) {
      return Container(child: spotifyLogin());
    } else {
      return Container(
          child: Column(
        children: [
          spotifyPlaylistSelect(),
          Padding(
            padding: EdgeInsets.all(10),
            child: ElevatedButton(
                child: Text("Migrar", textDirection: TextDirection.ltr),
                onPressed: (api?.user != null && playlistId != null && !load)
                    ? _migrarPlaylist
                    : null),
          )
        ],
      ));
    }
  }

  Widget spotifyPlaylistSelect() {
    return DropdownButton(
      items: api?.playlists?.items?.map((item) {
        return DropdownMenuItem(
          value: item.id,
          child: Text(item.name ?? ''),
        );
      }).toList(),
      onChanged: (newVal) {
        setState(() {
          playlistId = newVal as String?;
        });
      },
      value: playlistId,
    );
  }

  Widget spotifyLogin() {
    return ElevatedButton(
        onPressed: getAccessToken, child: Text("Login no Spotify"));
  }


  Future<void> _migrarPlaylist() async {
    if (_currentUser == null) {
      await _handleSignIn();
    }

    setState(() {
      load = true;
    });

    var playlist = await api?.GetPlaylistDetails(playlistId!);
    var musicasSpotify = playlist?.items;
    var playlistSpotfy = playlistResponse?.items
        ?.where((element) => element.id == playlistId)
        .first;
    var playListYoutube = await youapi?.CreatePlaylist(playlistSpotfy?.name);

    if(musicasSpotify != null) {
      for(int i = 0; i < musicasSpotify.length;i++){
        var youtubeSearchResponse = await youapi?.SearchMusicOnYoutube(
            musicasSpotify[i].track?.name);
        var musiciaYoutube = youtubeSearchResponse?.items?.first;
        await youapi?.addMusic(musiciaYoutube?.id?.videoId, playListYoutube?.id);
      }

      setState(() {
        load = false;
      });

      showDialog(
          context: context,
          builder: (BuildContext context) {
            // retorna um objeto do tipo Dialog
            return AlertDialog(
              title: new Text("Concluido"),
              content: new Text("Transferencia feita com sucesso!"),
              actions: <Widget>[
                // define os botões na base do dialogo
                new FlatButton(
                  child: new Text("Fechar"),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
              ],
            );
          });
    }
}

  Future<void> _handleSignIn() async {
    try {
      await _googleSignIn.signIn();
    } catch (error) {
      print(error);
    }
  }
}
