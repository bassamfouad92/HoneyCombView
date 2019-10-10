//
//  HoneyComb.swift
//  HoneyCombStructure
//
//  Created by Apple on 06/10/2019.
//  Copyright © 2019 Bassam. All rights reserved.
//

import Foundation
import UIKit

class HoneyComb: UIView {
    
    let honeyImg = UIImage(named:"honey")
    var label : UILabel?
    
    var left : HoneyComb?
    var rigth : HoneyComb?
    
    override init(frame: CGRect) {
        super.init(frame: frame)
        
        configure()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        
        configure()
    }
    
    func configure(){
        
        let honeyImageView = UIImageView(frame:CGRect(x:0, y: 0, width:self.frame.width, height:self.frame.height))
        honeyImageView.image = honeyImg
        
        label = UILabel(frame:CGRect(x:0, y: 0, width:self.frame.width, height:self.frame.height))
        label!.textAlignment = .center
        label!.textColor = UIColor.black
        label!.font = UIFont.italicSystemFont(ofSize:12)
        
        self.addSubview(honeyImageView)
        self.addSubview(label!)
        
    }
    
    func addRightView(_ view : HoneyComb)
    {
        
    }
}
