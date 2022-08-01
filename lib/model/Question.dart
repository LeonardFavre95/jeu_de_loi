//https://github.com/Yukta-Koli/Quiz-App/blob/main/lib/models/Questions.dart

class Question {
  final int id, answer;
  final String question;
  final List<String> options;

  Question(
      {required this.id,
      required this.question,
      required this.answer,
      required this.options});
}

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
    "question": "question 1",
    "options": [
      "réponse 1",
      "réponse 2",
      "réponse 3",
    ],
    "answer_index": 0,
  },
  {
    "id": 8,
    "question": "question 2",
    "options": [
      "réponse 1",
      "réponse 2",
      "réponse 3",
    ],
    "answer_index": 0,
  },
  {
    "id": 9,
    "question": "question 3",
    "options": [
      "réponse 1",
      "réponse 2",
      "réponse 3",
    ],
    "answer_index": 0,
  },
  {
    "id": 10,
    "question": "question 4",
    "options": [
      "réponse 1",
      "réponse 2",
      "réponse 3",
    ],
    "answer_index": 0,
  },
  {
    "id": 11,
    "question": "question 5",
    "options": [
      "réponse 1",
      "réponse 2",
      "réponse 3",
    ],
    "answer_index": 0,
  },
  {
    "id": 12,
    "question": "question 6",
    "options": [
      "réponse 1",
      "réponse 2",
      "réponse 3",
    ],
    "answer_index": 0,
  }
];
