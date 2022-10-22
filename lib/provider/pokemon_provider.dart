import 'package:challenge_flutter_dev/models/pokemon_model.dart';
import 'package:challenge_flutter_dev/models/pokemons_response.dart';
import 'package:challenge_flutter_dev/services/pokemon_rest.dart';
import 'package:flutter/material.dart';

class PokemonProvider extends ChangeNotifier {
  final pokemonService = PokeService();
  List<Pokemon> _pokemonList = [];
  PokemonModel _pokemonModelList = PokemonModel();
  List<String> _abilityname = [];
  String _name = '';
  int paginations = 3;

   

  double _ataque = 0;
  double _velocidad = 0;
  double _vida = 0;
  double _defensa = 0;

  bool _validator = false;


  List<Pokemon> get pokemonList => _pokemonList;
  PokemonModel? get habilityList => _pokemonModelList;

  List<String> get abilityName => _abilityname;
  String get name => _name;

  double get ataque => _ataque;
  double get velocidad => _velocidad;
  double get vida => _vida;
  double get defense => _defensa;

  bool get validator => _validator;




  PokemonProvider() {
   
    getPokemons();
  }

  

  List<String> selecion(String datos, index) {
_validator = true;
    List<String> abi = _abilityname..add(datos);
    final remove = [
      ...{...abi}
    ];
    _name = datos;
    _abilityname = remove;
    porcentaje(name);
    notifyListeners();
    return _abilityname;
  }

  porcentaje(String n) {
    if (n == 'Intimidacion') {
      _ataque = _ataque + 10;
      _velocidad = _velocidad + 15;
      _vida = _vida + 5;
      _defensa = _defensa + 10;
      notifyListeners();
    } else if (n == 'Inmunidad') {
      _ataque = _ataque + 20;
      _velocidad = _velocidad + 10;
      _vida = _vida + 10;
      _defensa = _defensa + 20;
      notifyListeners();
    } else if (n == 'Potencia') {
      _ataque = _ataque + 15;
      _velocidad = _velocidad + 15;
      _vida = _vida + 20;
      _defensa = _defensa + 10;
      notifyListeners();
    } else if (n == 'Regeneracion') {
      _ataque = _ataque + 20;
      _velocidad = _velocidad + 5;
      _vida = _vida + 10;
      _defensa = _defensa + 5;
      notifyListeners();
    } else if (n == 'Impasible') {
      _ataque = _ataque + 3;
      _velocidad = _velocidad + 30;
      _vida = _vida + 10;
      _defensa = _defensa + 10;
      notifyListeners();
    } else if (n == 'Toxico') {
      _ataque = _ataque + 0;
      _velocidad = _velocidad + 3;
      _vida = _vida + 15;
      _defensa = _defensa + 20;
      notifyListeners();
    }
  }

  List<String> remove() {
    _validator = false;
    _abilityname = [];
    notifyListeners();
    return _abilityname;
  }

  getPokemons() async {
    final data = await pokemonService.getPokemons(paginations++, 20);
    _pokemonList = data;
    await getPokemonModel(_pokemonList[0].name!);
    notifyListeners();
    return _pokemonList;
  }

  Future<PokemonModel?> getPokemonModel(String name) async {
    final data = await pokemonService.getName(name);
    _pokemonModelList = data!;
    notifyListeners();
    return _pokemonModelList;
  }
}
