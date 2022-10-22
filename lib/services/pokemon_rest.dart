import 'package:challenge_flutter_dev/models/pokemon_model.dart';
import 'package:challenge_flutter_dev/models/pokemons_response.dart';
import 'package:flutter/foundation.dart';
import 'package:http/http.dart' as http;
import 'dart:convert';

class PokeService {
  final url = 'https://pokeapi.co/api/v2/pokemon';

  Future<List<Pokemon>> getPokemons(int limit, int offset) async {
    final response =
        await http.get(Uri.parse('$url?limit=$limit&offset=$offset'));
    if (response.statusCode == 200) {
      final decodedData = json.decode(response.body);
      final pokemons = (decodedData['results'] as List)
          .map((e) => Pokemon.fromJson(e))
          .toList();
      return pokemons;
    } else {
      return [];
    }
  }

  Future<PokemonModel?> getName(String name) async {
    final response = await http.get(Uri.parse('$url/$name'));
    if (response.statusCode == 200) {
      final pokemonModel = compute(pokemonModelFromJson, response.body);
      return pokemonModel;
    }
    return null;
  }
}
