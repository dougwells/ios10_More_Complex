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
        // Do any additional setup after loading the view, typically from a nib.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    func anyWinner (ticTacArr:[[Int]]) {

    }
    

    
/*    func checkRows (arr:[[Int]]) {
        for i in arr {
            let sq1 = arr[i][0]
            let sq2 = arr[i][1]
            let sq3 = arr[i][2]
            whoWins(square1: sq1, square2: sq1, square3: sq1)
        }
    }
 */
    
    func checkCols (ticTacArr:[[Int]]) {
        
    }
    
    func checkDiag (ticTacArr:[[Int]]) {
        
    }
    
    func whoWins (square1: Int, square2: Int, square3: Int) {
        let score = square1 + square2 + square3
        if score == 3 {xWin = true}
        if score == 0 {oWin = true}
        return
    }
    
    
    


}

