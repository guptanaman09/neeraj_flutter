///Created by Naman Gupta on 2/11/22.

class ApiConstants {
  String live = '';
  String staging = '';
  static bool isLive = true;
  static const String APITOKEN =
      "+WeiQSAXzqIBJnNrEtd68dam0/EgAgiwai/Wg7aEh1AqlQINnOdfZkFaa/QXnVvhvhc6Q0nQJUIL9yd42nJ005J/INnOdfZkFaa/QXnVvhvhc6Q";
  static const String BASE_URL = 'https://portal-staging.aiicoplc.com/';
  static const String VERSION = 'api/TokenAuth/';
  static const String GET_AGENT_DETAILS =
      BASE_URL + VERSION + 'GetAgentDetails';
}
