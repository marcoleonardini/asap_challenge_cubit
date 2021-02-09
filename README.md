# ASAP Challenge

Flutter App Challenge
### Flutter version used

```bash

 Flutter 1.22.6 • channel stable • https://github.com/flutter/flutter.git
 Framework • revision 9b2d32b605 (3 weeks ago) • 2021-01-22 14:36:39 -0800
 Engine • revision 2f0af37152
 Tools • Dart 2.10.5
```
- It's recomended to use the same version and channel

### Devices minimun SDKs
- Android minSdkVersion 21
- iOS  minVersion 11.0


### Todo List
- [x] Implementar el patrón cubit o bloc
- [x] Componentizar widgets
- [x] Login & signup; Implementar Firebase authentication 
- [x] Login & signup; Validar formulario
- [x] Login; Si el usuario está logueado que la aplicación lo lleve directo a la pantalla 3 o 4 
- [x] Lista de órdenes; Implementar el pull to refresh
- [x] Lista de órdenes; No es necesario que los botones accepted y paid tenga interacción; solo pintarlos
- [x] Lista de órdenes; Active Order y Past Order si deben interactuar o listar contenido de forma dinámica
- [x] El contenido lo puedes mockear creando listas hardcore, archivos json locales o apoyandote con firebase realtime database
- [x] Menú; Que se oculte y habilite; No es necesario que su contenido tenga interacción, solo trabajar el l&f

### Installation


- Clone this repository and go into the folder cloned.
- Conect a device in order to run rhe app.
```bash
flutter pub get
flutter run
```

- Run in mode release
```bash
flutter run --release
```

- For iOS target, install pods
```
cd ios
pod install
```

### Android Apk - release mode
```
flutter build apk --release
```
[Download Apk](https://github.com/marcoleonardini/asap_challenge_cubit/blob/master/sources/app-release.apk)



### What was used in this app:

- Cubit for state managment
- Hard coded data in orders
- Firebase authentication and session managment
- Pull refresh
- Basic Animations
- OnGeneretaed Routes for navigation
- 

### Tested on
- iPhone 6, iOS 12.5.1
- Samsung A70, Android 10

#### [Video demo](https://github.com/marcoleonardini/asap_challenge_cubit/blob/master/sources/video.mp4)
### Contributing
Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.
