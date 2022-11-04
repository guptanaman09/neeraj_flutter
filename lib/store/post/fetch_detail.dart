import 'package:mobx/mobx.dart';
import 'package:neeraj_flutter_app/data/network/api_repository.dart';
import 'package:neeraj_flutter_app/models/agent_detail_model.dart';
part "fetch_detail.g.dart";

///Created by Naman Gupta on 26/4/21.

class FetchDetail = _FetchDetailStore with _$FetchDetail;

abstract class _FetchDetailStore with Store {
  @observable
  ObservableFuture<AgentDetail>? _agentDetail;

  @action
  ObservableFuture<AgentDetail> fetchAgentDetail() =>
      _agentDetail = ObservableFuture(ApiRepository().getAgentDetails());
}
