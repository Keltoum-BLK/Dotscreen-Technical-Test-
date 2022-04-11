//
//  ViewController.swift
//  TicTacToe
//
//  Created by Kel_Jellysh on 11/04/2022.
//

import UIKit

class TicTacToeViewController: UIViewController {
    
    enum Turn {
        case Nought
        case Cross
    }
    
    //MARK: Properties
    private weak var timer: Timer?
    lazy var countdownTime: Int = 180
    lazy var timeIsRuuning = false
    var firstTurn = Turn.Cross
    var currentTurn = Turn.Cross
    var board = [UIButton]()
    
    var nought = UIImage(named: "circle.png")
    var cross = UIImage(named: "cross.png")
    var scoreP1 = 0
    var scoreP2 = 0
    
    //MARK: UI Properties
    //Information about game
    @IBOutlet weak var countdownLabel: UILabel!
    @IBOutlet weak var selectPlayer1BTN: UIButton!
    @IBOutlet weak var selectPlayer2BTN: UIButton!
    @IBOutlet weak var player1Score: UILabel!
    @IBOutlet weak var player2Score: UILabel!
    
    //Buttons to select to play
    //Rang1
    @IBOutlet weak var rang1BTN1: UIButton!
    @IBOutlet weak var rang1BTN2: UIButton!
    @IBOutlet weak var rang1BTN3: UIButton!
    //Rang 2
    @IBOutlet weak var rang2BTN1: UIButton!
    @IBOutlet weak var rang2BTN2: UIButton!
    @IBOutlet weak var rang2BTN3: UIButton!
    //Rang3
    @IBOutlet weak var rang3BTN1: UIButton!
    @IBOutlet weak var rang3BTN2: UIButton!
    @IBOutlet weak var rang3BTN3: UIButton!
    
    //MARK: Circle Life
    override func viewDidLoad() {
        super.viewDidLoad()
        countdownTimer()
        initBoard()
    }
    
    func initBoard() {
        board.append(rang1BTN1)
        board.append(rang1BTN2)
        board.append(rang1BTN3)
        board.append(rang2BTN1)
        board.append(rang2BTN2)
        board.append(rang2BTN3)
        board.append(rang3BTN1)
        board.append(rang3BTN2)
        board.append(rang3BTN3)
    }
    
    func fullBoard() -> Bool {
        for button in board {
            if button.imageView?.image == nil {
                return false
            }
        }
        return true
    }
    
