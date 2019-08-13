//
//  Asteroid.swift
//  project
//
//  Created by Cat Nian on 2019-07-29.
//  Copyright © 2019 JN. All rights reserved.
//

import Foundation
import SpriteKit
import GameKit

class Asteroid: SKSpriteNode, Spaceship {
    var type: Int
    var health: Int
    var damage: Int
    
    init(){
        type = 1
        health = 5
        damage = 100
        let img = SKTexture(imageNamed: "asteroid")
        super.init(texture: img, color: UIColor.clear, size: CGSize(width: 100, height: 100))
        setPosition()
    }
    
    init(type: Int, health: Int, damage: Int){
        self.type = type
        self.health = health
        self.damage = damage
        let img = SKTexture(imageNamed: "asteroid")
        super.init(texture: img, color: UIColor.clear, size: CGSize(width: 100, height: 100))
        setPosition()
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    func setPosition(){
        print("asteroid position set")
        let screen = UIScreen.main.bounds
        let top = (screen.height / 2) - 50
        let randomX = Int.random(in: (Int)(screen.width / -2) ..< (Int)(screen.width / 2))
        self.position = CGPoint(x: (CGFloat)(randomX), y: top)
        self.zPosition = 1
       
   
       self.physicsBody = SKPhysicsBody(texture: self.texture!, size: self.size)
//        self.physicsBody = SKPhysicsBody(circleOfRadius: self.frame.width / 2, center: .zero)
//         print("asteroid size: \(self.texture!.size())")
        self.physicsBody?.isDynamic = true
        self.physicsBody?.affectedByGravity = false
        self.physicsBody?.mass = 10000
        self.physicsBody?.categoryBitMask = BodyType.asteroid.rawValue
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
    
    func move(){
        let path = UIBezierPath()
        path.move(to: .zero)
        path.addLine(to: CGPoint(x: 0, y: -10000))
        
        let movement = SKAction.follow(path.cgPath, asOffset: true, orientToPath: true, speed: 150)
        let sequence = SKAction.sequence([movement, .removeFromParent()])
        run(sequence)
    }
    func animate() {
        print("animate")
    }
    
    func destory() {
        print("destory")
    }
    
    
}
