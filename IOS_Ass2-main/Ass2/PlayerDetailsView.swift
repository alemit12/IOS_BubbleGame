//
//  PlayerDetailsView.swift
//  Ass2
//
//  Created by Martin Liang on 29/4/21.
//

import UIKit

class PlayerDetailsView: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func TimerMove(_ sender: Any) {
        ShowTimer.text = String(Int(Timer.value)) + " Seconds"
    }
    @IBOutlet weak var Timer: UISlider!
    
    @IBAction func NumBubblesMove(_ sender: Any) {
        ShowBubbles.text = String(Int(NumOfBubbles.value)) + " Bubbles"
    }
    @IBOutlet weak var ShowTimer: UILabel!
    
    @IBOutlet weak var ShowBubbles: UILabel!
    @IBOutlet weak var NumOfBubbles: UISlider!
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        let timerSlide = String(Int(Timer.value))
        
        let numOfBubbles = String(Int(NumOfBubbles.value))
        
        let vc = segue.destination as? GameViewController
        vc?.timer = timerSlide
        vc?.numOfBubbles = Int(numOfBubbles)
    }

}
