//
//  ViewController.swift
//  Bee Fact
//
//  Created by Sébastien Kothé on 27/08/2020.
//  Copyright © 2020 Sébastien Kothé. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet var factButtons: [UIButton]!
    @IBOutlet weak var factTitle: UILabel!
    @IBOutlet weak var factImage: UIImageView!
    @IBOutlet weak var factDescription: UILabel!
    @IBOutlet weak var factCounter: UILabel!
    @IBOutlet weak var factContainer: UIView!
    @IBOutlet weak var factStackView: UIStackView!
    
    var currentIndex = 0
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        showTheBeeFact()
        
        //Used to rounded elements
        roundElements(element: factContainer)
        roundElements(element: factImage)
        
        for button in factButtons {
            roundElements(element: button)
        }
    }
    
    /// Used to set up the fact buttons
    func roundElements(element: AnyObject) {
        element.layer.cornerRadius = 13
    }
    
    /// Used to fill the UI with the good informations
    func showTheBeeFact() {
        let factObject = beeFacts[currentIndex]
        factTitle.text = factObject.title
        factImage.image = factObject.imageFormatted
        factDescription.text = factObject.desc
        
        // To handle the counter
        factCounter.text = "\(String(factObject.image)) / \(beeFacts.count)"
    }
    
    /// Used to show an alert message
    func showAlert(message: String) {
        let alert = UIAlertController(title: "Error", message: message, preferredStyle: .alert)
        let action = UIAlertAction(title: "Okay!", style: .default, handler: nil)
        alert.addAction(action)
        present(alert, animated: true, completion: nil)
    }
    
    /// Used to animate factcontainer view
    func startAnimationWith(_ anim: UIView.AnimationOptions) {
        UIView.transition(with: factContainer, duration: 1, options: anim, animations: nil, completion: nil)
    }
    
    /// Executed when user tap on the bottoms buttons
    @IBAction func didTapOnFactButtons(_ sender: UIButton) {
        
        switch sender.tag {
        case 0:
            currentIndex -= 1
            startAnimationWith(.transitionFlipFromLeft)
        case 1:
            let randomNumber = Int.random(in: 0..<beeFacts.count)
            currentIndex = randomNumber
            startAnimationWith(.transitionFlipFromTop)
        case 2:
            currentIndex += 1
            startAnimationWith(.transitionFlipFromRight)
        default:
            showAlert(message: "Incorrect tag")
        }
        
        if currentIndex > beeFacts.count - 1 { currentIndex = 0 }
        if currentIndex < 0 { currentIndex = 8 }
        
        showTheBeeFact()
    }
}

