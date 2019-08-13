//
//  spaceship.swift
//  project
//
//  Created by Cat Nian on 2019-07-28.
//  Copyright © 2019 JN. All rights reserved.
//

import Foundation

protocol Spaceship {
    var type: Int { get set }
    var health: Int { get set }
    var damage: Int { get set }
    
    func animate()
    func destory()
    
}
