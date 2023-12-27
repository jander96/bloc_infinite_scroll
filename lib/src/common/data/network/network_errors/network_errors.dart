sealed class NetworkError {
  static NetworkError fromStatusCode(int code) => switch (code) {
        400 => BadRequest(),
        401 => UnAuthorized(),
        404 => NotFound(),
        403 => Forbidden(),
        429 => LimitExceeded(),
        _ => UnKnow()
      };
}

class ConnectionError extends NetworkError{}
class NotFound extends NetworkError{}
class Forbidden extends NetworkError{}
class UnAuthorized extends NetworkError{}
class BadRequest extends NetworkError{}
class UnKnow extends NetworkError{}
class LimitExceeded extends NetworkError{}