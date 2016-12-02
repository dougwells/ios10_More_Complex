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
    var imageX =    true
    var newTicTacGrid:  [[Int]] = [[5,5,5], [5,5,5], [5,5,5]]


    @IBAction func squareTapped(_ sender: UIButton!) {
        switch (sender.tag){
        case 11:
            print(sender.tag)
            if (imageX && newTicTacGrid[0][1] == 5) {
                newTicTacGrid[0][1] = 1
                sender.setImage(UIImage(named: "cross.png")!, for: .normal)
                imageX = !imageX
            } else if !imageX && newTicTacGrid[0][1] == 5 {
                newTicTacGrid[0][1] = 0
                sender.setImage(UIImage(named: "cross.png")!, for: .normal)
                imageX = !imageX
            }
        case 12:
            print(sender.tag)
        case 13:
            print(sender.tag)
        case 21:
            print(sender.tag)
        case 22:
            print(sender.tag)
        case 23:
            print(sender.tag)
        case 31:
            print(sender.tag)
        case 32:
            print(sender.tag)
        case 33:
            print(sender.tag)
        default:
            print("No Code")
        }
    }
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        didSomeoneWin(ticTacArr: newTicTacGrid)
        print("X win = ", xWin)
        print("O win = ", oWin)
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
 
    func didSomeoneWin (ticTacArr:[[Int]]) {
        checkRows(arr: ticTacArr)
        checkCols(arr: ticTacArr)
        checkDiag(arr: ticTacArr)
    }

    func checkRows (arr:[[Int]]) {
        for i in arr {
            whoWins(square1: i[0], square2: i[1], square3: i[2])
        }
    }
    
    
    func checkCols (arr:[[Int]]) {
        for i in 0...2 {
            let sq1 = arr[0][i]
            let sq2 = arr[1][i]
            let sq3 = arr[2][i]
            whoWins(square1: sq1, square2: sq2, square3: sq3)
        }
    }
    
    func checkDiag (arr:[[Int]]) {
        whoWins(square1: arr[0][0], square2: arr[1][1], square3: arr[2][2])
        whoWins(square1: arr[2][0], square2: arr[1][1], square3: arr[0][2])
        
        
    }
    
    func whoWins (square1: Int, square2: Int, square3: Int) {
        let score = square1 + square2 + square3
        if score == 3 {xWin = true}
        if score == 0 {oWin = true}
        return
    }
    
/*    func buttonAction(sender: UIButton!) {
        switch (sender.tag){
        case 0:
        //button 0 action
        case 1:
        //button 1 action
        case 2:
        //button 2 action
        case 3:
        //button 3 action
        case 4:
        //button 4 action
        default:
            //default
        }
    }
 */
    
    
    
    


}

