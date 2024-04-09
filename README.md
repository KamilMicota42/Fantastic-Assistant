# Fantastic Assistant

<p align="center" width="100%">
    <img width="33%" src="[https://i.stack.imgur.com/RJj4x.png](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/0fe6448c-3153-4e64-b2f2-078a50e79251)">
</p>


## Summary
Fantastic Assistant - a mobile application supporting creation and management of the games and characters in the D&D 5e system.
The main work has been concerned on the creation of a mobile application that would be used as management tool by D&D players. Idea of the project was born by observing the growing popularity of the paper RPG game and the lack of the popular and optimal solution. Created system allows users to create characters and games that their friends can join. Besides that, basic functionalities, the app is friendly to new players with its in-game hints about the game system, rolling dice simulator and intuitive UI.
The thesis was prepared in seven chapters. First chapter was devoted to introduction of the thesis topic and the requirements of the application. The second chapter introduce the reader to the current mobile applications market and history of Dungeons and Dragons. Third chapter focuses on functional requirements, non-functional requirements and some selected use cases. Fourth chapter describes the system architecture and database. The fifth chapter describe all the useful information about the user interface. The sixth chapter presents contained information about the used technology, the programming environment and the implementation of functionalities. Finally, the last chapter we are summarizing the thesis and the achieved results.
The basic part of the project was made with the Dart and Flutter, app was prepared for both iOS and Android mobile system. The state management was implemented using BLoC/Cubit and GetIt. The database was created with the use of Google tools like Firebase Firestore Database or Firebase Storage.

## Use case
In order for the application to meet the results, the author decided to isolate the requirements that the system meets:
• User authorization for easier management of data associated with the account
• A system that binds users in a relationship ("friendship system")
• Character management in the D&D 5e system
  - Facilitating the management of statistics as values ​​that are dependent on each other should be overwritten when they are changed, while still allowing for a lot of freedom
• Supporting organization of games in real life
  - Creating games while giving the user the rights of a game master so that only this user has the right to edit game settings
  - Possibility to join the game as a game master or as a character in a dependency from user rights
• Dice rolling simulator

In the project only two actors were recognized: an unlogged user and logged in user. Differences between actors mainly assume changes in access to given resources and application functions. Below is descriptions of the requirements for each actor.
User not logged in:
• Registration to the system
• Password reminder
• Sending an e-mail to complete the registration process
• Login to the system
Logged in user (player):
• Logging out of the system
• Account deletion (in order to meet the conditions for registering the application in the App Store)
• Displays information useful in the error reporting process
• Reporting an error
• Changing your username
• View users
• Inviting users to your friends list
• Accept or decline friend list invitations
• Character creation and editing
• Adding your characters to the game
• View game information
• Using the dice rolling simulator (in public or private mode)
• Game creation and editing
• Displaying information about characters present in the game (without viewing their notes)

![Screenshot 2024-04-09 at 17 40 24](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/e08cd698-e573-4d37-be36-c45e8afeaa8f)

## Database
![Screenshot 2024-04-09 at 17 42 00](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/9a803496-fccc-4d58-a614-a2dcb55371c5)

## Technology stack
Dart, Flutter, Cubit, GetIt, AutoRoute, Shared preferences, Firebase – Authentication, Database, Storage

## User interface
### Authentication flow

![Screenshot 2024-04-09 at 18 55 29](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/696ba39f-5263-4497-afe6-982927230f19)
![Screenshot 2024-04-09 at 18 56 54](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/91b74a7b-6a98-413b-8b80-13f1969b5c39)
![Screenshot 2024-04-09 at 18 57 07](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/4e2efe69-368c-4199-9737-2c4fd8b02bc4)
![Screenshot 2024-04-09 at 18 57 22](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/a044442a-f93b-4cd9-8c08-12a6d2d29c56)
![Screenshot 2024-04-09 at 18 57 35](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/63354d83-de0c-4e25-95e9-8329ef8d01e9)

### Settings flow

![Screenshot 2024-04-09 at 18 57 44](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/66b14eb1-9bf3-4c1d-92d4-ed41aec3d8c3)
![Screenshot 2024-04-09 at 18 57 55](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/2a3563f9-0c0e-4c11-85de-58468078b2a8)
![Screenshot 2024-04-09 at 18 58 07](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/8091c457-3581-4a04-a01e-e82afbd1bcda)
![Screenshot 2024-04-09 at 18 58 22](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/00e2726c-53db-4922-9130-a6297f61a7a5)

### Characters flow

![Screenshot 2024-04-09 at 18 58 43](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/6e6cc942-24f0-4f55-b065-136df93b3b9a)
![Screenshot 2024-04-09 at 18 58 56](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/ba6e3fa8-05ab-4f44-b059-ef8fb3f09d33)
![Screenshot 2024-04-09 at 18 59 10](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/cd0bfc12-77c7-4445-872a-259c70981dc1)
![Screenshot 2024-04-09 at 18 59 21](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/20e0b0de-60b8-40d8-9bff-2072ce4a20f7)
![Screenshot 2024-04-09 at 18 59 36](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/dc51fb23-1dd0-49fb-b701-1f58745147e5)
![Screenshot 2024-04-09 at 18 59 51](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/a25da44e-5512-462c-9144-c5fcaaa512a2)
![Screenshot 2024-04-09 at 19 00 07](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/0ca3a280-f0a6-4b63-a8ff-93b6531bf861)

### Games flow

![Screenshot 2024-04-09 at 19 00 18](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/8e6a6c0b-f0d7-4d93-9d41-97fa1585b323)
![Screenshot 2024-04-09 at 19 00 30](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/03352413-3f61-49be-a7a2-6d25d9ec08e2)
![Screenshot 2024-04-09 at 19 00 51](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/492934b5-2670-4395-94fa-25f871630c6c)
![Screenshot 2024-04-09 at 19 01 05](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/3007e22e-02f4-4177-aadf-90b6cc4a224c)
![Screenshot 2024-04-09 at 19 01 22](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/4b34e082-5b9a-4f3d-8755-0214b300e017)
![Screenshot 2024-04-09 at 19 01 30](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/ec8900cf-b83b-41fc-b43a-91a48736a7e5)
![Screenshot 2024-04-09 at 19 01 47](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/bcbb4a91-3d1f-49e4-8d16-f2ae65ca3a43)
![Screenshot 2024-04-09 at 19 01 59](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/be39acfa-1e3b-42a3-bd01-ac68ec49b83f)
![Screenshot 2024-04-09 at 19 02 14](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/c1cd83e2-0be5-4160-8e5b-371da45ed885)
![Screenshot 2024-04-09 at 19 02 23](https://github.com/KamilMicota42/Fantastic-Assistant/assets/85360923/2d3bd6c0-f847-48a5-a30b-8cbc6d4ea9a8)
