//
//  ViewController.swift
//  Assignment1
//
//  Created by Jiaxin Liu on 10/1/20.
//  Copyright © 2020 edu.northeastern.jiaxin. All rights reserved.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var player1: UILabel!
    
    @IBOutlet weak var player2: UILabel!
    
    @IBOutlet weak var player1card1: UIImageView!
    
    @IBOutlet weak var player1card2: UIImageView!
    
    @IBOutlet weak var player1card3: UIImageView!
    
    @IBOutlet weak var player2card1: UIImageView!
    
    @IBOutlet weak var player2card2: UIImageView!
    
    @IBOutlet weak var player2card3: UIImageView!
    
    @IBOutlet weak var winnerlabel: UILabel!
    
    let cards :[String] = ["2C","2D","2H", "2S","3C","3D","3H", "3S","4C","4D","4H", "4S","5C","5D","5H", "5S","6C","6D","6H", "7S","7C","7D","7H", "8S","8C","8D","8H", "9S","9C","9D","9H", "6S","10C","10D","10H", "10S","AC","AD","AH", "AS","JC","JD","JH", "JS","QC","QD","QH", "QS","KC","KD","KH", "KS"]
    
    var winner = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
    }
    
    func playCards(){
        let randomCard1 = Int.random(in: 0..<52)
        let randomCard2 = Int.random(in: 0..<52)
        let randomCard3 = Int.random(in: 0..<52)

        player1card1.image = UIImage(named: cards[randomCard1])
        player1card2.image = UIImage(named: cards[randomCard2])
        player1card3.image = UIImage(named: cards[randomCard3])

        let randomCard4 = Int.random(in: 0..<52)
        let randomCard5 = Int.random(in: 0..<52)
        let randomCard6 = Int.random(in: 0..<52)

        player2card1.image = UIImage(named: cards[randomCard4])
        player2card2.image = UIImage(named: cards[randomCard5])
        player2card3.image = UIImage(named: cards[randomCard6])
        
        if cards[randomCard1] == "AS" || cards[randomCard2] == "AS" || cards[randomCard3] == "AS" {
            winner = 1
        }
        
        if cards[randomCard4] == "AS" || cards[randomCard5] == "AS" || cards[randomCard6] == "AS" {
            winner = 2
        }

    }
    
    
    @IBAction func play(_ sender: UIButton) {
        winner = 0
        playCards()
        if winner != 0{
            if winner == 1{
                winnerlabel.text = "Player1 win!"
            }else{
                winnerlabel.text = "Player2 win!"
            }
        }else{
            winnerlabel.text = "No Winner"
        }
        
    }
    

    
}

