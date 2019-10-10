//
//  ViewController.swift
//  HoneyCombStructure
//
//  Created by Apple on 06/10/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var viewHoneyComb: UIView!
    
    var positions = [ReportingPositions]()
    var hcArray = [ReportingPositions]()
    var tags = [Int]()
    
    private var WIDTH_OF_HC = 60
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        //DummyPositions
        
        positions.append(ReportingPositions("Manager",1,0,true,0))
        positions.append(ReportingPositions("Senior D",2,1,true,1))
        positions.append(ReportingPositions("Web D",3,2,false,1))
        positions.append(ReportingPositions("iOS D",4,2,false,1))
        positions.append(ReportingPositions("And D",5,2,true,2))

        
       //position HoneyComb
       viewHoneyComb.frame = CGRect(x:self.view.center.x - 50, y:100, width:self.view.frame.width, height: self.view.frame.height)
    
       //generate honeyComb stack
       generateHoneyComb()
      // addPositionsToHoneyComb()
        
    }
    
    private func generateHoneyComb()
    {

        for i in stride(from: 0, through: 6, by: 1) {
            
            for j in stride(from: 1, through: i , by: 1) {
            
                var space = 0
                
                if j == 1 {
                    if(i == 1){
                        space = j * (WIDTH_OF_HC - 32)//make firt one in middle
                    }else{
                        space = j * (WIDTH_OF_HC - (i * 32))
                    }
                }
                else {
                    space = (WIDTH_OF_HC * j) - (i*32)
                }
                
                 //-
                //-
               //-   (multiply by 32 factor to align in diagnol sequence)
                
                var h = HoneyComb()
                h = HoneyComb(frame:CGRect(x:(space), y:i * (WIDTH_OF_HC - 4) , width:WIDTH_OF_HC, height:WIDTH_OF_HC))
                h.tag = Int.random(in: 0 ..< 9000000)
                h.label?.text = "BASSAM"
                tags.append(h.tag)
                print("tags : \(h.tag)")
                viewHoneyComb.addSubview(h)
        
            }
        }
        
    
    }
    
    func addPositionsToHoneyComb()
    {
        for t in tags {
            
           let hc = self.viewHoneyComb.viewWithTag(t) as? HoneyComb
        
            for p in positions {
                if(!isPositionInHC(p) && hc!.label?.text == "BASSAM"){
                     hc!.label?.text = p.name
                     hcArray.append(p)
                }
            }
        
        }
    }
    
    func removeHoneyComb(){
        
        for t in tags {
            
            let hc = self.viewHoneyComb.viewWithTag(t) as? HoneyComb
            
            if(hc!.label?.text == "BASSAM"){
                hc!.isHidden = true
            }
        }
    }
    
    func isPositionInHC(_ position : ReportingPositions)->Bool
    {
        for p in hcArray {
            if p.name == position.name {
                return true
            }
        }
        return false
    }
    
    
    func createChessBoard(){
        
        
        for j in stride(from: 0, through: 7 , by: 1) {
            
            
            for i in stride(from: 0 , through: 7 , by: 1) {
                
                let whiteBox = UIView(frame: CGRect(x: i * 28 , y: j * 30 , width: 30 , height: 30))
                
                if j%2 == 0 {
                    if i%2 == 0 {
                        whiteBox.backgroundColor = UIColor.brown
                        
                    }else {
                        
                        whiteBox.backgroundColor = UIColor.black
                    }
                }else {
                    if i%2 == 0 {
                        whiteBox.backgroundColor = UIColor.black
                        
                    }else {
                        
                        whiteBox.backgroundColor = UIColor.brown
                    }
                    
                }
                
                viewHoneyComb.addSubview(whiteBox)
            }
            
        }
        
    }

}

