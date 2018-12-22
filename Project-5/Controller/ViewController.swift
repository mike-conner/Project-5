//
//  ViewController.swift
//  Project-4
//
//  Created by Mike Conner on 12/3/18.
//  Copyright © 2018 Mike Conner. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var entrantTypeSegmentedControl: UISegmentedControl!
    @IBOutlet weak var entrantSubTypeSegmentedControl: UISegmentedControl!
    

    override func viewDidLoad() {
        super.viewDidLoad()
        entrantSubTypeSegmentedControl.isHidden = true
        entrantSubTypeSegmentedControl.removeAllSegments()
        let entrantTypeFont = UIFont.boldSystemFont(ofSize: 22)
        let entrantSubTypeFont = UIFont.italicSystemFont(ofSize: 18)
        entrantTypeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: entrantTypeFont], for: .normal)
        entrantSubTypeSegmentedControl.setTitleTextAttributes([NSAttributedString.Key.font: entrantSubTypeFont], for: .normal)
    }
    
    @IBAction func segmentedControllerTop(_ sender: Any) {
        let itemSelected = entrantTypeSegmentedControl.selectedSegmentIndex
        
        switch itemSelected {
        case 0:
            entrantSubTypeSegmentedControl.isHidden = false
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Classic", at: 0, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "VIP", at: 1, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Free Child", at: 2, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Season", at: 3, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Senior", at: 4, animated: false)
        case 1:
            entrantSubTypeSegmentedControl.isHidden = false
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Food Services", at: 0, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Ride Services", at: 1, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Maintenance", at: 2, animated: false)
            entrantSubTypeSegmentedControl.insertSegment(withTitle: "Contract", at: 3, animated: false)
        case 2, 3:
            entrantSubTypeSegmentedControl.removeAllSegments()
            entrantSubTypeSegmentedControl.isHidden = true
        default:
            break
        }
        
    }
    
    @IBAction func segmentedControllerBottom(_ sender: Any) {
        
    }
    
    
}