    func countdownTimer() {
        timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(updateTimer), userInfo: nil, repeats: true)
    }
    
    func timeString(time:TimeInterval) -> String {
        let hours = Int(time) / 3600
        let minutes = Int(time) / 60 % 60
        let seconds = Int(time) % 60
        return String(format: "%02i:%02i:%02i", hours, minutes, seconds)
    }
    
    @objc func updateTimer() {
        countdownTime -= 1
        countdownLabel.text = timeString(time: TimeInterval(countdownTime))
        if countdownTime > 0 {
            countdownTime -= 1
            countdownLabel.text = timeString(time: TimeInterval(countdownTime))
        } else {
            countdownLabel.text = "00:00:00"
        }
    }
    
    func addToBoard(_ sender: UIButton) {
        if sender.title(for: .normal) == nil {
            if currentTurn == Turn.Nought{
                sender.setImage(nought, for: .normal)
                currentTurn = Turn.Cross
            } else if currentTurn == Turn.Cross {
                sender.setImage(cross, for: .normal)
                currentTurn = Turn.Nought
            }
        }
        sender.isEnabled = false
    }
    
    func reset() {
        for button in board {
            button.setImage(nil, for: .normal)
            button.isEnabled = true
        }
        if firstTurn == Turn.Nought {
            firstTurn = Turn.Cross
        } else if firstTurn == Turn.Cross {
            firstTurn = Turn.Nought
        }
        currentTurn = firstTurn
    }
    
    func checkVictoryPlayerOne(symbol:  UIImage) {
        //Horizontal victory
        if  thisSymbol(button: rang1BTN1, symbol: symbol), thisSymbol(button: rang1BTN2, symbol: symbol), thisSymbol(button: rang1BTN3, symbol: symbol) {
            scoreP1 += 1
            player1Score.text = "\(scoreP1)"
        }
        if  thisSymbol(button: rang2BTN1, symbol: symbol), thisSymbol(button: rang2BTN2, symbol: symbol), thisSymbol(button: rang2BTN3, symbol: symbol) {
            scoreP1 += 1
            player1Score.text = "\(scoreP1)"
        }
        if  thisSymbol(button: rang3BTN1, symbol: symbol), thisSymbol(button: rang3BTN2, symbol: symbol), thisSymbol(button: rang3BTN3, symbol: symbol) {
            scoreP1 += 1
            player1Score.text = "\(scoreP1)"
        }
        //Vertical Victory
        if  thisSymbol(button: rang1BTN1, symbol: symbol), thisSymbol(button: rang2BTN1, symbol: symbol), thisSymbol(button: rang3BTN1, symbol: symbol) {
            scoreP1 += 1
            player1Score.text = "\(scoreP1)"
        }
        if  thisSymbol(button: rang1BTN2, symbol: symbol), thisSymbol(button: rang2BTN2, symbol: symbol), thisSymbol(button: rang3BTN2, symbol: symbol) {
            scoreP1 += 1
            player1Score.text = "\(scoreP1)"
        }
        if  thisSymbol(button: rang1BTN3, symbol: symbol), thisSymbol(button: rang2BTN3, symbol: symbol), thisSymbol(button: rang3BTN3, symbol: symbol) {
            scoreP1 += 1
            player1Score.text = "\(scoreP1)"
        }
        //Diagonal Victory
        if  thisSymbol(button: rang1BTN1, symbol: symbol), thisSymbol(button: rang2BTN2, symbol: symbol), thisSymbol(button: rang3BTN3, symbol: symbol) {
            scoreP1 += 1
            player1Score.text = "\(scoreP1)"
        }
        if  thisSymbol(button: rang1BTN3, symbol: symbol), thisSymbol(button: rang2BTN2, symbol: symbol), thisSymbol(button: rang3BTN1, symbol: symbol) {
            scoreP1 += 1
            player1Score.text = "\(scoreP1)"
        }
    }
    
    func checkVictoryPlayerTwo(symbol:  UIImage) {
        //Horizontal victory
        if  thisSymbol(button: rang1BTN1, symbol: symbol), thisSymbol(button: rang1BTN2, symbol: symbol), thisSymbol(button: rang1BTN3, symbol: symbol) {
            scoreP2 += 1
            player2Score.text = "\(scoreP2)"
        }
        if  thisSymbol(button: rang2BTN1, symbol: symbol), thisSymbol(button: rang2BTN2, symbol: symbol), thisSymbol(button: rang2BTN3, symbol: symbol) {
            scoreP2 += 1
            player2Score.text = "\(scoreP2)"
        }
        if  thisSymbol(button: rang3BTN1, symbol: symbol), thisSymbol(button: rang3BTN2, symbol: symbol), thisSymbol(button: rang3BTN3, symbol: symbol) {
            scoreP2 += 1
            player2Score.text = "\(scoreP2)"
        }
        //Vertical Victory
        if  thisSymbol(button: rang1BTN1, symbol: symbol), thisSymbol(button: rang2BTN1, symbol: symbol), thisSymbol(button: rang3BTN1, symbol: symbol) {
            scoreP2 += 1
            player2Score.text = "\(scoreP2)"
        }
        if  thisSymbol(button: rang1BTN2, symbol: symbol), thisSymbol(button: rang2BTN2, symbol: symbol), thisSymbol(button: rang3BTN2, symbol: symbol) {
            scoreP2 += 1
            player2Score.text = "\(scoreP2)"
        }
        if  thisSymbol(button: rang1BTN3, symbol: symbol), thisSymbol(button: rang2BTN3, symbol: symbol), thisSymbol(button: rang3BTN3, symbol: symbol) {
            scoreP2 += 1
            player2Score.text = "\(scoreP2)"
        }
        //Diagonal Victory
        if  thisSymbol(button: rang1BTN1, symbol: symbol), thisSymbol(button: rang2BTN2, symbol: symbol), thisSymbol(button: rang3BTN3, symbol: symbol) {
            scoreP2 += 1
            player2Score.text = "\(scoreP2)"
        }
        if  thisSymbol(button: rang1BTN3, symbol: symbol), thisSymbol(button: rang2BTN2, symbol: symbol), thisSymbol(button: rang3BTN1, symbol: symbol) {
            scoreP2 += 1
            player2Score.text = "\(scoreP2)"
        }
    }
    
    func thisSymbol(button: UIButton, symbol: UIImage) -> Bool {
        return button.image(for: .normal) == symbol
    }
    
    func restart(title: String) {
        let ac = UIAlertController(title: title, message: nil, preferredStyle: .actionSheet)
        ac.addAction(UIAlertAction(title: "Reset", style: .default, handler: { (_) in
            self.reset()
        }))
        self.present(ac, animated: true)
    }
    
    @IBAction func boardTapAction(_ sender: UIButton) {
        addToBoard(sender)
        guard let symbolPlayerOne = UIImage(named: "cross.png") else { return }
        guard let symbolPlayerTwo = UIImage(named: "circle.png") else { return }
        if fullBoard() {
            checkVictoryPlayerOne(symbol: symbolPlayerOne)
            checkVictoryPlayerTwo(symbol: symbolPlayerTwo)
            restart(title: "New Party")
        }
    }
}


