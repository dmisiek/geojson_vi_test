import 'package:flutter/material.dart';
import 'package:geojson_vi/geojson_vi.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'geojson_vi_test',
      theme: ThemeData(
        colorScheme: ColorScheme.fromSeed(seedColor: Colors.deepPurple),
        useMaterial3: true,
      ),
      home: const MyHomePage(),
    );
  }
}

class MyHomePage extends StatelessWidget {
  const MyHomePage({super.key});


  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: Theme.of(context).colorScheme.inversePrimary,
        title: const Text('geojson_vi_test'),
      ),
      body: const Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            EqualizePolygonsWidget(),
            SizedBox(height: 64),
            EqualizeMultiPolygonsWidget(),
            SizedBox(height: 64),
            EqualizeMultiLineStringWidget(),
          ],
        ),
      ),
    );
  }
}

class EqualizePolygonsWidget extends StatefulWidget {
  const EqualizePolygonsWidget({super.key});

  @override
  State<EqualizePolygonsWidget> createState() => _EqualizePolygonsWidgetState();
}

class _EqualizePolygonsWidgetState extends State<EqualizePolygonsWidget> {
  bool? areTheSame;

  final GeoJSONPolygon polygon1 = GeoJSONPolygon([
    [
      [52.4521864884, 12.1785392041],
      [51.7797652229, 11.0150384965],
      [52.4505177834, 12.1797242661],
      [52.1892481515, 13.0588159567],
      [52.4521864884, 12.1785392041],
    ]
  ]);

  final GeoJSONPolygon polygon2 = GeoJSONPolygon([
    [
      [54.4272137798, 19.5579048776],
      [54.3719822537, 20.0048724747],
      [54.3475951627, 20.3998495924],
      [54.2990968883, 20.8624848097],
      [54.2917987855, 21.2556333474],
      [54.2778378489, 21.6685639705],
      [54.2987774772, 22.0515720846],
      [54.3057549845, 22.3567816755],
      [54.3095313063, 22.9055102464],
      [54.3707291447, 22.843588342],
      [54.3506130036, 21.0521602868],
      [54.3995171094, 20.3242537206],
      [54.4299916745, 19.9540665548],
      [54.4609241823, 19.6297495908],
      [54.4272137798, 19.5579048776],
    ]
  ]);

  final GeoJSONPolygon polygon3 = GeoJSONPolygon([
    [
      [54.2222222222, 19.2222222222],
      [54.3719822537, 20.0048724747],
      [54.3475951627, 20.3998495924],
      [54.2990968883, 20.8624848097],
      [54.2917987855, 21.2556333474],
      [54.2778378489, 21.6685639705],
      [54.2987774772, 22.0515720846],
      [54.3057549845, 22.3567816755],
      [54.3095313063, 22.9055102464],
      [54.3707291447, 22.843588342],
      [54.3506130036, 21.0521602868],
      [54.3995171094, 20.3242537206],
      [54.4299916745, 19.9540665548],
      [54.4609241823, 19.6297495908],
      [54.2222222222, 19.2222222222],
    ]
  ]);

  void equalizeSmallerToBigger() {
    areTheSame = polygon1 == polygon2;
    setState(() {});
  }

  void equalizeBiggerToSmaller() {
    areTheSame = polygon2 == polygon1;
    setState(() {});
  }

  void equalizeSameSize() {
    areTheSame = polygon2 == polygon3;
    setState(() {});
  }

  void equalizeSamePolygons() {
    areTheSame = polygon2 == polygon2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Equalize Polygons', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 32),
        const Text('Equalize result: '),
        Text('$areTheSame', style: Theme.of(context).textTheme.headlineMedium),
        Wrap(
          children: [
            FilledButton(
              onPressed: equalizeBiggerToSmaller,
              child: const Text('Bigger to smaller'),
            ),
            FilledButton.tonal(
              onPressed: equalizeSmallerToBigger,
              child: const Text('Smaller to bigger'),
            ),
            FilledButton.tonal(
              onPressed: equalizeSameSize,
              child: const Text('Equalize same sizes'),
            ),
            FilledButton.tonal(
              onPressed: equalizeSamePolygons,
              child: const Text('Equalize same polygons'),
            ),
          ],
        )
      ],
    );
  }
}

class EqualizeMultiPolygonsWidget extends StatefulWidget {
  const EqualizeMultiPolygonsWidget({super.key});

  @override
  State<EqualizeMultiPolygonsWidget> createState() => _EqualizeMultiPolygonsWidgetState();
}

