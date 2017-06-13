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
    
    @IBOutlet weak var correctResults: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        correctResults.text = "\(results.solvedExercises)"
        // Do any additional setup after loading the view.
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    @IBAction func closeResultsView(_ sender: Any) {
        self.dismiss(animated: true, completion: nil)
        if let parentVC = self.presentingViewController as? ViewController {
            parentVC.exerciseIsDone()
        }
    }

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destinationViewController.
        // Pass the selected object to the new view controller.
    }
    */

}