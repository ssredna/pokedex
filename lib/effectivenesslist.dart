import 'package:flutter/material.dart';
import 'package:pokemon_type/types.dart';

class EffectivenessList extends StatelessWidget {
  final List<String> typeList;

  EffectivenessList({this.typeList});

  @override
  Widget build(BuildContext context) {
    if (typeList.length != 0)
      return Padding(
        padding: const EdgeInsets.only(left: 20, right: 20),
        child: SizedBox(
          width: double.infinity,
          child: Wrap(
            spacing: 10,
            alignment: WrapAlignment.spaceEvenly,
            children: typeList
                .map((type) => Chip(
                      backgroundColor: TypeColors[type],
                      label: Text(
                        type,
                        style: TextStyle(
                            color: Colors.white, fontWeight: FontWeight.bold),
                      ),
                    ))
                .toList(),
          ),
        ),
      );
    return Container(
      width: 0.0,
      height: 0.0,
    );
  }
}
