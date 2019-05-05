//
//  GameScene.swift
//  Half Baked
//
//  Created by Prudhvi Gadiraju on 5/5/19.
//  Copyright © 2019 Prudhvi Gadiraju. All rights reserved.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let sheet = SpriteSheet(texture: SKTexture(imageNamed: "MainGuySpriteSheet"), rows: 4, columns: 3, spacing: 1, margin: 1)
    var player: SKSpriteNode!
    
    let moveStick = TLAnalogJoystick(withDiameter: 100)
    let turnStick = TLAnalogJoystick(withDiameter: 100)
    
    override func didMove(to view: SKView) {
        
        /// Add Background
        let background = SKSpriteNode(imageNamed: "wood")
        background.zPosition = -1
        addChild(background)
        
        // Create Player Sprite
        player = SKSpriteNode(texture: sheet.textureForColumn(column: 0, row: 0))
        player.scale(to: .init(width: playerScaleRatio, height: playerScaleRatio))
        player.position = CGPoint(x: 0, y: 0)
        addChild(player)
        
        // Add Movement Joystick to the screen
        moveStick.position = CGPoint(x: -400, y: -250)
        addChild(moveStick)
        
        
        // Movement Joystick Handlers
        moveStick.on(.begin) { (j) in
            print(j.angular)
            print(j.velocity)
        }
        
        moveStick.on(.move) { (j) in
            print(j.angular)
            print(j.velocity)
            
            let x = self.player.position.x + (j.velocity.x * MovementRatio)
            let y = self.player.position.y + (j.velocity.y * MovementRatio)
            
            self.player.position = CGPoint(x: x, y: y)
        }
        
        moveStick.on(.end) { (j) in
            print(j.angular)
            print(j.velocity)
        }
        
        // Add Turn Joystick to the screen
        turnStick.position = CGPoint(x: 400, y: -250)
        addChild(turnStick)
        
        
        // Turn Joystick Handlers
        turnStick.on(.begin) { (j) in
        }
        
        turnStick.on(.move) { (j) in
            let angle = j.angular
            self.player.zRotation = angle
        }
        
        turnStick.on(.end) { (j) in
        }
    }
    
    
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func touchesCancelled(_ touches: Set<UITouch>, with event: UIEvent?) {
    }
    
    override func update(_ currentTime: TimeInterval) {
    }
}
