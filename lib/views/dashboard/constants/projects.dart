class ProjectModel {
  final String name;
  final String image;
  final String category;
  final String description;
  final String client;
  final String industry;
  final String projectType;
  final String link;
  final List<TechnologyModel> technologies;

  ProjectModel({
    required this.name,
    required this.image,
    required this.category,
    required this.description,
    required this.client,
    required this.industry,
    required this.projectType,
    required this.technologies,
    required this.link,
  });
}

class TechnologyModel {
  final String name;
  final String image;

  TechnologyModel({
    required this.name,
    required this.image,
  });
}

final staticTechnologyList = [
  TechnologyModel(
    name: "Swift",
    image: "assets/ic_swift.png",
  ),
  TechnologyModel(
    name: "Kotlin",
    image: "assets/ic_kotlin.png",
  ),
  TechnologyModel(
    name: "NodeJS",
    image: "assets/ic_node_js.png",
  ),
  TechnologyModel(
    name: "Vue JS",
    image: "assets/ic_vue_js.png",
  ),
  TechnologyModel(
    name: "Amazon Lambda",
    image: "assets/ic_lambda.png",
  ),
];

final List<ProjectModel> projects = [
  ProjectModel(
    name: "Baxta Pets",
    image: "assets/baxta.png",
    category: "Mobile App",
    description:
        "Baxta Pets is the first and #1 pets only social media in the world. Baxta provides a platform for pets lovers to meet and share their experiences and allows them to enjoy the pleasure of being a pet parent.",
    client: "Baxta Global Pty Limited",
    industry: "Social media and networking (pet and animals)",
    projectType: "Baxta (iOS and CMS)",
    technologies: staticTechnologyList,
    link: "https://baxtapets.com/",
  ),
  ProjectModel(
    name: "Coposit",
    image: "assets/coposit.png",
    category: "Mobile App",
    description:
        "Coposit is the revolutionary app helping home buyers break down the deposit barrier and secure their property from as little as \$10k upfront.",
    client: "Coposit",
    industry: "Real e-State",
    projectType: "Coposit (iOS and CMS)",
    technologies: staticTechnologyList,
    link: "https://coposit.com.au/",
  ),
  ProjectModel(
    name: "Watsons Bay",
    image: "assets/watsons_bay.png",
    category: "Web Design",
    description:
        "Watsons Bay is a harbourside, eastern suburb of Sydney, in the state of New South Wales, Australia. Watsons Bay is located 11 km north-east of the Sydney central business district, in the local government area of the Municipality of Woollahra",
    client: "Coposit",
    industry: "Hospitality",
    projectType: "Web Design",
    technologies: staticTechnologyList,
    link: "https://watsonsbayhotel.com.au",
  ),
  ProjectModel(
    name: "Wild by Instinct",
    image: "assets/wild_by_instinct.png",
    category: "eCommerce",
    description:
        "Wild by Instinct is a California based independent wellness company focused on using the best technology, fact-based science and a passion for reimaging plant based products.",
    client: "FUTURE WELLBEING AUSTRALIA & NEW ZEALAND LIMITED",
    industry: "eCommerce",
    projectType: "Shoppify eCommerce",
    technologies: staticTechnologyList,
    link: "https://wildbyinstinct.com/",
  ),
  ProjectModel(
    name: "NSW Education",
    image: "assets/nsw.png",
    category: "Mobile App",
    description:
        "The NSW Department of Education is the largest provider of public education in Australia with responsibility for delivering high-quality public education to two-thirds of the NSW student population.",
    client: "New South Wales Department of Education",
    industry: "Education",
    projectType: "Mobile App (iOS and Android)",
    technologies: staticTechnologyList,
    link: "https://education.nsw.gov.au/",
  ),
  ProjectModel(
    name: "Quote Up",
    image: "assets/quote_up.png",
    category: "Mobile App",
    description:
        "QuoteUp is a mobile app that keeps records of quotes and estimations received and sent. It lets you manage your business within a few clicks at your fingertips, from an easy-to-read dashboard menu, to interactive quoting. QuoteUp improves the way you do business.",
    client: "FUTURE WELLBEING AUSTRALIA & NEW ZEALAND LIMITED",
    industry: "Contracts",
    projectType: "Engagement",
    technologies: staticTechnologyList,
    link: "https://quoteup.com.au/",
  ),
];
