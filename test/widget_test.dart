import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:furniture_app_ui/main.dart';
import 'package:furniture_app_ui/models/collection_model.dart';
import 'package:furniture_app_ui/models/collection_detail_model.dart';
import 'package:furniture_app_ui/screens/collection_detail_page.dart';
import 'package:furniture_app_ui/screens/product_detail_page.dart';

void main() {
  final viewports = [
    {'name': 'Compact iPhone SE', 'width': 375.0, 'height': 667.0, 'pixelRatio': 2.0},
    {'name': 'Standard iPhone 15', 'width': 393.0, 'height': 852.0, 'pixelRatio': 3.0},
    {'name': 'Large iPhone 15 Pro Max', 'width': 430.0, 'height': 932.0, 'pixelRatio': 3.0},
  ];

  for (final vp in viewports) {
    testWidgets('HomePage adapts to ${vp['name']} without overflow',
        (WidgetTester tester) async {
      final width = (vp['width'] as double) * (vp['pixelRatio'] as double);
      final height = (vp['height'] as double) * (vp['pixelRatio'] as double);
      tester.view.physicalSize = Size(width, height);
      tester.view.devicePixelRatio = vp['pixelRatio'] as double;
      addTearDown(tester.view.resetPhysicalSize);
      addTearDown(tester.view.resetDevicePixelRatio);

      await tester.pumpWidget(const MyApp());
      await tester.pumpAndSettle();

      expect(find.textContaining('NEW'), findsOneWidget);
      expect(find.textContaining('COLLECTION'), findsOneWidget);
      expect(find.text('All'), findsOneWidget);
    });
  }

  testWidgets('CollectionDetailPage renders without overflow',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final mockCollection = CollectionModel(
      name: 'Outdoor Armchair',
      price: '499',
      description: 'Handcrafted outdoor lounge furniture.',
      imagePath: 'assets/images/1.jpg',
      collectionProducts: [
        CollectionDetailsModel(
          name: 'Echo Lounge Chair',
          price: '499',
          imagePath: 'assets/images/1.jpg',
          description: 'A beautifully balanced outdoor armchair with teak accents.',
        ),
      ],
    );

    await tester.pumpWidget(
      MaterialApp(
        home: CollectionDetailPage(collectionType: mockCollection),
      ),
    );
    await tester.pump();

    expect(find.textContaining('\$499'), findsOneWidget);
    expect(find.byIcon(Icons.home_filled), findsOneWidget);
  });

  testWidgets('ProductDetailsPage renders without overflow',
      (WidgetTester tester) async {
    tester.view.physicalSize = const Size(1170, 2532);
    tester.view.devicePixelRatio = 3.0;
    addTearDown(tester.view.resetPhysicalSize);
    addTearDown(tester.view.resetDevicePixelRatio);

    final mockProduct = CollectionDetailsModel(
      name: 'Echo Lounge Chair',
      price: '499',
      imagePath: 'assets/images/1.jpg',
      description: 'A beautifully balanced outdoor armchair with teak accents.',
    );

    await tester.pumpWidget(
      MaterialApp(
        home: ProductDetailsPage(product: mockProduct),
      ),
    );
    await tester.pump();

    expect(find.text('BUY NOW'), findsOneWidget);
    expect(find.textContaining('\$499'), findsOneWidget);
  });
}
