///Created by Naman Gupta on 19/4/21.

class ResponseListener<T> {
  Function(T)? onSuccess;
  Function(String)? onError;
  Function(bool)? showProgress;
  bool? isLive = false;

  ResponseListener(
      {this.onSuccess, this.onError, this.showProgress, this.isLive});

  updateIfLive(T t) {
    if (isLive != null && isLive!) {
      onSuccess!(t);
    }
  }

  accessTokenIfLive(String accessToken) {}

  onErrorGet(String error) {}
}
