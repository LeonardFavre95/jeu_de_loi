//https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/models/Questions.dart
class Question {
  final int id, answer;
  final String question;
  final List<String> options;

//
  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

//Liste de toutes les questions
const List sampleData = [
  {
    "id": 3,
    "question":
        "Lorsque l’on a défini les données personnelles que l’on traite dans une organisation : ",
    "options": [
      "On doit les sécuriser, mais seulement les données numériques",
      "On doit appliquer une série de principes quel que soit le traitement que l’on fait avec ces données",
      "On peut tout faire, pour autant qu’elles ne sortent pas de l’organisation"
    ],
    "answer_index": 1,
  },
  {
    "id": 2,
    "question":
        "Les données dites personnelles sont toutes les informations qui permet d’identifier une personne, directement ou indirectement, donc :",
    "options": [
      "Cela concerne toutes sortes de populations : les salariés d’une entreprise, ses clients, les demandeurs d’emploi, les patients d’un hôpital, les citoyennes et citoyens, etc.",
      "Cela ne concerne que les données d’identité, de tout un chacun",
      "Cela ne concerne que des informations qui sont en relation directe avec le nom et le prénom des personnes"
    ],
    "answer_index": 0,
  },
  {
    "id": 1,
    "question": "Pour jouer au jeu de loi je dois vérifier au préalable :",
    "options": [
      "Que mon pays est bien signataire de la convention",
      "Que moi-même ou mon organisation soyons prêts à réfléchir à nos procédures et à nos processus internes",
      "Que mon chef ou ma cheffe soit d’accord"
    ],
    "answer_index": 1,
  },
  {
    "id": 4,
    "question":
        "Quand on parle de traiter les données personnelles, on entend par là : ",
    "options": [
      "les traiter concrètement, c’est-à-dire les manipuler, les déplacer, les dupliquer",
      "Tout ce que l’on fait avec ces données personnelles dès leur collecte et jusqu’à leur destruction",
      "Mettre des données dans un fichier informatique"
    ],
    "answer_index": 1,
  },
  {
    "id": 5,
    "question":
        "D’ailleurs quand on parle de traitement de données personnelles :",
    "options": [
      "Cela exclut la simple consultation d’un fichier, par exemple",
      "Cela exclut le fait de les confier à un hébergeur externe",
      "Cela comprend de manière générale tout ce que l’on fait avec les données personnelles et quel que soit leur format (papier ou numérique)"
    ],
    "answer_index": 2,
  },
  {
    "id": 6,
    "question": "Pour appliquer les bonnes pratiques de la convention 108 :",
    "options": [
      "Il faut se demander quel est le but d’un traitement, pour adapter ensuite le type de données que l’on va traiter, le type de traitement que l’on va prévoir, et la durée pendant laquelle on va conserver ses données",
      "Il suffit que le pays soit signataire de la convention, et que l’on s’engage à la respecter",
      "Il faut avoir fait des études de juriste"
    ],
    "answer_index": 0,
  },
  {
    "id": 7,
    "question": "Le système d’information…",
    "options": [
      "Doit être géré uniquement par l’administrateur, et accessible en lecture seule aux membres de l’organisation ",
      "Doit faire l’objet d’un backup tous les jours, pour le reste s’il est interne à l’organisation tout le personnel peut y accéder ",
      "Doit être sécurisé, rendu disponible aux personnes qui en ont besoin, et géré selon les principes applicables au traitement des données personnelles pour ce qui les concerne",
    ],
    "answer_index": 2,
  },
  {
    "id": 8,
    "question": "Le dossier RH …",
    "options": [
      "Peut contenir différents types de données personnelles, y compris des données sensibles, je le garde à jour et de manière confidentielle, je le trie au départ de la personne, et je le détruis ou je l’archive au bout de 10 ans ",
      "Vu les principes applicables au traitement des données personnelles, il ne peut contenir que les données personnelles administratives de base et les éléments liés au poste (CV et attestations diverses, fiches de salaire) et il peut être conservé indéfiniment ",
      "Peut contenir tout ce que l’on veut et qui est utile, puisque seule la personne concernée et les ressources humaines y accèdent ",
    ],
    "answer_index": 0,
  },
  {
    "id": 9,
    "question":
        "Dans un formulaire (d’adhésion, de demande, d’inscription, …) …",
    "options": [
      "Je collecte les informations qui sont nécessaires à la finalité",
      "Je peux collecter ce que je veux puisque c’est sur la base du consentement de la personne concernée",
      "Si le formulaire est en format papier, je n’ai aucune règle à respecter",
    ],
    "answer_index": 0,
  },
  {
    "id": 10,
    "question": "L’externalisation des données doit être : ",
    "options": [
      "limitée au strict nécessaire et ne pas dépasser les frontières du pays",
      "mûrement réfléchie, confiée à un prestataire fiable voire certifié, et circonscrite à un pays qui respecte les principes inscrits dans la convention 108+",
      "faite en fonction des enjeux financiers",
    ],
    "answer_index": 1,
  },
  {
    "id": 11,
    "question": "Le droit des personnes concernées …",
    "options": [
      "Signifie uniquement que la personne a un « droit à l’oubli » sur Internet ",
      "Signifie que toute personne peut accéder aux données qui la concernent, le Responsable de traitement doit répondre à sa demande, et doit ensuite mettre à jour ou supprimer ce qui doit l’être ",
      "Ne trouve application qu’au sein des organismes publics, il n’existe pas dans le privé ",
    ],
    "answer_index": 1,
  },
  {
    "id": 12,
    "question": "La conservation des données… ",
    "options": [
      "Se fait pour une durée qui est en relation directe avec la finalité du traitement ",
      "Peut être de durée indéterminée, lorsque la personne concernée ne demande pas la destruction ",
      "Est différente selon le format de conservation, à savoir de durée indéterminée lorsqu’elles sont numériques, limitées à 10 ans lorsqu’elles sont sous forme papier ",
    ],
    "answer_index": 0,
  }
];
