//
//  ViewController.swift
//  Tic tac toe Training
//
//  Created by Сергей Емелин on 21.11.2024.
//

import UIKit

class ViewController: UIViewController {

    var player = 1
    
    var arrayBoard = [0, 0, 0, 0, 0, 0, 0, 0, 0,]
    
    var winArrray = [[0, 1, 2], [3, 4, 5], [6, 7, 8], [0, 3, 6], [1, 4, 7], [2, 5, 8], [0, 4, 8], [2, 4, 6]]
    var moves = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    @IBAction func game(_ sender: UIButton) {
        print(sender.tag)
        
        if arrayBoard[sender.tag - 1] != 0 {
            return
        }
        
        arrayBoard[sender.tag - 1] = player
        
        if player == 1 {
            sender.setBackgroundImage(UIImage(named: "cross"), for: .normal)
            player = 2
        } else {
            sender.setBackgroundImage(UIImage(named: "zero"), for: .normal)
            player = 1
        }
        
        moves += 1
        print(moves)

        for win in winArrray {
            
            if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] != 0 {
                
                let winner = arrayBoard[win[2]] == 1 ? "X" : "O"
                
                let alert = UIAlertController(title: "\(winner) Win!", message: "\(winner) Win!", preferredStyle: .alert)
                
                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in self.clearBoard()
                }))
                present(alert, animated: true)
                moves = 0
                
                //            } else if arrayBoard[win[0]] == arrayBoard[win[1]] && arrayBoard[win[1]] == arrayBoard[win[2]] && arrayBoard[win[2]] == 2 {
                //                print("O win")
                //
                //                let alert = UIAlertController(title: "O Win!", message: "O Win!", preferredStyle: .alert)
                //
                //                alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in self.clearBoard()
                //                }))
                //                present(alert, animated: true)
                //                moves = 0
            }
        }
                if moves > 8 {
                    let alert = UIAlertController(title: "Draw", message: "Draw", preferredStyle: .alert)
                    alert.addAction(UIAlertAction(title: "Ok", style: .default, handler: { UIAlertAction in self.clearBoard()
                                    }))
                    present(alert, animated: true)
                    moves = 0
                }
       
            }
    
    func clearBoard() {
        for i in 0...8 {
            let button = view.viewWithTag(i + 1) as! UIButton
            button.setBackgroundImage(nil, for: .normal)
            
            arrayBoard[i] = 0
        }
        player = 1
    }

}

