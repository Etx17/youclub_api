module CategoriesHelper
  def subcategories
    {
      "Sports, activités de plein air": [
        {label: "Tous", value: "Tous"},
        {label: "Non catégorisé", value: "Non catégorisé"},
        {label: "🌳 Activités de plein air (dont saut à l’élastique)", value: "activités de plein air (dont saut à l’élastique)"},
        {label: "🏃 Athlétisme (triathlon, pentathlon, footing, jogging)", value: "Athlétisme (triathlon, pentathlon, footing, jogging)"},
        {label: "🥋 Autres arts martiaux (karaté, aïkido, taekwondo)", value: "Autres arts martiaux (karaté, aïkido, taekwondo)"},
        {label: "🏈 Autres sports collectifs (baseball, hockey sur glace, football américain)", value: "Autres sports collectifs (baseball, hockey sur glace, football américain)"},
        {label: "🚣 Aviron, canoë kayak (aviron, rafting, canoë kayak, joutes)", value: "Aviron, canoë kayak (aviron, rafting, canoë kayak, joutes)"},
        {label: "🏸 Badminton (badminton, squash, pelote basque)", value: "Badminton (badminton, squash, pelote basque)"},
        {label: "🏀 Basket-ball", value: "Basket-ball"},
        {label: "🚴 Cyclisme (cyclisme, vélo, VTT, course d’orientation à vélo, cyclotourisme)", value: "Cyclisme (cyclisme, vélo, VTT, y c course d’orientation à vélo, cyclotourisme)"},
        {label: "💃 Danse sportive (danse sportive, hip hop, claquettes)", value: "Danse sportive (danse sportive, hip hop, claquettes)"},
        {label: "🐴 Equitation (équitation, hippisme, course camarguaise, landaise)", value: "Equitation (équitation, hippisme, course camarguaise, landaise)"},
        {label: "🧗 Escalade, montagne (escalade, spéléologie, via ferrata, canyonisme, alpinisme)", value: "Escalade, montagne (escalade, spéléologie, via ferrata, canyonisme, alpinisme)"},
        {label: "🤺 Escrime", value: "Escrime"},
        {label: "⚽ Football (football, futsal)", value: "Football (football, futsal)"},
        {label: "⛳ Golf", value: "Golf"},
        {label: "🤸 Gymnastique (gymnastique, yoga), aérobic", value: "Gymnastique (gymnastique, gymnastique d’entretien, éducation physique, yoga), aérobic"},
        {label: "🤾 Handball", value: "Handball"},
        {label: "🦽 Handisport", value: "handisport"},
        {label: "🏒 Hockey sur glace, sports de glace", value: "hockey sur glace, sports de glace"},
        {label: "🥋 Judo", value: "Judo"},
        {label: "🚶 Marche sportive (randonnée pédestre, raid, trekking, course orientation)", value: "Marche sportive (randonnée pédestre, raid, trekking, course orientation)"},
        {label: "💪 Musculation (culturisme, musculation)", value: "Musculation (culturisme, musculation)"},
        {label: "🏊 Natation - baignade (natation, plongée)", value: "Natation - baignade (natation, plongée)"},
        {label: "🌊 Nautisme, glisse sur eau (ski nautique, surf, char à voile)", value: "nautisme, glisse sur eau (ski nautique, surf, char à voile)"},
        {label: "🛹 Roller, skate", value: "Roller, skate"},
        {label: "🏉 Rugby (rugby à 13, à 15)", value: "Rugby (rugby à 13, à 15)"},
        {label: "🛩️ Sports aériens (avion, planeur, ULM, parachutisme)", value: "Sports aériens (avion, planeur, ULM, parachutisme)"},
        {label: "🥊 Sports de combat (boxe, kick box, boxe thaï, lutte)", value: "Sports de combat (boxe, kick box, boxe thaï, lutte)"},
        {label: "🏂 Sports de neige (ski alpin, ski de fond, snowboard), montagne", value: "Sports de neige (ski alpin, ski de fond, snowboard), montagne"},
        {label: "🎾 Tennis (tennis, longue paume)", value: "Tennis (tennis, longue paume)"},
        {label: "🏓 Tennis de table (tennis de table, ping-pong)", value: "Tennis de table (tennis de table, ping-pong)"},
        {label: "🎯 Tir (tir à l’arc, tir à balle, ball trap), javelot", value: "Tir (tir à l’arc, tir à balle, ball trap), javelot"},
        {label: "⛵ Voile (voile, dériveur, planche à voile)", value: "Voile (voile, dériveur, planche à voile)"},
        {label: "🏐 Volley ball (volley, beach volley)", value: "Volley ball (volley, beach volley)"}
      ],
      "Culture, pratiques d’activités artistiques, culturelles": [
          { label: "🎤 Chant choral et musique", value: "chant choral, musique" },
          { label: "🎨 Promotion de l’art et des artistes", value: "promotion de l’art et des artistes" },
          { label: "🎭 Théâtre, marionnettes, cirque, spectacles de variété", value: "théâtre, marionnettes, cirque, spectacles de variété" },
          { label: "💃 Danse", value: "danse" },
          { label: "🧪 Loisirs scientifiques et techniques", value: "loisirs scientifiques et techniques" },
          { label: "🧶 Artisanat, travaux manuels, bricolage et expositions", value: "artisanat, travaux manuels, bricolage, expositions" },
          { label: "🎥 Photographie, cinéma (dont ciné-clubs)", value: "photographie, cinéma (dont ciné-clubs)" },
          { label: "📝 Expression écrite, littérature, poésie", value: "expression écrite, littérature, poésie" },
          { label: "🎨 Arts graphiques, bande dessinée, peinture, sculpture, architecture", value: "arts graphiques, bande dessinée, peinture, sculpture, architecture" },
          { label: "🌍 Folklore", value: "folklore" },
          { label: "🗣️ Langues, dialectes et patois", value: "langues, dialectes, patois" },
          { label: "📚 Bibliothèques, ludothèques, discothèques et vidéothèques", value: "bibliothèques, ludothèques, discothèques, vidéothèques" },
          { label: "🎨 Arts de la rue", value: "arts de la rue" }
      ],
      "clubs de loisirs, relations": [
        { label: "🤝 échanges locaux, réseaux d’échanges", value: "échanges locaux, réseaux d'échanges" },
        { label: "🎉 activités festives (soirées…)", value: "activités festives (soirées…)" },
        { label: "🧘 relaxation, sophrologie", value: "relaxation, sophrologie" },
        { label: "🏞️ centres de loisirs, clubs de loisirs multiples", value: "centres de loisirs, clubs de loisirs multiples" },
        { label: "♟️ bridge, jeux de cartes, échecs, dames, jeux de société...", value: "bridge, jeux de cartes, échecs, dames, jeux de société..." },
        { label: "🍷 gastronomie, œnologie, confréries, gourmets", value: "gastronomie, œnologie, confréries, gourmets" },
        { label: "🐾 animaux familiers, colombophilie, aquariophilie", value: "animaux familiers, colombophilie, aquariophilie" },
        { label: "🌺 jardins ouvriers, floralies", value: "jardins ouvriers, floralies" },
        { label: "🚗 collectionneurs de véhicules, clubs amateurs de voitures anciennes", value: "collectionneurs de véhicules, clubs amateurs de voitures anciennes" },
        { label: "👥 cercles privés, fan-clubs", value: "cercles privés, fan-clubs" },
        { label: "🐶 élevage canin, clubs de chiens de défense", value: "élevage canin, clubs de chiens de défense" },
        { label: "🗞️ clubs de collectionneurs (hors sauvegarde, entretien du patrimoine), philatélie, numismatique", value: "clubs de collectionneurs (hors sauvegarde, entretien du patrimoine), philatélie, numismatique" },
        { label: "🚁 modélisme", value: "modélisme" },
        { label: "🎱 billard, quilles", value: "billard, quilles" },
        { label: "✈️ aéroclubs", value: "aéroclubs" },
        { label: "📻 radioamateurs", value: "radioamateurs" }
      ]
    }
  end

  def mapped_subcategories(category)
    subcategories[category.to_sym]&.map do |subcategory|
      [subcategory[:label], subcategory[:value]]
    end
  end
end