class _EqualizeMultiPolygonsWidgetState extends State<EqualizeMultiPolygonsWidget> {
  bool? areTheSame;

  final GeoJSONMultiPolygon multipolygon1 = GeoJSONMultiPolygon([
    [
      [
        [52.4521864884, 12.1785392041],
        [51.7797652229, 11.0150384965],
        [52.4505177834, 12.1797242661],
        [52.1892481515, 13.0588159567],
        [52.4521864884, 12.1785392041],
      ],
      [
        [54.4272137798, 19.5579048776],
        [54.3719822537, 20.0048724747],
        [54.3475951627, 20.3998495924],
        [54.2990968883, 20.8624848097],
        [54.2917987855, 21.2556333474],
        [54.2778378489, 21.6685639705],
        [54.2987774772, 22.0515720846],
        [54.3057549845, 22.3567816755],
        [54.3095313063, 22.9055102464],
        [54.3707291447, 22.843588342],
        [54.3506130036, 21.0521602868],
        [54.3995171094, 20.3242537206],
        [54.4299916745, 19.9540665548],
        [54.4609241823, 19.6297495908],
        [54.4272137798, 19.5579048776],
      ],
    ]
  ]);

  final GeoJSONMultiPolygon multipolygon2 = GeoJSONMultiPolygon([
    [
      [
        [54.4272137798, 19.5579048776],
        [54.3719822537, 20.0048724747],
        [54.3475951627, 20.3998495924],
        [54.2990968883, 20.8624848097],
        [54.2917987855, 21.2556333474],
        [54.2778378489, 21.6685639705],
        [54.2987774772, 22.0515720846],
        [54.3057549845, 22.3567816755],
        [54.3095313063, 22.9055102464],
        [54.3707291447, 22.843588342],
        [54.3506130036, 21.0521602868],
        [54.3995171094, 20.3242537206],
        [54.4299916745, 19.9540665548],
        [54.4609241823, 19.6297495908],
        [54.4272137798, 19.5579048776],
      ],
      [
        [52.4521864884, 12.1785392041],
        [51.7797652229, 11.0150384965],
        [52.4505177834, 12.1797242661],
        [52.1892481515, 13.0588159567],
        [52.4521864884, 12.1785392041],
      ],
    ]
  ]);

  final GeoJSONMultiPolygon multipolygon3 = GeoJSONMultiPolygon([
    [
      [
        [54.2222222222, 19.2222222222],
        [54.3719822537, 20.0048724747],
        [54.3475951627, 20.3998495924],
        [54.2990968883, 20.8624848097],
        [54.2917987855, 21.2556333474],
        [54.2778378489, 21.6685639705],
        [54.2987774772, 22.0515720846],
        [54.3057549845, 22.3567816755],
        [54.3095313063, 22.9055102464],
        [54.3707291447, 22.843588342],
        [54.3506130036, 21.0521602868],
        [54.3995171094, 20.3242537206],
        [54.4299916745, 19.9540665548],
        [54.4609241823, 19.6297495908],
        [54.2222222222, 19.2222222222],
      ],
      [
        [52.4521864884, 12.1785392041],
        [51.7797652229, 11.0150384965],
        [52.4505177834, 12.1797242661],
        [52.1892481515, 13.0588159567],
        [52.4521864884, 12.1785392041],
      ],
    ]
  ]);

  void equalizeMultiPolygonsWithDifferentSizes() {
    areTheSame = multipolygon1 == multipolygon2;
    setState(() {});
  }

  void equalizeSameSizes() {
    areTheSame = multipolygon2 == multipolygon3;
    setState(() {});
  }

  void equalizeSameMultiPolygons() {
    areTheSame = multipolygon2 == multipolygon2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Equalize Multi Polygons', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 32),
        const Text('Equalize result: '),
        Text('$areTheSame', style: Theme.of(context).textTheme.headlineMedium),
        Wrap(
          children: [
            FilledButton(
              onPressed: equalizeMultiPolygonsWithDifferentSizes,
              child: const Text('Equalize different sizes'),
            ),
            FilledButton.tonal(
              onPressed: equalizeSameSizes,
              child: const Text('Equalize same sizes'),
            ),
            FilledButton.tonal(
              onPressed: equalizeSameMultiPolygons,
              child: const Text('Equalize same polygons'),
            ),
          ],
        )
      ],
    );
  }
}

class EqualizeMultiLineStringWidget extends StatefulWidget {
  const EqualizeMultiLineStringWidget({super.key});

