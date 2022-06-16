import 'dart:convert';
import 'package:google_sign_in/google_sign_in.dart';
import 'package:http/http.dart' as http;
import 'package:music2/model/searchListResponse.dart';

import 'model/YoutubePlaylistCreate.dart';

class youtubeApi {
  youtubeApi({required this.user});

  GoogleSignInAccount? user;

  Future<YoutubePlaylistCreate> CreatePlaylist(String? name) async {
    var response = await http.post(
        Uri.parse(
            'https://youtube.googleapis.com/youtube/v3/playlists?part=snippet,status'),
        headers: await user?.authHeaders,
        body: jsonEncode(<String, dynamic>{
          "snippet": {
            "title": name,
          },
          "status": {"privacyStatus": "public"}
        }));
    if (response.statusCode == 200) {
      return YoutubePlaylistCreate.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load');
    }
  }

  Future<searchListResponse> SearchMusicOnYoutube(String? name) async {
    var headers = await user?.authHeaders;
    Map<String, String> requestHeaders = {
      'Content-type': 'application/json',
      'Accept': 'application/json',
    };
    requestHeaders.addAll(headers!);
    var response = await http.get(
        Uri.parse(
            'https://youtube.googleapis.com/youtube/v3/search?q=${Uri.encodeFull(name!)}'),
        headers: requestHeaders);
    if (response.statusCode == 200) {
      return searchListResponse.fromJson(jsonDecode(response.body));
    } else {
      print(response.body);
      throw Exception('Failed to load');
    }
    //
  }

  Future addMusic(var musicId, var playlistId) async {
    var response = await http.post(
        Uri.parse(
            'https://youtube.googleapis.com/youtube/v3/playlistItems?part=snippet'),
        headers: await user?.authHeaders,
        body: jsonEncode(<String, dynamic>{
          "snippet": {
            "playlistId": playlistId,
            "resourceId": {"videoId": musicId, "kind": "youtube#video"}
          }
        }));

    return jsonDecode(response.body);
  }
}
