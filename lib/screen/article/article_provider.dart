import '../../service/error/error_model.dart';
import '../base/base_provider.dart';
import '../home/weather_model.dart';

class ArticleProvider extends BaseProvider {
  ArticleProvider(
    super.context, {
    required this.temperature,
    required this.unit,
    required this.country,
  });

  final int defaultPageNo = 1;
  final int defaultPageSize = 20;
  int pageNo = 1;

  bool _cancelPagination = false;

  final double temperature;
  final String unit;
  final String? country;
  String? _fromDate;
  String? _toDate;
  List<NewsHeadline> _headlines = [];

  void initWidget() async {
    if (settingDetail.category != null) {
      _getCategoryNews(settingDetail.category!, defaultPageSize, defaultPageNo);
    } else {
      _getHeadlines(defaultPageSize, defaultPageNo);
    }
  }

  String get _category {
    var temp = fahrenheitToCelsius();
    String query;
    if (temp < 10) {
      query = 'cold';
    } else if (temp > 30) {
      query = 'hot';
    } else {
      query = 'cool';
    }
    return query;
  }

  double fahrenheitToCelsius() {
    return unit.toUpperCase() == 'C' ? temperature : (temperature - 32) * 0.625;
  }

  Future<void> _getHeadlines(int pageSize, int pageNo) async {
    progressState = ProgressStatus.loading;
    notifyListeners();
    //set country to null if need add country
    (await newsRepository.getHeadline(country, pageSize, pageNo, _category)).fold(
      (Failure failure) {
        progressState = ProgressStatus.error;
        super.failure = failure;
        notifyListeners();
      },
      (List<NewsHeadline> headlines) {
        _headlines = headlines.where((e) => !e.title.startsWith('[Remove')).toList();
        if (_headlines.isEmpty) {
          progressState = ProgressStatus.error;
          failure = Failure.unknown('No Articles found');
        } else {
          progressState = ProgressStatus.success;
        }
        notifyListeners();
      },
    );
  }

  Future<void> _getCategoryNews(String query, int pageSize, int pageNo) async {
    progressState = ProgressStatus.loading;
    notifyListeners();
    (await newsRepository.getNewsHeadline(query, pageSize, pageNo, _fromDate, _toDate)).fold(
      (Failure failure) {
        progressState = ProgressStatus.error;
        super.failure = failure;
        notifyListeners();
      },
      (List<NewsHeadline> headlines) {
        _headlines = headlines.where((e) => !e.title.startsWith('[Remove')).toList();
        progressState = ProgressStatus.success;
        notifyListeners();
      },
    );
  }

  Future<void> getCategoryPagination() async {
    if (settingDetail.category != null) {
      _getCategoryPagination(settingDetail.category!);
    } else {
      _getHeadlinePagination();
    }
  }

  Future<void> _getHeadlinePagination() async {
    if (_cancelPagination) return;
    progressDialog.show();
    pageNo = pageNo + defaultPageNo;
    //set country to null if need add country
    (await newsRepository.getHeadline(country, defaultPageSize, pageNo, _category)).fold(
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
        var temp = headlines.where((e) => !e.title.startsWith('[Remove')).toList();
        _headlines.addAll(temp);
        progressDialog.dismiss();
        notifyListeners();
      },
    );
  }

  Future<void> _getCategoryPagination(String query) async {
    if (_cancelPagination) return;
    progressDialog.show();
    pageNo = pageNo + defaultPageNo;
    (await newsRepository.getNewsHeadline(query, defaultPageSize, pageNo, _fromDate, _toDate)).fold(
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
        var temp = headlines.where((e) => !e.title.startsWith('[Remove')).toList();
        _headlines.addAll(temp);
        progressDialog.dismiss();
        notifyListeners();
      },
    );
  }

  List<NewsHeadline> get headlines => _headlines;

  bool get cancelPagination => _cancelPagination;
}
