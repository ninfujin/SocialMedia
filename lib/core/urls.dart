// const String baseurl = 'https://z9c1mk58-7002.inc1.devtunnels.ms/api';
const String baseurl = 'http://localhost:7002/api';
const String websocketUrl = 'wss://z9c1mk58-7002.inc1.devtunnels.ms/';
//signup
const String signup = '/users/send-otp';
const String otpurl = '/users/verify-otp';
const String loginurl = '/users/login';
//验证码登陆
const String loginverificationurl = '/users/login';
//post
const String addposturl = '/posts/addPost';
const String fetchposturl = '/posts/getpost';
const String fetchuserposturl = '/posts/getuserpost';
const String deleteposturl = '/posts/delete-post';
const String editposturl = '/posts/update-post';
const String followersposturl = '/posts/allfollowingsPost';
const String postlikeurl = '/posts/like-post';
const String postunlikeurl = '/posts/unlike-post';
const String fetchcommentsurl = '/posts/fetch-comments';
const String addcommenturl = '/posts/add-comment';
const String deletecommenturl = '/posts/delete-comment';
const String saveposturl = '/posts/savePost';
const String unsaveposturl = '/posts/savePosts';
const String reportposturl = '/posts/report-post';
const String savedposturl = '/posts/savePosts';
const String exploreposturl = '/posts/exploreposts';

//users
const String connectioncounturl = '/users/get-count';
const String loginuserurl = '/users/getuser';
const String editprofileurl = '/users/edit-profile';
const String suggessionurl = '/users/fetch-users';
const String followuserurl = '/users/follow';
const String unfollowuserurl = '/users/unfollow';
const String isfollowingurl = '/users/isFollowing';
const String fetchfollowingurl = '/users/fetch-following';
const String fetchfollowersurl = '/users/fetch-followers';
const String searchusersurl = '/users/searchallusers?searchQuery=';
const String getSingleuserurl = '/users/get-single-user';
const String notificationurl = '/users/notifications';

//chats
const String getconversationurl = '/chats/conversation';
const String createconversationurl = '/chats/conversation';
const String addmessageurl = '/chats/message';
const String getallmessageurl = '/chats/message';

//google urls
const String googleLoginurl = '/users/google-login';
const String verifyOtpReset = '/users/verifyOtp?email=';
const String forgotPasswordurl = '/users/forgotPassword?email=';
const String updatePasswordurl = '/users/changepassword';