  @override
  State<EqualizeMultiLineStringWidget> createState() => _EqualizeMultiLineStringWidgetState();
}

class _EqualizeMultiLineStringWidgetState extends State<EqualizeMultiLineStringWidget> {
  bool? areTheSame;

  final GeoJSONMultiLineString multistring1 = GeoJSONMultiLineString([
    [
      [52.4521864884, 12.1785392041],
      [51.7797652229, 11.0150384965],
      [52.4505177834, 12.1797242661],
      [52.1892481515, 13.0588159567],
      [52.4521864884, 12.1785392041],
    ],
    [
      [54.4272137798, 19.5579048776],
      [54.3719822537, 20.0048724747],
      [54.3475951627, 20.3998495924],
      [54.2990968883, 20.8624848097],
      [54.2917987855, 21.2556333474],
      [54.2778378489, 21.6685639705],
      [54.2987774772, 22.0515720846],
      [54.3057549845, 22.3567816755],
      [54.3095313063, 22.9055102464],
      [54.3707291447, 22.843588342],
      [54.3506130036, 21.0521602868],
      [54.3995171094, 20.3242537206],
      [54.4299916745, 19.9540665548],
      [54.4609241823, 19.6297495908],
      [54.4272137798, 19.5579048776],
    ],
  ]);

  final GeoJSONMultiLineString multistring2 = GeoJSONMultiLineString([
    [
      [54.4272137798, 19.5579048776],
      [54.3719822537, 20.0048724747],
      [54.3475951627, 20.3998495924],
      [54.2990968883, 20.8624848097],
      [54.2917987855, 21.2556333474],
      [54.2778378489, 21.6685639705],
      [54.2987774772, 22.0515720846],
      [54.3057549845, 22.3567816755],
      [54.3095313063, 22.9055102464],
      [54.3707291447, 22.843588342],
      [54.3506130036, 21.0521602868],
      [54.3995171094, 20.3242537206],
      [54.4299916745, 19.9540665548],
      [54.4609241823, 19.6297495908],
      [54.4272137798, 19.5579048776],
    ],
    [
      [52.4521864884, 12.1785392041],
      [51.7797652229, 11.0150384965],
      [52.4505177834, 12.1797242661],
      [52.1892481515, 13.0588159567],
      [52.4521864884, 12.1785392041],
    ],
  ]);

  final GeoJSONMultiLineString multistring3 = GeoJSONMultiLineString([
    [
      [54.2222222222, 19.2222222222],
      [54.3719822537, 20.0048724747],
      [54.3475951627, 20.3998495924],
      [54.2990968883, 20.8624848097],
      [54.2917987855, 21.2556333474],
      [54.2778378489, 21.6685639705],
      [54.2987774772, 22.0515720846],
      [54.3057549845, 22.3567816755],
      [54.3095313063, 22.9055102464],
      [54.3707291447, 22.843588342],
      [54.3506130036, 21.0521602868],
      [54.3995171094, 20.3242537206],
      [54.4299916745, 19.9540665548],
      [54.4609241823, 19.6297495908],
      [54.2222222222, 19.2222222222],
    ],
    [
      [52.4521864884, 12.1785392041],
      [51.7797652229, 11.0150384965],
      [52.4505177834, 12.1797242661],
      [52.1892481515, 13.0588159567],
      [52.4521864884, 12.1785392041],
    ],
  ]);

  void equalizeMultiLineStringWithDifferentSizes() {
    areTheSame = multistring1 == multistring2;
    setState(() {});
  }

  void equalizeSameSizes() {
    areTheSame = multistring2 == multistring3;
    setState(() {});
  }

  void equalizeSameMultiStrings() {
    areTheSame = multistring2 == multistring2;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      mainAxisSize: MainAxisSize.min,
      children: [
        Text('Equalize Multi Line Strings', style: Theme.of(context).textTheme.bodyLarge),
        const SizedBox(height: 32),
        const Text('Equalize result: '),
        Text('$areTheSame', style: Theme.of(context).textTheme.headlineMedium),
        Wrap(
          children: [
            FilledButton(
              onPressed: equalizeMultiLineStringWithDifferentSizes,
              child: const Text('Equalize different sizes'),
            ),
            FilledButton.tonal(
              onPressed: equalizeSameSizes,
              child: const Text('Equalize same sizes'),
            ),
            FilledButton.tonal(
              onPressed: equalizeSameMultiStrings,
              child: const Text('Equalize same Multi Line Strings'),
            ),
          ],
        )
      ],
    );
  }
}
