//
//  SelectExerciseController.swift
//  my little 101
//
//  Created by Carsten Sandtner_ on 12.06.17.
//  Copyright © 2017 Appsbude. All rights reserved.
//

import UIKit

class SelectExerciseController: UIViewController, UIPickerViewDataSource, UIPickerViewDelegate {
    
    var chosenBase: Int = 1
    var pickerDataSource = ["1", "2", "3", "4", "5", "6", "7", "8", "9", "10"]
    
    @IBOutlet weak var pickerView: UIPickerView!
    @IBOutlet weak var startButton: UIButton!
    @IBOutlet weak var exerciseDuration: UILabel!
    @IBOutlet weak var durationSlider: UISlider!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.pickerView.dataSource = self
        self.pickerView.delegate = self
        self.durationSlider.value = 30
        self.exerciseDuration.text = "\(self.durationSlider.value)s"
        // Do any additional setup after loading the view.
    }
    
    override func didReceiveMemoryWarning() {
        super.didReceiveMemoryWarning()
        // Dispose of any resources that can be recreated.
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any!) {
        if (segue.identifier == "moveToExercise") {
            let svc = segue.destination as! ViewController
            svc.exercisesBase = Int32(self.chosenBase)
            svc.availableTime = Int(self.durationSlider.value)
        }
    }
    
    @IBAction func startExercise(_ sender: Any) {
        self.performSegue(withIdentifier: "moveToExercise", sender: self)
    }
    
    @IBAction func durationValueChanged(_ sender: UISlider) {
        let currentValue = Int(sender.value)
        self.exerciseDuration.text = "\(currentValue)s"
    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return self.pickerDataSource.count
    }
    
    func pickerView(_ pickerView: UIPickerView, titleForRow row: Int, forComponent component: Int) -> String? {
        return self.pickerDataSource[row]
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        self.chosenBase = row + 1
    }
}
