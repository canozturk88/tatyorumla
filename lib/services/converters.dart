// import 'package:chopper/chopper.dart';

// typedef JsonFactory<T> = T Function(Map<dynamic, dynamic> json);

// class Converters extends JsonConverter {
//   final Map<Type, JsonFactory> factories;

//   Converters(this.factories);

//   T? _decodeMap<T>(Map<dynamic, dynamic> values) {
//     final jsonFactory = factories[T];
//     if (jsonFactory == null || jsonFactory is! JsonFactory<T>) {
//       return null;
//     }
//     return jsonFactory(values);
//   }

//   Iterable<T> _decodeList<T>(Iterable values) => values.where((v) => v != null).map<T>((v) => _decode<T>(v)).toList();

//   dynamic _decode<T>(entity) {
//     if (entity is Iterable) return _decodeList<T>(entity);
//     if (entity is Map) return _decodeMap<T>(entity);
//     return entity;
//   }

//   @override
//   Response<ResultType> convertResponse<ResultType, Item>(Response response) {
//     final jsonRes = super.convertResponse(response);
//     return jsonRes.copyWith<ResultType>(body: _decode<Item>(jsonRes.body));
//   }
// }
