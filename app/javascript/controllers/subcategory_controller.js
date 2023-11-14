import { Controller } from "@hotwired/stimulus"

export default class extends Controller {
  static targets = ["category", "subcategories", "otherSubcategory"];

  connect() {
    this.subcategoryMapping = {
      "Sports, activités de plein air": {
        "Autre": "Autre",
        "Aïkido": "Autres arts martiaux (karaté, aïkido, taekwondo)",
        "Arts énergétiques et martiaux chinois": "Autres arts martiaux (karaté, aïkido, taekwondo)",
        "Athlétisme": "Athlétisme (triathlon, pentathlon, footing, jogging)",
        "Badminton": "Badminton (badminton, squash, pelote basque)",
        "Baseball /Softball": "Autres sports collectifs (baseball, hockey sur glace, football américain)",
        "Basketball": "Basket-ball",
        "BMX": "Cyclisme (cyclisme, vélo, VTT, y c course d’orientation à vélo, cyclotourisme)",
        "Bowling et sports de quilles": "Non catégorisé",
        "Boxe": "Sports de combat (boxe, kick box, boxe thaï, lutte)",
        "Canoë-Kayak": "Aviron, canoë kayak (aviron, rafting, canoë kayak, joutes)",
        "Cross training": "Musculation (culturisme, musculation)",
        "Cyclisme sur piste": "Cyclisme (cyclisme, vélo, VTT, y c course d’orientation à vélo, cyclotourisme)",
        "Cyclisme sur route": "Cyclisme (cyclisme, vélo, VTT, y c course d’orientation à vélo, cyclotourisme)",
        "Danse": "Danse sportive (danse sportive, hip hop, claquettes)",
        "Double Dutch": "Non catégorisé",
        "Echecs": "Non catégorisé",
        "Equitation": "Equitation (équitation, hippisme, course camarguaise, landaise)",
        "Escrime": "Escrime",
        "Escalade": "Escalade, montagne (escalade, spéléologie, via ferrata, canyonisme, alpinisme)",
        "Football": "Football (football, futsal)",
        "Football américain / Flag": "Autres sports collectifs (baseball, hockey sur glace, football américain)",
        "Force athlétique": "Non catégorisé",
        "Futsal": "Football (football, futsal)",
        "Golf": "Golf",
        "Grappling": "Sports de combat (boxe, kick box, boxe thaï, lutte)",
        "Gymnastique artistique / rythmique": "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic",
        "Gymnastique : disciplines acrobatiques": "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic",
        "Haltérophilie": "Haltérophilie",
        "Handball": "Handball",
        "Handisport": "Handisport",
        "Judo - Jujitsu": "Judo",
        "Judo jujitsu": "Judo",
        "Karaté": "Autres arts martiaux (karaté, aïkido, taekwondo)",
        "Kickboxing": "Sports de combat (boxe, kick box, boxe thaï, lutte)",
        "Krav-Maga": "Sports de combat (boxe, kick box, boxe thaï, lutte)",
        "Lutte": "Sports de combat (boxe, kick box, boxe thaï, lutte)",
        "Marche nordique": "Marche sportive (randonnée pédestre, raid, trekking, course orientation)",
        "Méditation": "Non catégorisé",
        "Musculation": "Musculation (culturisme, musculation)",
        "Muay Thai": "Sports de combat (boxe, kick box, boxe thaï, lutte)",
        "Natation": "Natation - baignade (natation, plongée)",
        "Natation synchronisée": "Natation - baignade (natation, plongée)",
        "Nage avec palmes": "Natation - baignade (natation, plongée)",
        "Parachutisme": "Sports aériens (avion, planeur, ULM, parachutisme)",
        "Parkour": "Activités de plein air (dont saut à l’élastique)",
        "Pétanque et jeu provencal": "Boules (pétanque, boules)",
        "Plongée": "Natation - baignade (natation, plongée)",
        "Plongeon": "Natation - baignade (natation, plongée)",
        "Randonnée pédestre": "Marche sportive (randonnée pédestre, raid, trekking, course orientation)",
        "Roller & Rink Hockey": "Roller, skate",
        "Roller artistique": "Roller, skate",
        "Roller de vitesse": "Roller, skate",
        "Rugby": "Rugby (rugby à 13, à 15)",
        "Rock": "Danse sportive (danse sportive, hip hop, claquettes)",
        "Salsa": "Danse sportive (danse sportive, hip hop, claquettes)",
        "Rugby à XIII": "Rugby (rugby à 13, à 15)",
        "Sambo": "Sports de combat (boxe, kick box, boxe thaï, lutte)",
        "Sauvetage": "Non catégorisé",
        "Savate Boxe française": "Sports de combat (boxe, kick box, boxe thaï, lutte)",
        "Skateboard et freestyle": "Roller, skate",
        "Ski alpin": "Sports de neige (ski alpin, ski de fond, snowboard), montagne",
        "Ski nordique / biathlon": "Sports de neige (ski alpin, ski de fond, snowboard), montagne",
        "Surf": "Nautisme, glisse sur eau (ski nautique, surf, char à voile)",
        "Taekwondo": "Autres arts martiaux (karaté, aïkido, taekwondo)",
        "Tennis": "Tennis (tennis, longue paume)",
        "Tennis de table": "Tennis de table (tennis de table, ping-pong)",
        "Tir à l'arc": "Tir (tir à l’arc, tir à balle, ball trap), javelot",
        "Triathlon": "Athlétisme (triathlon, pentathlon, footing, jogging)",
        "Twirling bâton": "Non catégorisé",
        "Voile": "Voile (voile, dériveur, planche à voile)",
        "Volley": "Volley ball (volley, beach volley)",
        "Wushu": "Autres arts martiaux (karaté, aïkido, taekwondo)",
        "Yoga": "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic"
      },
      "Culture, pratiques d’activités artistiques, culturelles": {
        "Danse": "Danse",
      }
    };
  this.updateSubcategories();
  }

  updateSubcategories() {
    const selectedCategory = this.categoryTarget.value || "Sports, activités de plein air";
    const subcategories = this.subcategoryMapping[selectedCategory] || {};
    this.subcategoriesTarget.innerHTML = this.optionsForSelect(subcategories);
    this.toggleOtherSubcategoryInput();
  }

  toggleOtherSubcategoryInput() {
    console.log('coucou haha')
    const isOtherSelected = this.subcategoriesTarget.value === "Autre";
    const otherInput = this.otherSubcategoryInput();

    if (isOtherSelected) {
      this.otherSubcategoryTarget.classList.remove("d-none");
      otherInput.disabled = false;
    } else {
      this.otherSubcategoryTarget.classList.add("d-block");
      this.otherSubcategoryTarget.classList.add("d-none");
      otherInput.disabled = true;
      otherInput.value = '';
    }
  }

  otherSubcategoryInput() {
    return this.otherSubcategoryTarget.querySelector('input');
  }

  optionsForSelect(subcategories) {
    console.log(subcategories, 'subcategories')
    return Object.keys(subcategories).map(key =>
      `<option value="${subcategories[key]}">${key}</option>`
    ).join('');
  }
}
