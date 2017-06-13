//
//  ResultViewController.swift
//  my little 101
//
//  Created by Carsten Sandtner on 12.06.17.
//  Copyright © 2017 Appsbude. All rights reserved.
//

import UIKit

class ResultViewController: UIViewController {

    var results: ExerciseResult!
    
    @IBOutlet weak var closeView: UIButton!
    
    @IBOutlet weak var resultSmiley: UILabel!
    @IBOutlet weak var correctResults: UILabel!
    @IBOutlet weak var totalResults: UILabel!
    @IBOutlet weak var wrongResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctResults.text = "\(results.solvedExercises)"
        totalResults.text = "\(results.totalExercises)"
        wrongResults.text = "\(results.wrongExercises)"
        
        let quote = (Double(results.solvedExercises) / Double(results.totalExercises))

        if (quote > 0.65) {
            resultSmiley.text = "☺"
        }
        else {
            resultSmiley.text = "☹"
        }
        
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeResultsView(_ sender: Any) {
        self.performSegue(withIdentifier: "chooseExercise", sender: self)
    }

}
