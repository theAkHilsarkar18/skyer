import 'package:skyer/view/home/home_screen.dart';
import 'package:skyer/view/notification/notification_screen.dart';
import 'package:skyer/view/profile/profile_screen.dart';
import 'package:skyer/view/search/search_screen.dart';

class Globals {
  static double defaultPadding = 10;

  static String profileImageUrl =
      "https://st4.depositphotos.com/1049680/38133/i/450/depositphotos_381334736-stock-photo-young-handsome-man-beard-wearing.jpg";

  static String profileImageUrl1 =
      "https://encrypted-tbn0.gstatic.com/images?q=tbn:ANd9GcRpTkw6Wj7PHREerdtSv3U6Xl3QQ0zjQQXzRQ&usqp=CAU";

  static String profileImageUrl2 =
      "https://i.pinimg.com/564x/7f/ed/d8/7fedd865ab68b401303c07d61f64be97.jpg";

  static String profileImageUrl3 =
      "https://miro.medium.com/v2/resize:fit:1334/1*yuP7XB_YW7VUsE_QskrSHA.jpeg";

  static String profileImageUrl4 =
      "https://dl.memuplay.com/new_market/img/com.vicman.newprofilepic.icon.2022-06-07-21-33-07.png";

  static String postImageUrl1 =
      "https://miro.medium.com/v2/resize:fit:1400/1*EB45EWHOOdf7gKXSgPkw5g.jpeg";
  static String postImageUrl2 =
      "https://assets.justinmind.com/wp-content/uploads/2019/08/mobile-banking-app-design-best-ui-patterns-1.png";

  static String postImageUrl3 =
      "https://uizard.io/static/caa7d40a71098a0e19eb7b25adadf2cd/a8e47/a8e8141c38a64c50b304eb3e84e0de440f4f0b3f-1440x835.png";
  static String postImageUrl4 =
      "https://i.pinimg.com/originals/e7/91/7b/e7917bd13b3bc31c7242e72bdea42fa2.png";

  static String username = "John Doe";
  static String username1 = "Heena Ahmed";
  static String username2 = "Ayesha Patel";
  static String username3 = "Sara Khan";
  static String username4 = "Mehran Naseer";

  static String userLocation = "Los Angeles, CA";
  static String userBio =
      "When the whole world is silent even one voice becomes powerful – Malala Yousafzai";

  static String userPost = '190';
  static String userFollower = '1.5M';
  static String userFollowing = '71';
  static String userProfession = 'Flutter Developer';

  static String userPostDescription =
      "Hello, My name is John Doe. I am a Flutter Developer. I love My app is awesome and I love it and I love it...: ). and my hobby are playing cricket and football";
  static String accountFollowNotificationText =
      'Heena Ahmed started following you';

  static String accountFollowRequestNotificationText =
      'Ayesha Patel requested to follow you';

  static String accountLikeNotificationText = 'Sara Khan liked your post';

  static String accountCommentNotificationText = 'Mehran Naseer commented :';
  static String accountCommentText = "Incredible 🤩";

  static String followRequestText = "requested to follow you.";
  static String followText = "started following you.";
  static String likeText = "liked your post.";
  static String commentText = "commented on your post.";


  static List postImageUrlList = [
    postImageUrl1,
    postImageUrl2,
    postImageUrl3,
    postImageUrl4
  ];

  static List profileImageUrlList = [
    profileImageUrl2,
    profileImageUrl1,
    profileImageUrl3,
    profileImageUrl4
  ];

  static List usernameList = [username1, username2, username3, username4];
  static List professionList = [
    "UI/UX Designer",
    "Software Developer",
    "Data Scientist",
    "Data Analyst"
  ];

  static List screenList = [
    const HomeScreen(),
    const SearchScreen(),
    const HomeScreen(),
    const NotificationScreen(),
    const ProfileScreen(),
  ];
  static int screenIndex = 0;
}
