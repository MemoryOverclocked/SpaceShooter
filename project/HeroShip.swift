//
//  HeroShip.swift
//  project
//
//  Created by Cat Nian on 2019-07-28.
//  Copyright © 2019 JN. All rights reserved.
//

import Foundation
import SpriteKit
import GameplayKit

class HeroShip : SKSpriteNode, Spaceship {
    var type: Int
    var health: Int
    var damage: Int
    
    init(){
        type = 0
        health = 100
        damage = 5
        let img = SKTexture(imageNamed: "spacecraft")
        super.init(texture: img, color: UIColor.clear, size: CGSize(width: 100, height: 100))
        setPosition()
    }
    
    init(type: Int, health: Int, damage: Int){
        self.type = type
        self.health = health
        self.damage = damage
        let img = SKTexture(imageNamed: "spacecraft")
        super.init(texture: img, color: UIColor.clear, size: CGSize(width: 100, height: 100))
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPosition(){
        let screen = UIScreen.main.bounds
        let floor = (screen.height / -2) + (self.size.height/2)
        self.position = CGPoint(x: 0, y: floor + 20)
        self.zPosition = 1
        // Restrict y axis movement
        //let range = SKRange(lowerLimit: floor, upperLimit: floor)
        //self.constraints = [SKConstraint.positionY(range)]
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
     
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = BodyType.hero.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.enemy.rawValue | BodyType.enemyTorpedo.rawValue | BodyType.asteroid.rawValue
        self.physicsBody?.collisionBitMask = BodyType.enemy.rawValue | BodyType.enemyTorpedo.rawValue | BodyType.asteroid.rawValue
    
    }
    
    func getType() -> Int{
        return type
    }
    
    func setType(type: Int){
        self.type = type
    }
    
    func getHealth() -> Int {
        return health
    }
    
    func setHealth(health: Int) {
        self.health = health
    }
    
    func getDamage() -> Int {
        return damage
    }
    
    func setDamage(damage: Int) {
        self.damage = damage
    }
    
    func shoot() {
        print("shooting")
    }
    
    func animate() {
        print("animate")
    }
    
    func destory() {
        print("destroy")
    }

}
