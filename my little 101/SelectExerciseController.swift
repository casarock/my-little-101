//
//  SelectExerciseController.swift
//  my little 101
//
//  Created by Carsten Sandtner_ on 12.06.17.
//  Copyright © 2017 Appsbude. All rights reserved.
//

import UIKit

class SelectExerciseController: UIViewController {
    
    var chosenBase: Int!

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
        
        if (button.tag > 0 && button.tag < 11) {
            self.chosenBase = button.tag
            self.performSegue(withIdentifier: "moveToExercise", sender: self)
        }
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "moveToExercise") {
            let svc = segue.destination as! ViewController
            svc.exercisesBase = Int32(self.chosenBase)
        }
    }
}
