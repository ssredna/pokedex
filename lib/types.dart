import 'package:flutter/material.dart';

class PokeType {
  String name;
  List<String> doubleDamageFrom;
  List<String> doubleDamageTo;
  List<String> halfDamageFrom;
  List<String> halfDamageTo;
  List<String> noDamageFrom;
  List<String> noDamageTo;

  PokeType.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    doubleDamageFrom = new List<String>();
    json['damage_relations']['double_damage_from'].forEach((type) {
      doubleDamageFrom.add(type['name']);
    });
    doubleDamageTo = new List<String>();
    json['damage_relations']['double_damage_to'].forEach((type) {
      doubleDamageTo.add(type['name']);
    });
    halfDamageFrom = new List<String>();
    json['damage_relations']['half_damage_from'].forEach((type) {
      halfDamageFrom.add(type['name']);
    });
    halfDamageTo = new List<String>();
    json['damage_relations']['half_damage_to'].forEach((type) {
      halfDamageTo.add(type['name']);
    });
    noDamageFrom = new List<String>();
    json['damage_relations']['no_damage_from'].forEach((type) {
      noDamageFrom.add(type['name']);
    });
    noDamageTo = new List<String>();
    json['damage_relations']['no_damage_to'].forEach((type) {
      noDamageTo.add(type['name']);
    });
  }
}

const TypeColors = {
  'normal': Color(0xFFADA594),
  'fighting': Color(0xFFA55239),
  'flying': Color(0xFF9CADF7),
  'poison': Color(0xFFB55AA5),
  'ground': Color(0xFFD6B55A),
  'rock': Color(0xFFBDA55A),
  'bug': Color(0xFFADBD21),
  'ghost': Color(0xFF6363B5),
  'steel': Color(0xFFADADC6),
  'fire': Color(0xFFF75231),
  'water': Color(0xFF399CFF),
  'grass': Color(0xFF7BCE52),
  'electric': Color(0xFFFFC631),
  'psychic': Color(0xFFFF73A5),
  'ice': Color(0xFF5ACEE7),
  'dragon': Color(0xFF7B63E7),
  'dark': Color(0xFF735A4A),
  'fairy': Color(0xFFF7B5F7),
};
