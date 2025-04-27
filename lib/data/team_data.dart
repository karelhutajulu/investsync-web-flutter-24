class TeamMember {
  final String name;
  final String role;
  final String imagePath;
  final String emailLink;
  final String linkedInLink;

  TeamMember(
      {required this.name,
      required this.role,
      required this.imagePath,
      required this.emailLink,
      required this.linkedInLink});
}

final List<TeamMember> boardOfDirectors = [
  TeamMember(
    name: "Hoyun Joseph Jung",
    role: "President",
    imagePath: "assets/images/photos/HJJ.png",
    emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=hoyuny0426@gmail.com&tf=cm",
    linkedInLink: "https://linkedin.com/in/hoyun-jung-158248224",
  ),
  TeamMember(
    name: "Caitlyn Kay",
    role: "President",
    imagePath: "assets/images/photos/CK.png",
    emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=caitlynkay07@gmail.com&tf=cm",
    linkedInLink: "https://linkedin.com/in/caitlynkay07",
  ),
  TeamMember(
    name: "Bhurida Chatlekhavanich",
    role: "Vice President",
    imagePath: "assets/images/board-members/BC.jpg",
    emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=kaye.bhurida@gmail.com&tf=cm",
    linkedInLink: "https://www.linkedin.com/in/bhurida-chatlekhavanich-828792227",
  ),
  // TeamMember(
  //   name: "Chrisantha Ongko",
  //   role: "Vice President",
  //   imagePath: "assets/images/board-members/CO.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=chrisanthaong@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/chrisantha-ongko-3691a724a",
  // ),
  // TeamMember(
  //   name: "Nikita Tanjaya",
  //   role: "Chief Technology Officer",
  //   imagePath: "assets/images/board-members/NT.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=tanjayanikita@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/nikita-tanjaya",
  // ),
  // TeamMember(
  //   name: "Bryan Jonathan",
  //   role: "Web Developer",
  //   imagePath: "assets/images/board-members/BJ.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=24bryan.jonathan@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/bryan-jonathan-461b0724a",
  // ),
  // TeamMember(
  //   name: "Matthew Kwok",
  //   role: "Web Developer",
  //   imagePath: "assets/images/board-members/MK.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=matthew.effendy@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/matthew-kwok-4641b4293",
  // ),
  // TeamMember(
  //   name: "Bryan Edelson",
  //   role: "Web Developer",
  //   imagePath: "assets/images/board-members/BE.jpg",
  //   emailLink: "",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Kevinsanto Liu",
  //   role: "Web Developer",
  //   imagePath: "assets/images/board-members/KL.jpg",
  //   emailLink: "",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Karel G. A. Hutajulu",
  //   role: "Web Developer",
  //   imagePath: "assets/images/board-members/KGAH.jpg",
  //   emailLink: "",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Chananan Watsooksunti",
  //   role: "Chief Financial Officer",
  //   imagePath: "assets/images/board-members/CW.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=chanananw@gmail.com&tf=cm",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Bryan Budiarta Sutanto",
  //   role: "Treasury",
  //   imagePath: "assets/images/board-members/BBS.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=bryan.b.sutanto@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/bryan-budiarta-sutanto-6031a41b0",
  // ),
  // TeamMember(
  //   name: "Maire Baukop Hellem",
  //   role: "Chief Human Resources Officer",
  //   imagePath: "assets/images/board-members/MBH.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=mairebaukoph25@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/maire-baukop-hellem-1161b8231",
  // ),
  // TeamMember(
  //   name: "Junjira Adisakdechakul",
  //   role: "External Human Resources Manager",
  //   imagePath: "assets/images/board-members/JA.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=baa04mm@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/junjira-adisakdechakul-29451b2b3",
  // ),
  // TeamMember(
  //   name: "Fidella Lukita",
  //   role: "Internal Human Resources Manager",
  //   imagePath: "assets/images/board-members/FL.jpg",
  //   emailLink: "",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Kellen Joudan",
  //   role: "Internal Human Resources Manager",
  //   imagePath: "assets/images/board-members/KJ.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=kellenjoudan2@gmail.com&tf=cm",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Vincent Theodore Arifin",
  //   role: "Chief Editor",
  //   imagePath: "assets/images/board-members/VTA.jpg",
  //   emailLink: "",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Vincent Ang",
  //   role: "Secretary",
  //   imagePath: "assets/images/board-members/VA.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=vincent.ang523@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/vincent-ang-977865281",
  // ),
  // TeamMember(
  //   name: "Olivia Dewi Christanto",
  //   role: "Secretary",
  //   imagePath: "assets/images/board-members/ODC.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=oliviadchrist@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/oliviadewi",
  // ),
  // TeamMember(
  //   name: "Angelica P.T. Tuerah",
  //   role: "Publicist",
  //   imagePath: "assets/images/board-members/APTT.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=angelica.tuerah2004@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/angelica-tuerah-9ab0942a2",
  // ),
  // TeamMember(
  //   name: "Eugenia Jocelyn Budiono",
  //   role: "Publicist",
  //   imagePath: "assets/images/board-members/EJB.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=jocelynwu153@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/eugenia-jocelyn-budiono-507b9a270",
  // ),
  // TeamMember(
  //   name: "William A. Tanex",
  //   role: "Past Vice-President",
  //   imagePath: "",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=alexandertanex@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/william-alexander-tanex",
  // ),
  // TeamMember(
  //   name: "Kim Kyungrok",
  //   role: "Past Market Analyst",
  //   imagePath: "",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=ksktkr10@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/kyungrok-kim-a9510b29a",
  // ),
];


