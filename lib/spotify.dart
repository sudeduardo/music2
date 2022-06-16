import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:music2/model/PlaylistResponse.dart';
import 'package:music2/model/PlaylistDetails.dart';
import 'package:spotify_sdk/spotify_sdk.dart';
import 'model/user.dart';

class SpotifyApi {
  User? user;
  PlaylistResponse? playlists;

  String token;

  SpotifyApi({required this.token});

  Future<User?> me() async {
    if (token != null) {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}'
      };
      final response = await http.get(
          Uri.parse('https://api.spotify.com/v1/me'),
          headers: requestHeaders);

      if (response.statusCode == 200) {
        user = User.fromJson(jsonDecode(response.body));
        return user;
      }
    }
    throw Exception('Failed to load');
  }

  Future<PlaylistResponse?> MyPlaylists() async {
    if (token.isNotEmpty && await me() != null) {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer ${token}'
      };
      final response = await http.get(
          Uri.parse('https://api.spotify.com/v1/users/${user?.id}/playlists'),
          headers: requestHeaders);

      if (response.statusCode == 200) {
        playlists = PlaylistResponse.fromJson(jsonDecode(response.body));
        return playlists;
      }
    }
    throw Exception('Failed to load');
  }

  Future<PlaylistDetails?> GetPlaylistDetails(String playlistId) async {
    if (token.isNotEmpty && await me() != null) {
      Map<String, String> requestHeaders = {
        'Content-type': 'application/json',
        'Accept': 'application/json',
        'Authorization': 'Bearer $token'
      };
      var url =
          Uri.parse('https://api.spotify.com/v1/playlists/$playlistId/tracks');
      final response = await http.get(url, headers: requestHeaders);

      if (response.statusCode == 200) {
        var playlistDetails =
            PlaylistDetails.fromJson(jsonDecode(response.body));
        // int n = (playlistDetails.total! / 100).ceil() - 1;
        // for (int i = 0; i <= n; i++) {
        //   var url = Uri.parse(
        //       'https://api.spotify.com/v1/playlists/$playlistId/tracks?offset=${i+1 * 100}');
        //   var resp = await http.get(url, headers: requestHeaders);
        //   // if (resp.statusCode == 200) {
        //   //   var playlistTemp = PlaylistDetails.fromJson(jsonDecode(resp.body));
        //   //   playlistTemp.items?.forEach((element) {
        //   //     playlistDetails.items?.add(element);
        //   //   });
        //   // }
        // }
        return playlistDetails;
      }
    }
    throw Exception('Failed to load');
  }
}
