import '../../service/error/error_model.dart';
import '../base/base_provider.dart';
import '../home/weather_model.dart';

class ArticleProvider extends BaseProvider {
  ArticleProvider(
    super.context, {
    required this.temperature,
    required this.unit,
  });

  final int defaultPageNo = 1;
  final int defaultPageSize = 20;
  int pageNo = 1;

  bool _cancelPagination = false;

  final double temperature;
  final String unit;
  String? _fromDate;
  String? _toDate;
  List<NewsHeadline> _headlines = [];

  void initWidget() async {
    _getNews(defaultPageSize, defaultPageNo);
  }

  String get _query {
    if (settingDetail.category != null) return settingDetail.category!;

    var temp = fahrenheitToCelsius();
    String query;
    if (temp < 10) {
      query = 'depressing';
    } else if (temp > 30) {
      query = 'fear';
    } else {
      query = 'winning OR happiness';
    }
    return query;
  }

  double fahrenheitToCelsius() {
    return unit.toUpperCase() == 'C' ? temperature : (temperature - 32) * 0.625;
  }

  Future<void> _getNews(int pageSize, int pageNo) async {
    progressState = ProgressStatus.loading;
    notifyListeners();
    (await newsRepository.getNewsHeadline(_query, pageSize, pageNo, _fromDate, _toDate)).fold(
      (Failure failure) {
        progressState = ProgressStatus.error;
        super.failure = failure;
        notifyListeners();
      },
      (List<NewsHeadline> headlines) {
        _headlines = headlines;
        progressState = ProgressStatus.success;
        notifyListeners();
      },
    );
  }

  Future<void> getNewsPagination() async {
    if (_cancelPagination) return;
    progressDialog.show();
    pageNo = pageNo + defaultPageNo;
    (await newsRepository.getNewsHeadline(_query, defaultPageSize, pageNo, _fromDate, _toDate))
        .fold(
      (Failure failure) {
        progressState = ProgressStatus.error;
        _cancelPagination = true;
        showSnackBar(failure);
        progressDialog.dismiss();
      },
      (List<NewsHeadline> headlines) {
        if (headlines.isEmpty) {
          _cancelPagination = true;
        }
        _headlines.addAll(headlines);
        progressDialog.dismiss();
        notifyListeners();
      },
    );
  }

  List<NewsHeadline> get headlines => _headlines;

  bool get cancelPagination => _cancelPagination;
}
