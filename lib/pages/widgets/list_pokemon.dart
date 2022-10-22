import 'package:challenge_flutter_dev/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../../models/pokemons_response.dart';

class ListaPokemon extends StatelessWidget {
  const ListaPokemon({Key? key, required this.pokemon}) : super(key: key);
  final List<Pokemon> pokemon;
  

  @override
  Widget build(BuildContext context) {
    final listaPokemon = Provider.of<PokemonProvider>(context);
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: EdgeInsets.only(left: size.width / 4.5),
      child: Container(
        color: Colors.red,
        width: size.width * 0.9,
        alignment: Alignment.center,

        height: 50,
        child: ListView.builder(
            itemCount: pokemon.length,
            scrollDirection: Axis.horizontal,
            itemBuilder: ((context, index) {
              return Padding(
                padding: const EdgeInsets.only(right: 2),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  crossAxisAlignment: CrossAxisAlignment.center,
                  children: [
                    Expanded(
                      child: ElevatedButton(
                          style: ButtonStyle(
                              shape: MaterialStateProperty.all<
                                      RoundedRectangleBorder>(
                                  RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(18.0),
                          ))),
                          onPressed: () {
                            listaPokemon.getPokemonModel(pokemon[index].name!);
                            listaPokemon.remove();
                          },
                          child: Text(pokemon[index].name!)),
                    ),


                    

                    
                  ],
                ),
              );
            })),
      ),
    );
  }
}
