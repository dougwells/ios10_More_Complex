//
//  ViewController.swift
//  tic-tac-toe
//
//  Created by Doug Wells on 11/30/16.
//  Copyright © 2016 Doug Wells. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    var xWin = false
    var oWin = false

    override func viewDidLoad() {
        super.viewDidLoad()
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func anyWinner (ticTacArr:[[Int]]) {

    }

    func checkRows (arr:[[Int]]) {
        for i in arr {
            whoWins(square1: i[0], square2: i[1], square3: i[2])
        }
    }
    
    
    func checkCols (ticTacArr:[[Int]]) {
        for i in 0...2 {
            let sq1 = ticTacArr[0][i]
            let sq2 = ticTacArr[1][i]
            let sq3 = ticTacArr[2][i]
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
    
    
    


}

