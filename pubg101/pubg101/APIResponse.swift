//
//  APIResponse.swift
//  pubg101
//
//  Created by Jervy Umandap on 5/27/21.
//

import Foundation

struct APIResponse: Codable {
    let weapons: [Weapon]
}

struct Weapon: Codable {
    let weaponName: String
    let weaponType: String
    let bulletType: Double?
    let damage: Int
    let magazineCapacity: Int
    let range: Int?
    let bulletSpeed: Int?
    let rateOfFire: Double
    let shotsToKillChest, shotsToKillHead: Int
    let damagePerSecond: Double
    let fireMode: FireModeString
    let bdmg0, bdmg1, bdmg2, bdmg3: Double?
    let hdmg0, hdmg1, hdmg2, hdmg3: Double?
    let imageURL: String
}

enum FireModeString: String, Codable {
    case automatic = "Automatic"
    case single = "Single"
    case singleAutomatic = "Single, Automatic"
    case singleAutomaticBurst = "Single, Automatic, Burst"
    case singleBurst = "Single, Burst"
}
