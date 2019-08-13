//
//  Waves.swift
//  project
//
//  Created by Cat Nian on 2019-08-12.
//  Copyright © 2019 JN. All rights reserved.
//

import SpriteKit

struct Wave: Codable {
    struct EnemyWaves: Codable {
        var position: Int
        var xOffset: CGFloat
        var moveStraight: Bool
    }
    
    var type: Int
    var enemies: [EnemyWaves]
}
