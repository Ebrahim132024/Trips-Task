import 'package:webtriplist/app_exports.dart';
import 'package:webtriplist/domain/usecases/get_trips.dart';

/// ViewModel (MVVM) responsible for fetching and holding trips state.
class TripsViewModel extends ChangeNotifier {
  final GetTrips _getTripsUseCase;

  TripsViewModel(this._getTripsUseCase);

  List<Trip> _trips = [];
  bool _isLoading = false;
  String? _error;

  List<Trip> get trips => _trips;
  bool get isLoading => _isLoading;
  String? get error => _error;

  /// Loads trips from the repository via GetTrips use case.
  Future<void> loadTrips() async {
    _isLoading = true;
    _error = null;
    notifyListeners();

    final result = await _getTripsUseCase();

    result.fold(
          (failure) {
        _error = failure.message;
        _trips = [];
      },
          (data) {
        _trips = data;
      },
    );

    _isLoading = false;
    notifyListeners();
  }

  /// Refresh trips manually (e.g., pull-to-refresh)
  Future<void> refreshTrips() async {
    await loadTrips();
  }
}
