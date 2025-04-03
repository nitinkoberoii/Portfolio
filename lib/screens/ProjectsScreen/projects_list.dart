class ProjectsList {
  static const List<Map<String, dynamic>> projects = [
    {
      'type': 'Personal',
      'title': "Nitin's Portfolio",
      'link': [
        "https://github.com/nitinkoberoii/Portfolio",
      ],
      'techStack': [
        'images/skills/flutter.png',
        'images/skills/dart.png',
      ],
      'imagePath': "images/projects/photo.jpeg",
      'readme': "",
    },
    {
      'type': 'Flutter + Firebase',
      'title': "DiscussIt",
      'link': [
        "https://github.com/nitinkoberoii/DiscussIt",
      ],
      'techStack': [
        'images/skills/flutter.png',
        'images/skills/dart.png',
        'images/skills/firebase.png',
        'images/skills/firestore.png',
      ],
      'imagePath': "images/projects/discussit.png",
      'readme':
          '''DiscussIt is a responsive reddit clone built on my journey to learn full stack App-Development using Flutter and Firebase.
This app contains most of the popular features of reddit such as creating & editing communities, posting on communities, etc. The user can login via google as well as via email and password. The user can add moderators of the community, the moderators can edit the community profiles, etc. User can add different types of posts containing either link, text or image. The post has a feature of upvoting, downvoting and commenting. The app also has the feature of toggling themes.
Tech Stack:-
- Flutter (Frontend)
- Firebase (Backend)
- Riverpod (State Management)''',
    },
    {
      'type': 'Flutter + Firebase',
      'title': "Zoom Clone",
      'link': [
        "https://github.com/nitinkoberoii/Zoom-Clone",
      ],
      'techStack': [
        'images/skills/flutter.png',
        'images/skills/dart.png',
        'images/skills/firebase.png',
        'images/skills/jitsi_meet.png',
      ],
      'imagePath': "images/projects/zoom.png",
      'readme':
          '''Zoom-Clone is a clone built on my journey to learn full stack App-Development using Flutter and Firebase.
The app contains the core features of the famous video conferencing application: Zoom, including creating and joining meetings and user authentication via Google or email.
Tech-Stack:-
- Flutter (Frontend)
- Firebase (Backend)
- Jitsi_Meet package for video conferencing''',
    },
    {
      'type': 'Flutter + Node.js',
      'title': "Skribbl Clone",
      'link': [
        "https://github.com/nitinkoberoii/Skribbl_Clone",
      ],
      'techStack': [
        'images/skills/flutter.png',
        'images/skills/dart.png',
        'images/skills/mongodb.png',
        'images/skills/socket.png',
        'images/skills/express.png',
        'images/skills/node.webp',
      ],
      'imagePath': "images/projects/skribbl.jpeg",
      'readme':
          '''This project is a clone of Skribbl.io, which is a word guessing game.
This project was made as a part of learning Full-Stack App Development using MongoDB, Express.js, Flutter, Node.js. The credit for this application belongs to Rivaan Ranawat. Link to his video: https://www.youtube.com/watch?v=afCVHB2xm-g&list=PLlzmAWV2yTgCjoZNF3hLX3puYJir9vSQO&index=16
Additional dart packages to be installed to run this application are:
socket_io_client
The packages that were installed using npm are:
- axios
- express
- http
- mongoose
- socket_io''',
    },
    {
      'type': 'Node.js',
      'title': "QuotesAPI",
      'link': [
        "https://github.com/nitinkoberoii/quotes-api",
        "https://quotes-api-seven.vercel.app",
      ],
      'techStack': [
        'images/skills/js.png',
        'images/skills/node.webp',
      ],
      'imagePath': "images/projects/quotes.png",
      'readme': "",
    },
    {
      'type': 'Flutter',
      'title': "Foodie UI",
      'link': [
        "https://github.com/nitinkoberoii/Foodie-App-UI-Flutter/tree/master",
      ],
      'techStack': [
        'images/skills/flutter.png',
      ],
      'imagePath': "images/projects/foodie.png",
      'readme':
          '''This Foodie App UI is inspired by the Food delivery app Ui kit designed on Figma by Marvis.
This project is not a full-fledged application, i.e., it does not contains any codes for backend. Also, not all the components of this app are functional, its mostly just the UI.
This project was made as the part of practicing Flutter App Development. The additional package used was like_button v2.0.5. pub.dev link for like_button package: https://pub.dev/packages/like_button .
Find the codes in master branch of this repository.''',
    },
    {
      'type': 'Flask + SQLite',
      'title': "Blogging Site",
      'link': [
        "https://github.com/nitinkoberoii/Blogging-Site-with-Flask-and-SQLite",
      ],
      'techStack': [
        'images/skills/flask.png',
        'images/skills/sql.png',
      ],
      'imagePath': "images/projects/blog.png",
      'readme':
          '''This project showcases a blogging webpage named 'BloggingSite'. The BloggingSite uses HTML, CSS and Bootstrap as its frontend and Flask and SQLite as its backend. To run the code, execute the 'run.py' file.
This project was made on PyCharm as my Second Year DBMS Project. This project is made by following the video tutorials of Corey Schafer's playlist "Python Flask Tutorial: Full-Featured Web App". In Pycharm, you may see some red error lines, but still the code will run successfully, unless the local server shows some error.
The dependencies/packages that are needed to be installed for the successful execution are:
- flask
- flask-wtf
- flask-bcrypt
- flask-sqlalchemy
- flask-login
- Pillow {for resizing of image, not so necessary}
- flask-mail
To view the details of the database "site.db", download the "DB Browser for SQLite".
References were taken from the YT channel: Corey Schafer :)''',
    },
  ];
}
