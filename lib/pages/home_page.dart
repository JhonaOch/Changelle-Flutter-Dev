import 'package:challenge_flutter_dev/provider/pokemon_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import 'widgets/list_pokemon.dart';

class HomePage extends StatefulWidget {
  const HomePage({super.key});

  @override
  State<HomePage> createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  @override
  Widget build(BuildContext context) {
    final provider = Provider.of<PokemonProvider>(context);

    List<String> abilityname = [
      'Intimidacion',
      'Inmunidad',
      'Potencia',
      'Regeneracion',
      'Impasible',
      'Toxico'
    ];
    return Scaffold(
      appBar: AppBar(
        title: Text(
          provider.habilityList!.name.toString().toUpperCase().isNotEmpty
              ? provider.habilityList!.name.toString().toUpperCase()
              : 'Pokemon',
          style:
              const TextStyle(color: Colors.black, fontWeight: FontWeight.bold),
        ),
        centerTitle: true,
        backgroundColor: Colors.yellow,
      ),
      body: provider.pokemonList.isEmpty
          ? const Center(
              child: CircularProgressIndicator(),
            )
          : SingleChildScrollView(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const SizedBox(
                  height: 10,
                ),
                ListaPokemon(
                  pokemon: provider.pokemonList,
                ),
                const SizedBox(
                  height: 10,
                ),
                const Padding(
                  padding: EdgeInsets.all(2.0),
                  child: Align(
                    alignment: Alignment.centerLeft,
                    child: Text(
                      'Habilidades',
                      textAlign: TextAlign.end,
                      style: TextStyle(fontSize: 30),
                    ),
                  ),
                ),

                listAbility(abilityname, context),

                Row(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: const [
                    Icon(Icons.info_outline),
                    Text(
                      'Informacion de las habilidades seleccionadas',
                      style: TextStyle(fontSize: 16),
                    ),
                  ],
                ),

                const SizedBox(height: 10),

                !provider.validator
                    ? const Text('"Datos de la habilidad selecionada"')
                    : SizedBox(
                        width: double.infinity,
                        height: 100,
                        child: ListView.builder(
                            scrollDirection: Axis.horizontal,
                            itemCount: provider.abilityName.length,
                            itemBuilder: ((context, index) {
                              final name = provider.abilityName[index];

                              return Padding(
                                padding: const EdgeInsets.all(8.0),
                                child: Text('"$name "'),
                              );
                            })),
                      ),

                FadeInImage(
                  placeholder: const AssetImage(
                    'assets/img/no-image.png',
                  ),
                  image: NetworkImage(
                      provider.habilityList!.sprites!.frontDefault.toString(),
                      scale: 0.7),
                ),

                const Divider(
                  height: 10,
                  thickness: 3,
                  color: Colors.black,
                ),

                _slider(name: "Vida", provider: provider.vida),

                _slider(name: "Ataque", provider: provider.ataque),

                _slider(name: "Defensa", provider: provider.defense),

                _slider(name: "Velocidad", provider: provider.velocidad),

                ElevatedButton(onPressed: (){
                  provider.getPokemons();
                }, child: const Text('Cargar'))

                
              ],
            )),
    );
  }

  Widget _slider({required String name, required provider}) {
    return Row(
      children: [
        Text(
          name,
          style: const TextStyle(fontSize: 25),
        ),
        Slider(
          min: 0,
          value: provider,
          max: 50,
          onChanged: null,
        ),
      ],
    );
  }

  Widget listAbility(List ability, context) {
 

    
    return SizedBox(
      width: double.infinity,
      height: 100,
      child: ListView.builder(
          scrollDirection: Axis.horizontal,
          itemCount: ability.length,
          itemBuilder: ((context, index) {
      
            final String data = ability[index];
            return Column(
              children: [
                Padding(
                  padding: const EdgeInsets.all(2.0),
                  child: ElevatedButton(
                    onPressed: (){
                      habilidad(context, data, index);

                    },
                    
                    child: Text(data.toString()),
                  ),
                ),
              ],
            );
          })),
    );
  }

  habilidad(context, data, index) {
    final abilities = Provider.of<PokemonProvider>(context, listen: false);
    final seleccionName = data.toString();
    abilities.selecion(seleccionName, index);
  }
}
