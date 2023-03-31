import 'package:dio/dio.dart';
import 'package:work_manager/collections/product.dart';
import 'package:work_manager/constants.dart';
import 'package:work_manager/httpServer.dart';
import 'package:work_manager/isarProvider.dart';
import 'package:isar/isar.dart';

class Func {
  apitoisar() async {
    HttpService httpService = HttpService();
    IsarProvider isarProv = IsarProvider();
    httpService
        .init(BaseOptions(baseUrl: baseUrl, contentType: "application/json"));
    final response = await httpService.request(
        endpoint: "products?limit=6", method: Method.GET);

    List<Map<String, dynamic>>? products = (response.data as List)
        .map((item) => item as Map<String, dynamic>)
        .toList();
    await isarProv.isar?.writeTxn(() async {
      await isarProv.isar?.products.clear();
      await isarProv.isar?.products.importJson(products);
    });
  }

  isartoapi() async {
    IsarProvider isarProv = IsarProvider();
    HttpService httpService = HttpService();
    final prodt = await isarProv.isar?.products.where().findAll();
    List<Map<String, dynamic>>? listProducts =
        prodt?.map((e) => e.toJson()).toList();
    httpService.init(BaseOptions(baseUrl: serverUrl));
    Map<String, dynamic> params = {'products': listProducts};
    await httpService.request(
        endpoint: "/products", method: Method.POST, params: params);
  }
}
