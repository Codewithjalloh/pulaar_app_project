import 'package:flutter/cupertino.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

final Map<String, IconData> phraseIconMapping = {
  'snake': FontAwesomeIcons.dragon, // Using dragon as a close match for snake
  'cow': FontAwesomeIcons.cow,
  'dog': FontAwesomeIcons.dog,
  'cat': FontAwesomeIcons.cat,
  'apple': FontAwesomeIcons.appleAlt,
  'car': FontAwesomeIcons.car,
  'house': FontAwesomeIcons.home,
  'tree': FontAwesomeIcons.tree,
  'book': FontAwesomeIcons.book,
  'phone': FontAwesomeIcons.phone,
  'computer': FontAwesomeIcons.desktop,
  'bicycle': FontAwesomeIcons.bicycle,
  'bird': FontAwesomeIcons.dove,
  'fish': FontAwesomeIcons.fish,
  'chair': FontAwesomeIcons.chair,
  'bed': FontAwesomeIcons.bed,
  'coffee': FontAwesomeIcons.coffee,
  'spoon': FontAwesomeIcons.utensilSpoon,
  'fork': FontAwesomeIcons.utensils,
  'bread': FontAwesomeIcons.breadSlice,
  'cheese': FontAwesomeIcons.cheese,
  'milk': FontAwesomeIcons.glassWhiskey,
  'water': FontAwesomeIcons.tint,
  'fire': FontAwesomeIcons.fire,
  'sun': FontAwesomeIcons.sun,
  'moon': FontAwesomeIcons.moon,
  'star': FontAwesomeIcons.star,
  'heart': FontAwesomeIcons.heart,
  'hand': FontAwesomeIcons.handPaper,
  'foot': FontAwesomeIcons.walking,
  'eye': FontAwesomeIcons.eye,
  'ear': FontAwesomeIcons.earListen,
  'mouth': FontAwesomeIcons.kiss,
  'nose': FontAwesomeIcons.snowman, // Close match for nose
  'hair': FontAwesomeIcons.person,
  'baby': FontAwesomeIcons.baby,
  'boy': FontAwesomeIcons.male,
  'girl': FontAwesomeIcons.female,
  'man': FontAwesomeIcons.person,
  'woman': FontAwesomeIcons.personDress,
  'teacher': FontAwesomeIcons.chalkboardTeacher,
  'student': FontAwesomeIcons.userGraduate,
  'doctor': FontAwesomeIcons.userMd,
  'nurse': FontAwesomeIcons.userNurse,
  'policeman': FontAwesomeIcons.userSecret,
  'firefighter': FontAwesomeIcons.fireExtinguisher,
  'farmer': FontAwesomeIcons.tractor,
  'artist': FontAwesomeIcons.paintBrush,
  'musician': FontAwesomeIcons.music,
  'dancer': FontAwesomeIcons.music,
  'actor': FontAwesomeIcons.theaterMasks,
  'writer': FontAwesomeIcons.penFancy,
  'singer': FontAwesomeIcons.microphone,
  'clothes': FontAwesomeIcons.tshirt,
  'shirt': FontAwesomeIcons.tshirt,
  'pants': FontAwesomeIcons.userTie,
  'dress': FontAwesomeIcons.personDress,
  'shoes': FontAwesomeIcons.shoePrints,
  'hat': FontAwesomeIcons.hatCowboy,
  'socks': FontAwesomeIcons.socks,
  'gloves': FontAwesomeIcons.handshake,
  'jacket': FontAwesomeIcons.user,
  'scarf': FontAwesomeIcons.ribbon,
  'belt': FontAwesomeIcons.mitten,
  'pencil': FontAwesomeIcons.pencilAlt,
  'pen': FontAwesomeIcons.pen,
  'paper': FontAwesomeIcons.fileAlt,
  'notebook': FontAwesomeIcons.bookOpen,
  'school': FontAwesomeIcons.school,
  'university': FontAwesomeIcons.university,
  'hospital': FontAwesomeIcons.hospital,
  'bank': FontAwesomeIcons.university,
  'store': FontAwesomeIcons.store,
  'shop': FontAwesomeIcons.shoppingCart,
  'market': FontAwesomeIcons.shoppingBasket,
  'restaurant': FontAwesomeIcons.utensils,
  'cafe': FontAwesomeIcons.coffee,
  'hotel': FontAwesomeIcons.hotel,
  'park': FontAwesomeIcons.tree,
  'library': FontAwesomeIcons.book,
  'museum': FontAwesomeIcons.landmark,
  'cinema': FontAwesomeIcons.film,
  'theater': FontAwesomeIcons.theaterMasks,
  'stadium': FontAwesomeIcons.footballBall,
  'airport': FontAwesomeIcons.plane,
  'station': FontAwesomeIcons.train,
  'bus': FontAwesomeIcons.bus,
  'train': FontAwesomeIcons.train,
  'bicycle': FontAwesomeIcons.bicycle,
  'motorcycle': FontAwesomeIcons.motorcycle,
  'taxi': FontAwesomeIcons.taxi,
  'boat': FontAwesomeIcons.ship,
  'ship': FontAwesomeIcons.ship,
  'subway': FontAwesomeIcons.subway,
  'tram': FontAwesomeIcons.train,
  'ambulance': FontAwesomeIcons.ambulance,

  'police car': FontAwesomeIcons.carSide,
  'calendar': FontAwesomeIcons.calendar,
  'clock': FontAwesomeIcons.clock,
  'time': FontAwesomeIcons.clock,
  'alarm': FontAwesomeIcons.bell,
  'bell': FontAwesomeIcons.bell,
  'gift': FontAwesomeIcons.gift,
  'money': FontAwesomeIcons.moneyBill,
  'credit card': FontAwesomeIcons.creditCard,
  'wallet': FontAwesomeIcons.wallet,
  'key': FontAwesomeIcons.key,
  'lock': FontAwesomeIcons.lock,
  'mail': FontAwesomeIcons.envelope,
  'email': FontAwesomeIcons.envelope,
  'phone': FontAwesomeIcons.phone,
  'computer': FontAwesomeIcons.desktop,
  'laptop': FontAwesomeIcons.laptop,
  'tablet': FontAwesomeIcons.tabletAlt,
  'camera': FontAwesomeIcons.camera,
  'video': FontAwesomeIcons.video,
  'music': FontAwesomeIcons.music,
  'game': FontAwesomeIcons.gamepad,
  'play': FontAwesomeIcons.play,
  'pause': FontAwesomeIcons.pause,
  'stop': FontAwesomeIcons.stop,
  'record': FontAwesomeIcons.recordVinyl,
  'volume': FontAwesomeIcons.volumeUp,
  'mute': FontAwesomeIcons.volumeMute,
  'microphone': FontAwesomeIcons.microphone,
  'headphones': FontAwesomeIcons.headphones,
  'speaker': FontAwesomeIcons.speakerDeck,
  'radio': FontAwesomeIcons.radio,
  'television': FontAwesomeIcons.tv,
  'light': FontAwesomeIcons.lightbulb,
  'bulb': FontAwesomeIcons.lightbulb,

  'battery': FontAwesomeIcons.batteryFull,
  'plug': FontAwesomeIcons.plug,
  'socket': FontAwesomeIcons.plug,
  'network': FontAwesomeIcons.networkWired,
  'wifi': FontAwesomeIcons.wifi,
  'bluetooth': FontAwesomeIcons.bluetooth,
  'map': FontAwesomeIcons.map,
  'location': FontAwesomeIcons.mapMarkerAlt,
  'pin': FontAwesomeIcons.mapPin,
  'direction': FontAwesomeIcons.compass,
  'compass': FontAwesomeIcons.compass,
  'globe': FontAwesomeIcons.globe,
  'earth': FontAwesomeIcons.globe,
  'flag': FontAwesomeIcons.flag,
  'banner': FontAwesomeIcons.flag,
  'trophy': FontAwesomeIcons.trophy,
  'medal': FontAwesomeIcons.medal,
  'award': FontAwesomeIcons.award,
  'ribbon': FontAwesomeIcons.ribbon,
  'cup': FontAwesomeIcons.mugHot,
  'bottle': FontAwesomeIcons.wineBottle,
  'glass': FontAwesomeIcons.glassMartini,
  'plate': FontAwesomeIcons.plateWheat,
  'bowl': FontAwesomeIcons.bowlRice,
  'spoon': FontAwesomeIcons.spoon,

  'microwave': FontAwesomeIcons.microchip,

  'sink': FontAwesomeIcons.sink,

  'broom': FontAwesomeIcons.broom,

  'bucket': FontAwesomeIcons.bucket,
  'soap': FontAwesomeIcons.soap,

  'brush': FontAwesomeIcons.brush,

  'shower': FontAwesomeIcons.shower,
  'bath': FontAwesomeIcons.bath,
  'toilet': FontAwesomeIcons.toilet,
  'sink': FontAwesomeIcons.sink,

  'bed': FontAwesomeIcons.bed,

  'sheet': FontAwesomeIcons.sheetPlastic,

  'sofa': FontAwesomeIcons.couch,
  'couch': FontAwesomeIcons.couch,

  'table': FontAwesomeIcons.table,

  'bookshelf': FontAwesomeIcons.book,
  'rug': FontAwesomeIcons.rug,

  'door': FontAwesomeIcons.doorClosed,

  'tree': FontAwesomeIcons.tree,

  'leaf': FontAwesomeIcons.leaf,
  'fruit': FontAwesomeIcons.apple,
  'vegetable': FontAwesomeIcons.carrot,

  'fish': FontAwesomeIcons.fish,
  'bread': FontAwesomeIcons.breadSlice,
  'cheese': FontAwesomeIcons.cheese,
  'egg': FontAwesomeIcons.egg,
  'milk': FontAwesomeIcons.glassWhiskey,
  'water': FontAwesomeIcons.tint,
  'juice': FontAwesomeIcons.wineGlass,
  'coffee': FontAwesomeIcons.coffee,
  'tea': FontAwesomeIcons.mugHot,

  'pizza': FontAwesomeIcons.pizzaSlice,
  'burger': FontAwesomeIcons.hamburger,

  'cake': FontAwesomeIcons.birthdayCake,
  'chocolate': FontAwesomeIcons.candyCane,
  'candy': FontAwesomeIcons.candyCane,
  'ice cream': FontAwesomeIcons.iceCream,
  'cookie': FontAwesomeIcons.cookie,

  'food': FontAwesomeIcons.utensils,
  'beverage': FontAwesomeIcons.wineBottle,
  'drink': FontAwesomeIcons.wineGlass,
  'water': FontAwesomeIcons.tint,
  'juice': FontAwesomeIcons.wineGlass,
  'coffee': FontAwesomeIcons.coffee,
  'tea': FontAwesomeIcons.mugHot,

  'wine': FontAwesomeIcons.wineGlass,
  'beer': FontAwesomeIcons.beer,
  'cocktail': FontAwesomeIcons.cocktail,

  'exercise': FontAwesomeIcons.running,
  'running': FontAwesomeIcons.running,
  'walking': FontAwesomeIcons.walking,
  'cycling': FontAwesomeIcons.biking,
  'swimming': FontAwesomeIcons.swimmer,
  'gym': FontAwesomeIcons.dumbbell,

  'sports': FontAwesomeIcons.footballBall,
  'football': FontAwesomeIcons.footballBall,
  'soccer': FontAwesomeIcons.soccerBall,
  'basketball': FontAwesomeIcons.basketballBall,

  'baseball': FontAwesomeIcons.baseballBall,
  'volleyball': FontAwesomeIcons.volleyballBall,
  'hockey': FontAwesomeIcons.hockeyPuck,

  'golf': FontAwesomeIcons.golfBall,

  'snowboarding': FontAwesomeIcons.snowboarding,

  'hiking': FontAwesomeIcons.hiking,

  'shopping': FontAwesomeIcons.shoppingCart,
  'driving': FontAwesomeIcons.car,
  'traveling': FontAwesomeIcons.plane,

  'hiking': FontAwesomeIcons.hiking,

  'skiing': FontAwesomeIcons.skiing,
  'snowboarding': FontAwesomeIcons.snowboarding,

  'running': FontAwesomeIcons.running,
  'walking': FontAwesomeIcons.walking,

  'football': FontAwesomeIcons.football,

  'basketball': FontAwesomeIcons.basketball,

  'baseball': FontAwesomeIcons.baseball,
  'volleyball': FontAwesomeIcons.volleyball,

  'skiing': FontAwesomeIcons.skiing,
  'snowboarding': FontAwesomeIcons.snowboarding,

  'hiking': FontAwesomeIcons.hiking,

  'running': FontAwesomeIcons.running,
  'walking': FontAwesomeIcons.walking,

  'football': FontAwesomeIcons.football,

  'basketball': FontAwesomeIcons.basketball,

  'baseball': FontAwesomeIcons.baseball,
  'volleyball': FontAwesomeIcons.volleyball,

  'skiing': FontAwesomeIcons.skiing,
  'snowboarding': FontAwesomeIcons.snowboarding,

  'hiking': FontAwesomeIcons.hiking,

  'skiing': FontAwesomeIcons.skiing,
  'snowboarding': FontAwesomeIcons.snowboarding,
};
