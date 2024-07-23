// Duration constants
const Duration splashScreenDuration = Duration(seconds: 2);

// Image constants
const String logo = 'assets/images/logo.png';

// Padding, margin and radius constants
const double defaultPadding = 16.0;
const double defaultMargin = 8.0;
const double defaultBorderRadius = 20.0;

// Text constants
const String appNameText = 'JustChatting';
const String signUpText = 'Sign Up';
const String loginText = 'Login';
const String loginUsernameText = 'Enter username';
const String loginPasswordText = 'Enter password';
const String signUpNameText = 'Enter full name';
const String signUpUsernameText = 'Enter username';
const String signUpEmailText = 'Enter email';
const String signUpPhoneText = 'Enter phone number';
const String signUpPasswordText = 'Enter password';
const String searchBarText = 'Enter username to search';
const String sendMessageHintText = 'Type your message';
const String emptyHomeText = 'Your chats will appear here';
const String noUsersFoundText = 'No user found';

// API constants
const String apiBaseUrl = 'https://justchatting.onrender.com/api/v1';
const String loginEndpoint = '/auth/login';
const String signUpEndpoint = '/auth/signup';
const String userRoomsEndpoint = '/user/user_rooms';
const String userDetailsEndpoint = '/user/user_details';
const String chatRoomEndpoint = '/chat/chat_room';
const String chatHistoryEndpoint = '/chat/chat_history';
const String deleteChatEndpoint = '/chat/delete_chat';
const String socketUrl = 'https://justchatting.onrender.com';

// Header constants
const Map<String, String> apiHeader = {"Content-Type" : "application/json"};