//
//  SelectExerciseController.swift
//  my little 101
//
//  Created by Carsten Sandtner_ on 12.06.17.
//  Copyright © 2017 Appsbude. All rights reserved.
//

import UIKit

class SelectExerciseController: UIViewController {

    @IBOutlet var ExerciseButtons: [UIButton]!
    
    @IBOutlet weak var testLabel: UILabel!
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func changeLanguage(_ sender: Any) {
        guard let button = sender as? UIButton else {
            return
        }
        
        testLabel.text = "\(button.tag)"
        /** switch button.tag {
            case 1:
                testLabel.text = "\(button.tag))"
                break;
            case 2:
            // Change to Spanish
                break;
            case 3:
            // Change to French, etc
                break
            default:
                print("Unknown language")
                return
        }
         **/
    }
}
