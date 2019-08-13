//
//  GameScene.swift
//  project
//
//  Created by Cat Nian on 2019-07-28.
//  Copyright © 2019 JN. All rights reserved.
//

import SpriteKit

enum BodyType: UInt32 {
    case hero = 1
    case heroTorpedo = 2
    case heroBomb = 4
    case enemy = 8
    case enemyTorpedo = 16
    case asteroid = 32
}

class GameScene: SKScene, SKPhysicsContactDelegate {
    var hero = HeroShip()
    var enemies : Enemy?
    var timer : Timer?
   // var asteroids = [Asteroid]()
   // let waves = Bundle.main.decode(type: [Wave].self, file: "enemyWaves.json")
   // let enemyShips = Bundle.main.decode(type: [EnemyShips].self, file: "enemyShips.json")
   
    override func didMove(to view: SKView) {
        if let particles = SKEmitterNode(fileNamed: "starfield.sks"){
            particles.position = CGPoint(x: 0, y: self.frame.height / 2)
            particles.advanceSimulationTime(60)
            particles.zPosition = -1
            self.addChild(particles)
        }
    }
    
    override func sceneDidLoad() {
        self.size = CGSize(width: UIScreen.main.bounds.width, height: UIScreen.main.bounds.height)
        physicsWorld.contactDelegate = self
        self.addChild(hero)
        sendAsteroids()
        addEnemies()
    }
    
    override func update(_ currentTime: TimeInterval) {
        for child in children {
            if child.frame.maxX < 0 {
                if !frame.intersects(child.frame){
                    child.removeFromParent();
                }
            }
        }
    }
    
    func addEnemies(){
        let temp = Enemy()
        addChild(temp)
    }
    
    func sendAsteroids(){
        timer = Timer.scheduledTimer(timeInterval: 4, target: self, selector: #selector(createAsteroids), userInfo: nil, repeats: true)
    }
    
    @objc func createAsteroids(){
        print("addAsteroids")
        let temp = Asteroid()
        temp.move()
        addChild(temp)
    }
    
}
