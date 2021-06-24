import 'package:connectivity/connectivity.dart';
import 'package:dio/dio.dart';
import 'package:flutter_app/http/error_handle.dart';

const int _connectTimeout = 15 * 1000;
const int _receiveTimeout = 15 * 1000;
const int _sendTimeout = 10 * 1000;

typedef Success<T> = Function(T data);
typedef Fail = Function(int code, String msg);

class HttpUtils {
  static final String baseUrl = "";
  static Dio _dio;

  // 创建 dio 实例对象
  static Dio createInstance() {
    if (_dio == null) {
      /// 全局属性：请求前缀、连接超时时间、响应超时时间
      var options = BaseOptions(
        /// 请求的Content-Type，默认值是"application/json; charset=utf-8".
        /// 如果您想以"application/x-www-form-urlencoded"格式编码请求数据,
        /// 可以设置此选项为 `Headers.formUrlEncodedContentType`,  这样[Dio]就会自动编码请求体.
        /// contentType: Headers.formUrlEncodedContentType,适用于post form表单提交
        responseType: ResponseType.json,
        validateStatus: (status) {
          // 不使用http状态码判断状态，使用AdapterInterceptor来处理（适用于标准REST风格）
          return true;
        },
        baseUrl: baseUrl,
        connectTimeout: _connectTimeout,
        receiveTimeout: _receiveTimeout,
        sendTimeout: _sendTimeout,
      );
      _dio = new Dio(options);
    }
    return _dio;
  }

  //get 请求
  static void get<T>(
    String url, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Success success,
    Fail fail,
  }) {
    request(
      Method.GET,
      url,
      data: data,
      queryParameters: queryParameters,
      success: success,
      fail: fail,
    );
  }

  //post 请求
  static void post<T>(
    String url, {
    dynamic data,
    Map<String, dynamic> queryParameters,
    Success success,
    Fail fail,
  }) {
    request(
      Method.POST,
      url,
      data: data,
      queryParameters: queryParameters,
      success: success,
      fail: fail,
    );
  }

  // 请求，返回参数为 T
  // method：请求方法，Method.POST等
  // path：请求地址
  // params：请求参数
  // success：请求成功回调
  // error：请求失败回调
  static Future request<T>(Method method, String path,
      {dynamic data,
      Map<String, dynamic> queryParameters,
      Success success,
      Fail fail}) async {
    try {
      //没有网络
      var connectivityResult = await new Connectivity().checkConnectivity();
      if (connectivityResult == ConnectivityResult.none) {
        _onError(ExceptionHandle.net_error, '网络异常，请检查你的网络！', fail);
        return;
      }
      Dio _dio = createInstance();
      Response response = await _dio.request(path,
          data: data,
          queryParameters: queryParameters,
          options: Options(method: MethodValues[method]));
      if (response != null) {
        if (success != null) {
          success(response.data);
        }
      } else {
        _onError(ExceptionHandle.unknown_error, '未知错误', fail);
      }
    } on DioError catch (e) {
      final NetError netError = ExceptionHandle.handleException(e);
      _onError(netError.code, netError.msg, fail);
    }
  }
}

void _onError(int code, String msg, Fail fail) {
  if (code == null) {
    code = -1;
    msg = '未知异常';
  }
  if (fail != null) {
    fail(code, msg);
  }
}

enum Method { GET, POST }
//使用：MethodValues[Method.POST]
const MethodValues = {
  Method.GET: "get",
  Method.POST: "post",
};
