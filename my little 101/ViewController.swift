//
//  ViewController.swift
//  my little 101
//
//  Created by Carsten Sandtner on 07.06.17.
//  Copyright © 2017 Appsbude. All rights reserved.
//

import UIKit
import GameKit

class ViewController: UIViewController {
    
    var challenge: Exercise!
    var results: [Int32]!
    
    @IBOutlet weak var challengeText: UILabel!
    
    @IBOutlet weak var resultCandidate1: UIButton!
    
    @IBOutlet weak var resultCandidate2: UIButton!
    
    @IBOutlet weak var resultCandidate3: UIButton!
    
    @IBOutlet weak var resultCandidate4: UIButton!
    
    @IBAction func resultCandidateOneSelected(_ sender: Any) {
        if (self.challenge.checkSolution(candidate: Int32(self.resultCandidate1.currentTitle!)!)) {
            resultCandidate1.backgroundColor = UIColor.green
        }
        else {
            resultCandidate1.backgroundColor = UIColor.red
        }
    }

    @IBAction func resultCandidateTwoSelected(_ sender: Any) {
        if (self.challenge.checkSolution(candidate: Int32(self.resultCandidate2.currentTitle!)!)) {
            resultCandidate2.backgroundColor = UIColor.green
        }
        else {
            resultCandidate2.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func resultCandidateThreeSelected(_ sender: Any) {
        if (self.challenge.checkSolution(candidate: Int32(self.resultCandidate3.currentTitle!)!)) {
            resultCandidate3.backgroundColor = UIColor.green
        }
        else {
            resultCandidate3.backgroundColor = UIColor.red
        }
    }
    
    @IBAction func resultCandidateFourSelected(_ sender: Any) {
        if (self.challenge.checkSolution(candidate: Int32(self.resultCandidate4.currentTitle!)!)) {
            resultCandidate4.backgroundColor = UIColor.green
        }
        else {
            resultCandidate4.backgroundColor = UIColor.red
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.challenge = Exercise(base: 5)
        challengeText.text = self.challenge.getNewChallenge()
        let solutions = self.challenge.getSolutionCandidates()
        let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: solutions)
        
        resultCandidate1.setTitle("\(shuffled[0])", for: .normal)
        resultCandidate2.setTitle("\(shuffled[1])", for: .normal)
        resultCandidate3.setTitle("\(shuffled[2])", for: .normal)
        resultCandidate4.setTitle("\(shuffled[3])", for: .normal)
        
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }

}

