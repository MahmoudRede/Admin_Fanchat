abstract class AppStates{

}

class InitialState extends AppStates{

}


class GetAllMatchesLoadingState extends AppStates {}
class GetAllMatchesSuccessState extends AppStates {}
class GetAllMatchesErrorState extends AppStates {}

class UpdateMatchLoadingState extends AppStates {}
class UpdateMatchSuccessState extends AppStates {}
class UpdateMatchErrorState extends AppStates {}