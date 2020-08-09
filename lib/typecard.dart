import 'package:flutter/material.dart';
import 'package:pokemon_type/typedetail.dart';
import 'package:pokemon_type/types.dart';
import 'types.dart';

class TypeCard extends StatelessWidget {
  final PokeType type;

  TypeCard({this.type});

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(2.0),
      child: InkWell(
        onTap: () {
          Navigator.push(
              context,
              MaterialPageRoute(
                  builder: (context) => TypeDetail(
                        type: type,
                      )));
        },
        child: Card(
          elevation: 3.0,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: <Widget>[
              Text(
                type.name,
                style:
                    TextStyle(color: Colors.white, fontWeight: FontWeight.bold),
              ),
            ],
          ),
          color: TypeColors[type.name] != null
              ? TypeColors[type.name]
              : Colors.black,
        ),
      ),
    );
  }
}
