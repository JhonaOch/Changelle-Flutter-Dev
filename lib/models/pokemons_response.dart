
import 'dart:convert';

PokemonResponseModel pokemonResponseModelFromJson(String str) => PokemonResponseModel.fromJson(json.decode(str));

String pokemonResponseModelToJson(PokemonResponseModel data) => json.encode(data.toJson());

class PokemonResponseModel {
    PokemonResponseModel({
        required this.count,
        required this.next,
        required this.previous,
        required this.results,
    });

    final int count;
    final String next;
    final dynamic previous;
    final List<Pokemon> results;

    factory PokemonResponseModel.fromJson(Map<String, dynamic> json) => PokemonResponseModel(
        count: json["count"],
        next: json["next"],
        previous: json["previous"],
        results: List<Pokemon>.from(json["results"].map((x) => Pokemon.fromJson(x))),
    );

    Map<String, dynamic> toJson() => {
        "count": count,
        "next": next,
        "previous": previous,
        "results": List<dynamic>.from(results.map((x) => x.toJson())),
    };
}

class Pokemon {
    Pokemon({
    this.name,
    this.url,
    });

    final String? name;
    final String? url;

    factory Pokemon.fromJson(Map<String, dynamic> json) => Pokemon(
        name: json["name"],
        url: json["url"],
    );

    Map<String, dynamic> toJson() => {
        "name": name,
        "url": url,
    };
}
