//
//  GameViewController.swift
//  Ass2
//
//  Created by Martin Liang on 27/4/21.
//

import UIKit

class GameViewController: UIViewController {

    var existingBubbles = [UIButton]()
    var timer: String = ""
    var numOfBubbles: Int!
    let noBubbles = 0
    var scores = 0
    var buttonNumber = 0
    //var maxNumBubbles = 15
    @IBOutlet var gameScreen: UIView!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        Score.text = timer
        var timer = Timer.scheduledTimer(withTimeInterval: 1, repeats: true){ timer in
            self.loadScreen()
            self.removeBubbles()
        }
        
    }
    //let bubble = Bubble()
    
    
    @IBOutlet weak var Score: UILabel!
    
    func loadScreen(){
        
        
        if(existingBubbles.isEmpty){
            let tmp = createButton()
            existingBubbles.append(tmp)
            view.addSubview(tmp)
        }
        
        while(existingBubbles.count < numOfBubbles){
            var intersects = true
            let tmpBtn = createButton()
            
            for buttons in existingBubbles {
                if(buttons.frame.intersects(tmpBtn.frame)){
                    intersects = false
                } else {
                    Score.text = "overlap"
                }
            }
            if(intersects){
                existingBubbles.append(tmpBtn)
                view.addSubview(tmpBtn)
            }
        }
    }
    
    func removeBubbles(){
        var rndBubbles = Int.random(in: 0...4)
        if existingBubbles.count > rndBubbles{
            for _ in (0...rndBubbles){
                var bubbleToRmv = Int.random(in: 0...existingBubbles.count-1)
                existingBubbles[bubbleToRmv].removeFromSuperview()
                existingBubbles.remove(at: bubbleToRmv)
                
            }
        }
    }
    
    func isMaxBubbles() -> Bool{
        return existingBubbles.count == numOfBubbles
    }
    
    
    
    func createButton() -> UIButton{
        let width = UIScreen.main.bounds.width - 80
        let height = UIScreen.main.bounds.height
        
        let x = Int.random(in: 0...Int(width))
        let y = Int.random(in: 0 + 80...Int(height) - 100)
        
        let button = UIButton(type: .custom)
        button.frame = CGRect(x: x,y: y, width: 80, height: 80)
        button.setImage(UIImage(named: getColour()), for: .normal)
        button.addTarget(self, action: #selector(removeButton(_ :)), for: .touchUpInside)
        
        
        return button
    }
    
    
    @objc func removeButton(_ button: UIButton) {
        scores += 1
        Score.text = String(scores)
        button.removeFromSuperview()
        
        let index = existingBubbles.firstIndex(of: button)
        existingBubbles.remove(at: index!)
        
    }
    
    func getColour() -> String {
        let randomInt = Int.random(in: 1..<101)
        
        switch (randomInt){
        case let (randomInt) where randomInt <= 40:
            return "Red"
        case let (randomInt) where randomInt > 40 && randomInt <= 70:
            return "Pink"
        case let (randomInt) where randomInt > 70 && randomInt <= 85:
            return "Green"
        case let (randomInt) where randomInt > 85 && randomInt <= 95:
            return "Blue"
        case let (randomInt) where randomInt > 95 && randomInt <= 100:
            return "Black"
        default:
            break
        }
        return "null"
    }
}
