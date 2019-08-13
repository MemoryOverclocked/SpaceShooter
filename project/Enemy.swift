//
//  Enemy.swift
//  project
//
//  Created by Cat Nian on 2019-07-29.
//  Copyright © 2019 JN. All rights reserved.
//

import Foundation
import SpriteKit

class Enemy: SKSpriteNode, Spaceship {
    var type: Int
    var health: Int
    var damage: Int
    
    init(){
        type = 1
        health = 50
        damage = 25
     
        let img = SKTexture(imageNamed: "spacecraft2")
        super.init(texture: img, color: UIColor.clear, size: CGSize(width: 100, height: 100))
        print("enemy type: \(type) created")
        setPosition()
    }
    
    init(type: Int, health: Int, damage: Int){
        self.type = type
        self.health = health
        self.damage = damage
        let img = SKTexture(imageNamed: "spacecraft2")
        super.init(texture: img, color: UIColor.clear, size: CGSize(width: 100, height: 100))
            print("enemy type: \(type) created")
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    
    func setPosition(){
        print("enemy position set")
        let screen = UIScreen.main.bounds
        let top = (screen.height / 2) - self.frame.height
        self.position = CGPoint(x: 0, y: top)
        self.zPosition = 1
        // Restrict y axis movement
        //let range = SKRange(lowerLimit: floor, upperLimit: floor)
        //self.constraints = [SKConstraint.positionY(range)]
        
        self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
        self.physicsBody?.isDynamic = false
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.categoryBitMask = BodyType.enemy.rawValue
        self.physicsBody?.contactTestBitMask = BodyType.hero.rawValue | BodyType.heroTorpedo.rawValue | BodyType.heroBomb.rawValue
        self.physicsBody?.collisionBitMask = BodyType.hero.rawValue | BodyType.heroTorpedo.rawValue | BodyType.heroBomb.rawValue
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
    
    
    func animate() {
        print("animate")
    }
    
    func destory() {
        print("destory")
    }
    
    
}
