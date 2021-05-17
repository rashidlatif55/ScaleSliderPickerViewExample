//
//  ViewController.swift
//  PickerViewExample
//
//  Created by Rashid Latif on 04/07/2020.
//  Copyright © 2020 Rashid. All rights reserved.
//

import UIKit

class ViewController: UIViewController, UIPickerViewDelegate, UIPickerViewDataSource {
    
    @IBOutlet weak var picker: UIPickerView!
    
    let height:CGFloat = 20
    override func viewDidLoad() {
        super.viewDidLoad()
        self.picker.delegate = self
        self.picker.dataSource = self
        
        picker.transform = CGAffineTransform(rotationAngle: (-90 * (.pi / 180)))

    }
    
    func numberOfComponents(in pickerView: UIPickerView) -> Int {
        return 1
    }
    func pickerView(_ pickerView: UIPickerView, numberOfRowsInComponent component: Int) -> Int {
        return 50
    }
    
    
    func pickerView(_ pickerView: UIPickerView, rowHeightForComponent component: Int) -> CGFloat {
        return height
    }
    
    func pickerView(_ pickerView: UIPickerView, viewForRow row: Int, forComponent component: Int, reusing view: UIView?) -> UIView {
         
        if #available(iOS 14, *) {
            picker.subviews[1].isHidden = true
        } else {
            picker.subviews[1].isHidden = true
            picker.subviews[2].isHidden = true
        }
        
        
        let customView = UIView(frame: CGRect(x: 0, y: -5, width: 70, height: height))
        var scaleLabelWidth = 20
        if row % 2 == 0 {
            scaleLabelWidth = 40
        }
        let scaleLabel = UIView(frame: CGRect(x: 0, y: 8, width: scaleLabelWidth, height: 4))
        scaleLabel.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        customView.addSubview(scaleLabel)
        
        let backView = UIView(frame: CGRect(x: 0, y: 0, width: 5, height: height))
        customView.addSubview(backView)
        backView.backgroundColor = #colorLiteral(red: 1, green: 0.1491314173, blue: 0, alpha: 1)
        return customView
    }
    
    func pickerView(_ pickerView: UIPickerView, didSelectRow row: Int, inComponent component: Int) {
        print(row)
    }
    
    
}


