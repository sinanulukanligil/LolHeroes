//
//  KaanHeroes.swift
//  LolHeroes
//
//  Created by Kaan Ozdemir on 15.11.2020.
//

import Foundation

class KaanHero {
    var heroName: String?
    var heroImageUrl: String?
    var heroDescription: String?
    var relatedHeroes: [KaanHero]?
    
    init(
        heroName: String?,
        heroImageUrl: String?,
        heroDescription: String?,
        relatedHeroes: [KaanHero]?
    ) {
        self.heroName = heroName
        self.heroImageUrl = heroImageUrl
        self.heroDescription = heroDescription
        self.relatedHeroes = relatedHeroes
    }
}
