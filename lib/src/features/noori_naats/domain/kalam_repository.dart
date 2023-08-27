import 'dart:convert';
import 'package:flutter/widgets.dart';
import 'kalam.dart';

abstract class KalamRepository {
  Future<List<Hamd>> getAllHamds();
  Future<List<Naat>> getAllNaats();
  Future<List<Manqabat>> getAllManqabats();
  Future<List<Salam>> getAllSalams();
}

class KalamRepositoryImpl implements KalamRepository {
  final BuildContext _context;

  KalamRepositoryImpl(this._context);

  @override
  Future<List<Hamd>> getAllHamds() async {
    final String json = await _loadHamdFromAsset();
    final List<Hamd> Hamds = await _parseHamd(json);

    return Hamds;
  }

  Future<String> _loadHamdFromAsset() async {
    return await DefaultAssetBundle.of(_context).loadString("assets/hamd.json");
  }

  Future<List<Hamd>> _parseHamd(String json) async {
    final String jsonString = await _loadHamdFromAsset();
    final List data = jsonDecode(jsonString) as List;
    List<Hamd> hamds = data.map((e) => Hamd.fromJson(e)).toList();

    return hamds;
  }

  @override
  Future<List<Naat>> getAllNaats() async {
    final String json = await _loadNaatFromAsset();
    final List<Naat> Naats = await _parseNaat(json);

    return Naats;
  }

  Future<String> _loadNaatFromAsset() async {
    return await DefaultAssetBundle.of(_context).loadString("assets/naat.json");
  }

  Future<List<Naat>> _parseNaat(String json) async {
    final String jsonString = await _loadNaatFromAsset();
    final List data = jsonDecode(jsonString) as List;
    List<Naat> naats = data.map((e) => Naat.fromJson(e)).toList();

    return naats;
  }

  @override
  Future<List<Manqabat>> getAllManqabats() async {
    final String json = await _loadManqabatFromAsset();
    final List<Manqabat> Manqabats = await _parseManqabat(json);

    return Manqabats;
  }

  Future<String> _loadManqabatFromAsset() async {
    return await DefaultAssetBundle.of(_context).loadString("assets/manqabat.json");
  }

  Future<List<Manqabat>> _parseManqabat(String json) async {
    final String jsonString = await _loadManqabatFromAsset();
    final List data = jsonDecode(jsonString) as List;
    List<Manqabat> manqabats = data.map((e) => Manqabat.fromJson(e)).toList();

    return manqabats;
  }

  @override
  Future<List<Salam>> getAllSalams() async {
    final String json = await _loadSalamFromAsset();
    final List<Salam> Salams = await _parseSalam(json);

    return Salams;
  }

  Future<String> _loadSalamFromAsset() async {
    return await DefaultAssetBundle.of(_context).loadString("assets/salam.json");
  }

  Future<List<Salam>> _parseSalam(String json) async {
    final String jsonString = await _loadSalamFromAsset();
    final List data = jsonDecode(jsonString) as List;
    List<Salam> salams = data.map((e) => Salam.fromJson(e)).toList();

    return salams;
  }
}

