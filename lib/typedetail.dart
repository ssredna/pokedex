import 'package:flutter/material.dart';
import 'package:pokemon_type/effectivenesslist.dart';
import 'package:pokemon_type/types.dart';

class TypeDetail extends StatelessWidget {
  final PokeType type;

  TypeDetail({this.type});

  bodyWidget(BuildContext context) => Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: <Widget>[
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'DEFENDER',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  if (type.doubleDamageFrom.length != 0)
                    Text(
                      'Supereffective',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  EffectivenessList(typeList: type.doubleDamageFrom),
                  if (type.doubleDamageFrom.length != 0 &&
                          type.halfDamageFrom.length != 0 ||
                      type.doubleDamageFrom.length != 0 &&
                          type.noDamageFrom.length != 0)
                    const Divider(),
                  if (type.halfDamageFrom.length != 0)
                    Text(
                      'Not Very Effective',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  EffectivenessList(typeList: type.halfDamageFrom),
                  if (type.halfDamageFrom.length != 0 &&
                      type.noDamageFrom.length != 0)
                    const Divider(),
                  if (type.noDamageFrom.length != 0)
                    Text(
                      'Immune from',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  EffectivenessList(typeList: type.noDamageFrom),
                ],
              ),
            ),
            Card(
              shape: RoundedRectangleBorder(
                borderRadius: BorderRadius.circular(15.0),
              ),
              child: Column(
                children: <Widget>[
                  Padding(
                    padding: const EdgeInsets.all(4.0),
                    child: Text(
                      'ATTACKER',
                      style:
                          TextStyle(fontWeight: FontWeight.bold, fontSize: 30),
                    ),
                  ),
                  if (type.doubleDamageTo.length != 0)
                    Text(
                      'Supereffective',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  EffectivenessList(typeList: type.doubleDamageTo),
                  if (type.doubleDamageTo.length != 0 &&
                          type.halfDamageTo.length != 0 ||
                      type.doubleDamageTo.length != 0 &&
                          type.noDamageTo.length != 0)
                    const Divider(),
                  if (type.halfDamageTo.length != 0)
                    Text(
                      'Not Very Effective',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  EffectivenessList(typeList: type.halfDamageTo),
                  if (type.halfDamageTo.length != 0 &&
                      type.noDamageTo.length != 0)
                    const Divider(),
                  if (type.noDamageTo.length != 0)
                    Text(
                      'No Effect',
                      style: TextStyle(fontWeight: FontWeight.bold),
                    ),
                  EffectivenessList(typeList: type.noDamageTo),
                ],
              ),
            ),
          ],
        ),
      );

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: TypeColors[type.name],
      appBar: AppBar(
        elevation: 0.0,
        backgroundColor: TypeColors[type.name],
        title: Text(type.name),
      ),
      body: bodyWidget(context),
    );
  }
}
