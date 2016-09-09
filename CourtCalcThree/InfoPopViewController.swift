//
//  InfoPopViewController.swift
//  CourtCalcThree
//
//  Created by RYAN CHRISTENSEN on 2/29/16.
//  Copyright © 2016 RYAN CHRISTENSEN. All rights reserved.
//

import UIKit

class InfoPopViewController: UIViewController {
  

    override func viewDidLoad() {
        super.viewDidLoad()
      
      let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.Light)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
    
      let imageView = UIImageView(image: UIImage(named: "unicat copy.png"))
      imageView.frame = view.bounds
      imageView.contentMode = .ScaleToFill
      view.insertSubview(imageView, atIndex: 0)
      blurEffectView.frame = self.view.bounds
      view.insertSubview(blurEffectView, atIndex: 1)

    }


  @IBAction func doneButtonPressed(sender: AnyObject) {
    self.dismissViewControllerAnimated(true) { () -> Void in
      
    }
  }
  

}
