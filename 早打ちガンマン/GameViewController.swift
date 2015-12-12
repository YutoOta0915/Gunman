//
//  GameViewController.swift
//  早打ちガンマン
//
//  Created by 大田　雄翔 on 2015/11/29.
//  Copyright (c) 2015年 大田　雄翔. All rights reserved.
//

import UIKit

class GameViewController: UIViewController {
    
    var number : Int = 1
    @IBOutlet var label : UILabel!
    var numArray = [ 1,2,3,4]
    var buttonArray :[UIButton] = []

    func tapped (sender: UIButton){
        NSLog("tag = %d",sender.tag)
        if(sender.tag == number){
            label.text = " 正解"
            number = number + 1
        }
        else{
        label.text = "不正解"
        }
        
        if number == 4+1 {
            getRandButton()
            number = 1
        }
        
        
        
    }

override func viewDidLoad() {
        super.viewDidLoad()
        

        for i in 1...4 {
           
            let button = UIButton()
            button.frame = CGRectMake(0, 0, 50, 50)
            var p: CGFloat = (2*CGFloat(i) - 1)/8
            button.center = CGPoint(x: self.view.frame.width*p, y:self.view.frame.height/2)
            button.backgroundColor = UIColor.blueColor()
           
            button.setTitleColor(UIColor.whiteColor(), forState: .Normal)
            
            self.view.addSubview(button)
            button.addTarget(self, action: "tapped:", forControlEvents:.TouchUpInside)
            buttonArray.append(button)
    }
    
        self.getRandButton()

        // Do any additional setup after loading the view.
    }
    
    func getRandButton(){
        numArray = shuffle (numArray)
        var i = 0
        for button in buttonArray {
            button.tag = numArray[i]
            button.setTitle(String(numArray[i]), forState: .Normal)
            i++
        }
    }
    
    func shuffle(array:[Int])-> [Int]{
        
         var shuffleArray = array
        
       
        var shuffledArray:[Int] = []
        for i in 0..<array.count {
             var rand: Int = Int(arc4random_uniform(UInt32(shuffleArray.count)))
            shuffledArray.append(shuffleArray[rand])
            shuffleArray.removeAtIndex(rand)
        }
        return shuffledArray
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepareForSegue(segue: UIStoryboardSegue, sender: AnyObject?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}
