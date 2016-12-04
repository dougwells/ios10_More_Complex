//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Doug Wells on 11/30/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var xWin =      false
    var oWin =      false
    var imageX =    false
    var newTicTacGrid:  [[Int]] = [[5,5,5], [5,5,5], [5,5,5]]

    @IBOutlet weak var announceWinner: UILabel!
    @IBOutlet weak var playAgain: UIButton!

    @IBAction func playAgainTapped(_ sender: Any) {
        
        //Reset Game Booleans
        xWin = false
        oWin = false
        imageX = false
        
        //Reset Grid
        newTicTacGrid = [[5,5,5], [5,5,5], [5,5,5]]
        
        //Reset X O images
        for i in 11...13 {
            if let button = view.viewWithTag(i) as? UIButton {
               button.setImage(nil, for: .normal)
            }
        }
        
        for i in 21...23 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: .normal)
            }
        }
        
        for i in 31...33 {
            if let button = view.viewWithTag(i) as? UIButton {
                button.setImage(nil, for: .normal)
            }
        }

        
        //Reset Winner Announcement & Play Again Button
        print("Play again tapped")
        announceWinner.text = ""
        playAgain.setTitle("",for: .normal)
        print(newTicTacGrid)
        //didSomeoneWin(ticTacArr: [[5,5,5], [5,5,5], [5,5,5]])


        //Reset Xs & Os on grid
/*        for i in 11...13 {
            let tmpButton = self.view.viewWithTag(i) as! UIButton
            tmpButton.setImage(UIImage(named: "")!, for: .normal)
        }
 */
    }
    
    
    @IBAction func squareTapped(_ sender: UIButton!) {
        var i = Int(sender.tag)/10 - 1
        var j = Int(sender.tag)%10 - 1
        
        func markXOrY() {
            if (imageX && newTicTacGrid[i][j] == 5) {
                newTicTacGrid[i][j] = 1
                sender.setImage(UIImage(named: "cross.png")!, for: .normal)
                imageX = !imageX
            } else if !imageX && newTicTacGrid[i][j] == 5 {
                newTicTacGrid[i][j] = 0
                sender.setImage(UIImage(named: "nought.png")!, for: .normal)
                imageX = !imageX
            }
            didSomeoneWin(ticTacArr: newTicTacGrid)
            print("From within markXOrY fn: ", newTicTacGrid)
        }
        
        
        switch (sender.tag){
        case 11:
            print(Int(sender.tag))
            markXOrY()
        case 12:
            print(sender.tag)
            markXOrY()
        case 13:
            print(sender.tag)
            markXOrY()
        case 21:
            print(sender.tag)
            markXOrY()
        case 22:
            print(sender.tag)
            markXOrY()
        case 23:
            print(sender.tag)
            markXOrY()
        case 31:
            print(sender.tag)
            markXOrY()
        case 32:
            print(sender.tag)
            markXOrY()
        case 33:
            print(sender.tag)
            markXOrY()
        default:
            print("No Code")
            markXOrY()
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func didSomeoneWin (ticTacArr:[[Int]]) {
        checkRows(arr: ticTacArr)
        checkCols(arr: ticTacArr)
        checkDiag(arr: ticTacArr)
        if xWin{
            announceWinner.text = "X Wins !!"
            playAgain.setTitle("Play Again?",for: .normal)
        }
        if oWin {
            announceWinner.text = "O Wins !!"
            playAgain.setTitle("Play Again?",for: .normal)
        }
    }

    func checkRows (arr:[[Int]]) {
        print("checkRows: ", arr)
        for i in arr {
            whoWins(square1: i[0], square2: i[1], square3: i[2])
        }
    }
    
    
    func checkCols (arr:[[Int]]) {
        print("checkCols: ", arr)
        for i in 0...2 {
            let sq1 = arr[0][i]
            let sq2 = arr[1][i]
            let sq3 = arr[2][i]
            whoWins(square1: sq1, square2: sq2, square3: sq3)
        }
    }
    
    func checkDiag (arr:[[Int]]) {
        print("checkDiag: ", arr)
        whoWins(square1: arr[0][0], square2: arr[1][1], square3: arr[2][2])
        whoWins(square1: arr[2][0], square2: arr[1][1], square3: arr[0][2])
        
        
    }
    
    func whoWins (square1: Int, square2: Int, square3: Int) {
        let score = square1 + square2 + square3
        if score == 3 {xWin = true}
        if score == 0 {oWin = true}
        return
    }
    
    func resetGame (ticTacArr:[[Int]]) {
        
    }
    
    
    
    


}

