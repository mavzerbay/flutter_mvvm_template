// import 'package:flutter_test/flutter_test.dart';

// import 'onboard_mock_view_model.dart';

// main() {
//   OnBoardMockViewModel mockViewModel;
//   IStringHelper stringHelper;
//   setUp(() {
//     mockViewModel = OnBoardMockViewModel();
//     stringHelper = MockStringHelper();
//     mockViewModel.init();
//   });

//   test('String Helper Upper Case', () {
//     String text = "Hello";

//     text = stringHelper.toUpper(text);

//     expect(text, text.toUpperCase());
//   });

//   // test('OnBoard Get Models', () async {
//   //   await mockViewModel.onBoardGetModels();
//   //   expect(mockViewModel.onBoardModel, isNotEmpty);
//   // });

//   // test('OnBoard Get Service Request', () {
//   //   expect(mockViewModel.isLoading, false);
//   //   mockViewModel.getServiceRequest();
//   //   expect(mockViewModel.isLoading, true);
//   // });

//   // test('OnBoard On Page Changed', () {
//   //   mockViewModel.onPageChanged(5);
//   //   expect(mockViewModel.currentPageIndex, 5);
//   // });

//   // group("Test All", () {
//   //   int onBoardLength = 0;
//   //   test('OnBoard Get Models', () async {
//   //     await mockViewModel.onBoardGetModels();
//   //     onBoardLength = mockViewModel.onBoardModel.length;
//   //     expect(mockViewModel.onBoardModel, isNotEmpty);
//   //   });

//   //   test('OnBoard On Page Changed', () {
//   //     mockViewModel.onPageChanged(onBoardLength);
//   //     expect(mockViewModel.currentPageIndex, onBoardLength);
//   //   });
//   // });
// }
