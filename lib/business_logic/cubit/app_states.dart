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

class AddMatchLoadingState extends AppStates {}
class AddMatchSuccessState extends AppStates {}
class AddMatchErrorState extends AppStates {}

class GetCountryLoadingState extends AppStates {}
class GetCountrySuccessState extends AppStates {}
class GetCountryErrorState extends AppStates {}

class SelectedTeam1State extends AppStates {}
class SelectedTeam2State extends AppStates {}
class SelectedTimeState extends AppStates {}