final List<TeamMember> investmentTeam = [
  TeamMember(
    name: "Reinard T. J. Nathanael",
    role: "Senior Analyst",
    imagePath: "",
    emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=reinard.tristan@gmail.com&tf=cm",
    linkedInLink: "https://www.linkedin.com/in/reinard-tristan-jacques",
  ),
  TeamMember(
    name: "William Hansen Loe",
    role: "Senior Analyst",
    imagePath: "",
    emailLink: "",
    linkedInLink: "",
  ),
  TeamMember(
    name: "Joshua Djunaidi",
    role: "Senior Analyst",
    imagePath: "",
    emailLink: "",
    linkedInLink: "",
  ),
  // TeamMember(
  //   name: "Cellinie Tanaga",
  //   role: "Market Analyst",
  //   imagePath: "assets/images/board-members/CT.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=cellinietanaga2004@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/cellinie-tanaga-50676724a",
  // ),
  // TeamMember(
  //   name: "Annabel Leonardi",
  //   role: "Market Analyst",
  //   imagePath: "assets/images/board-members/AL.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=annabel.leonardi@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/annabel-leonardi-13754b231",
  // ),
  // TeamMember(
  //   name: "Angelina Celine Handojo",
  //   role: "Market Analyst",
  //   imagePath: "assets/images/board-members/ACH.jpg",
  //   emailLink: "https://mail.google.com/mail/u/0/?fs=1&to=celine.handojo@gmail.com&tf=cm",
  //   linkedInLink: "https://www.linkedin.com/in/angelina-celine-handojo-9a13251aa",
  // ),
  // TeamMember(
  //   name: "Natania Christian",
  //   role: "Market Analyst",
  //   imagePath: "assets/images/board-members/NC.jpg",
  //   emailLink: "",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Benedict Dustin Tanex",
  //   role: "Market Analyst",
  //   imagePath: "assets/images/board-members/BDT.jpg",
  //   emailLink: "",
  //   linkedInLink: "",
  // ),
  // TeamMember(
  //   name: "Celine Clarissa Chandra",
  //   role: "Market Analyst",
  //   imagePath: "assets/images/board-members/CCC.jpg",
  //   emailLink: "",
  //   linkedInLink: "",
  // ),
];
