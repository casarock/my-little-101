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
    var resultButtons: [UIButton]!
    var actualScore: Int = 0
    var timer = Timer()
    var availableTime: Int = 10
    var timeIsRunning: Bool = true
    var results: ExerciseResult!
    var exercisesBase: Int32 = 5
    
    let timeoutForNewChallenge: Double = 1.0
    
    @IBOutlet weak var challengeText: UILabel!
    @IBOutlet weak var score: UILabel!
    @IBOutlet weak var timerValue: UILabel!
    @IBOutlet weak var resultCandidate1: UIButton!
    @IBOutlet weak var resultCandidate2: UIButton!
    @IBOutlet weak var resultCandidate3: UIButton!
    @IBOutlet weak var resultCandidate4: UIButton!
    
    @IBAction func resultCandidateOneSelected(_ sender: Any) {
        checkResult(selectedButton: self.resultCandidate1)
    }

    @IBAction func resultCandidateTwoSelected(_ sender: Any) {
        checkResult(selectedButton: self.resultCandidate2)
    }
    
    @IBAction func resultCandidateThreeSelected(_ sender: Any) {
        checkResult(selectedButton: self.resultCandidate3)
    }
    
    @IBAction func resultCandidateFourSelected(_ sender: Any) {
        checkResult(selectedButton: self.resultCandidate4)
    }
    
    private func checkResult(selectedButton: UIButton) {
        if (self.timeIsRunning) {
            if (self.challenge.checkSolution(candidate: Int32(selectedButton.currentTitle!)!)) {
                selectedButton.backgroundColor = UIColor.green
                self.actualScore += 10
                self.results.solvedExercises += 1
            }
            else {
                selectedButton.backgroundColor = UIColor.red
                self.results.wrongExercises += 1
            }
            
            // Defer creation of new Exercise
            DispatchQueue.main.asyncAfter(deadline: .now() + timeoutForNewChallenge) {
                self.updateScore()
                self.resetButtons()
                self.setExercise(base: self.exercisesBase)
            }
        }
    }
    
    private func updateScore() {
            self.score.text = "\(self.actualScore)"
    }
    
    private func resetButtons() {
        for resultButton in resultButtons {
            resultButton.backgroundColor = UIColor.white
        }
    }
    
    private func setExercise(base: Int32) {
        self.challenge = Exercise(base: self.exercisesBase)
        challengeText.text = self.challenge.getNewChallenge()
        let solutions = self.challenge.getSolutionCandidates()
        let shuffled = GKRandomSource.sharedRandom().arrayByShufflingObjects(in: solutions)
        
        for (index, resultButton) in resultButtons.enumerated() {
            resultButton.setTitle("\(shuffled[index])", for: .normal)
        }
        
        self.results.totalExercises += 1
    }
    
    func updateTimer() {
        self.availableTime -= 1
        timerValue.text = String(self.availableTime)
        
        if (self.availableTime == 0) {
            // Stop Timer
            self.timer.invalidate()
            self.timeIsRunning = false
            self.performSegue(withIdentifier: "showResults", sender: self)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.resultButtons = [self.resultCandidate1,
                              self.resultCandidate2,
                              self.resultCandidate3,
                              self.resultCandidate4]
    
        self.results = ExerciseResult(solvedExercises: 0, totalExercises: 0, wrongExercises: 0)
        self.setExercise(base: self.exercisesBase)
        
        self.timer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(ViewController.updateTimer), userInfo: nil, repeats: true)
    }

    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "showResults") {
            let svc = segue.destination as! ResultViewController;
            svc.results = self.results
        }
    }
    
    func exerciseIsDone() -> Void {
        print("ja")
        self.performSegue(withIdentifier: "chooseExercise", sender: self)
    }

}

