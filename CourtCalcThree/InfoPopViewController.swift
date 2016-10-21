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
      
      let blurEffect = UIBlurEffect(style: UIBlurEffectStyle.light)
      let blurEffectView = UIVisualEffectView(effect: blurEffect)
    
      let imageView = UIImageView(image: UIImage(named: "unicat copy.png"))
      imageView.frame = view.bounds
      imageView.contentMode = .scaleToFill
      view.insertSubview(imageView, at: 0)
      blurEffectView.frame = self.view.bounds
      view.insertSubview(blurEffectView, at: 1)

    }


  @IBAction func doneButtonPressed(_ sender: AnyObject) {
    self.dismiss(animated: true) { () -> Void in
      
    }
  }
  

}
