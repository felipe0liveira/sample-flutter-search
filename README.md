# sample_flutter_search

That's a sample mobile application for searching users based on it's `id` and `name`.  
The UI is based on just one page, that contains a search form and the results list.

### Getting Started

> This project is based on modules and repositories

**Home Module**  
The [home](/lib/home/) module contains the it's page and controller, some widgets used by home page are inside widgets [folder](/lib/home/widgets/).

**Shared Module**  
The [shared](/lib/shared/) module contains all the shareable [models](/lib/shared/models/) and [repositories](/lib/shared/repositories/), considering a less effort scalability.

**User Entity**  
The User entity starts on it's model that is based on the [API](http://jsonplaceholder.typicode.com/users).  
The User interface was created based on the project's business rules, so basically It's possible to search for all Users or a single User could be searched by It's ID or name.

***

### Running the app

You can run the app by using your favorite IDE or you can run by typing `flutter run ios` or `flutter run ios`.