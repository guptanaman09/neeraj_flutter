import 'package:dio/dio.dart';
import 'package:mobx/mobx.dart';
import 'package:neeraj_flutter_app/constants/api_constants.dart';
import 'package:neeraj_flutter_app/data/network/api_service.dart';
import 'package:neeraj_flutter_app/models/agent_detail_model.dart';

///Created by Naman Gupta on 19/4/21.
class ApiRepository extends ApiService {
  Future<AgentDetail> getAgentDetails() async {
    var data = await get(
      ApiConstants.GET_AGENT_DETAILS,
      {"agentCode": "12345678"},
    );
    return ObservableFuture.value(AgentDetail.fromMap(data.data));
  }
}
