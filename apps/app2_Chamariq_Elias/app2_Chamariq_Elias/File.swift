//
//  File.swift
//  app2_Chamariq_Elias
//
//  Created by Elias Chamariq on 9/23/20.
//  Copyright © 2020 Elias Chamariq. All rights reserved.
//

import Foundation

class gameBoard {
    var player: Bool
    var board: [Int]
    
    init() {
        player = true
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    func reset() {
        player = true
        board = [0, 0, 0, 0, 0, 0, 0, 0, 0]
    }
    
    func checkWin() -> (Int, [Int]) {
        if player {
            if rowCheck().0 {
                return (1, rowCheck().1)
            } else if columnCheck().0 {
                return (1, columnCheck().1)
            } else if isFull() {
                return (0, [0])
            }
        } else {
            if rowCheck().0 {
                return (2, rowCheck().1)
            } else if columnCheck().0 {
                return (2, columnCheck().1)
            } else if isFull() {
                return (0, [0])
            }
        }
        return (-1, [0])
    }
    
    func X(_ index: Int) {
        if board[index] == 0 {
            board[index] = 1
            player = !player
        }
    }
    
    func O(_ index: Int) {
        if board[index] == 0 {
            board[index] = 2
            player = !player
        }
    }
    
    func rowCheck() -> (Bool, [Int]) {
        if board[0] == board[1] && board[1] == board[2] && board[2] != 0{
            return (true, [0, 1, 2])
        } else if board[3] == board[4] && board[4] == board[5] && board[5] != 0{
            return (true, [3, 4, 5])
        } else if board[6] == board[7] && board[7] == board[8] && board[8] != 0{
            return (true, [6, 7, 8])
        } else {
            return (false, [0])
        }
    }
    
    func columnCheck() -> (Bool, [Int]) {
        if board[0] == board[3] && board[3] == board[6] && board[6] != 0{
            return (true, [0, 3, 6])
        } else if board[1] == board[4] && board[4] == board[7] && board[7] != 0{
            return (true, [1, 4, 7])
        } else if board[2] == board[5] && board[5] == board[8] && board[8] != 0{
            return (true, [2, 5, 8])
        } else if board[2] == board[4] && board[4] == board[6] && board[6] != 0{
            return (true, [2, 4, 6])
        } else if board[0] == board[4] && board[4] == board[8] && board[8] != 0{
            return (true, [0, 4, 8])
        } else {
            return (false, [0])
        }
    }
    
    func isFull() -> Bool {
        for elem in board {
            if (elem == 0) {
                return false
            }
        }
        return true
    }
    
}

