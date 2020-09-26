//
//  ViewController.swift
//  app2_Chamariq_Elias
//
//  Created by Elias Chamariq on 9/17/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var reset: UIButton!
    @IBOutlet var buttons: [UIButton]!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        reset.tintColor = .red
    }

    
    @IBOutlet weak var gameTitle: UILabel!
    @IBOutlet weak var playerOne: UILabel!
    @IBOutlet weak var playerTwo: UILabel!
    @IBOutlet weak var gameState: UILabel!
    
    var game = gameBoard()
    var player1 = 0
    var player2 = 0
    var continueGame = true
    
    
    @IBAction func tap(_ sender: UIButton) {
        if continueGame {
            if game.player {
                gameState.text = "Player 2's Turn"
                let buttonImage = UIImage(named:"mark-x")?.withRenderingMode(.alwaysTemplate)
                sender.setImage(buttonImage, for: .normal)
                game.X(sender.tag)
            } else {
                gameState.text = "Player 1's Turn"
                let buttonImage = UIImage(named:"mark-o")?.withRenderingMode(.alwaysTemplate)
                sender.setImage(buttonImage, for: .normal)
                game.O(sender.tag)
            }
            if (game.checkWin().0 == 2) {
                gameState.text = "Player 1 Won!"
                player1 += 1
                playerOne.text = "P1 Score: \(player1)"
                continueGame = false
                view.backgroundColor = .systemGreen
                let winners = game.checkWin().1
                for winner in winners {
                    buttons[winner].tintColor = .systemYellow
                }
                
            } else if game.checkWin().0 == 1 {
                gameState.text = "Player 2 Won!"
                player2 += 1
                playerTwo.text = "P2 Score: \(player2)"
                continueGame = false
                view.backgroundColor = .systemGreen
                let winners = game.checkWin().1
                for winner in winners {
                    buttons[winner].tintColor = .systemYellow
                }
            } else if game.checkWin().0 == 0 {
                gameState.text = "Draw"
                continueGame = false
                for button in buttons {
                    button.tintColor = .systemGray
                }
            }
        }
    }
    
    @IBAction func clear(_ sender: Any) {
        for button in buttons {
            button.setImage(UIImage(named:"mark-none"), for: .normal)
        }
        gameState.text = "Player 1's Turn"
        continueGame = true
        game.reset()
        view.backgroundColor = .systemBackground
        for button in buttons {
            button.tintColor = .systemBlue
        }
    }
    
    @IBAction func eradicate(_ sender: Any) {
        clear(game)
        player1 = 0
        player2 = 0
        playerOne.text = "P1 Score:"
        playerTwo.text = "P2 Score:"
    }
    
}

