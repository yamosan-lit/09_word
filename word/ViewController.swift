//
//  ViewController.swift
//  word
//
//  Created by 八森聖人 on 2022/05/12.
//

import UIKit

class ViewController: UIViewController {

    @IBAction func startButtonTapped() {
        let saveData = UserDefaults.standard
        if saveData.array(forKey: "WORD") != nil {
            if let count = saveData.array(forKey: "WORD")?.count {
                if count > 0 {
                    performSegue(withIdentifier: "toQuestionView", sender: nil)
                }
            }
        } else {
            let alert = UIAlertController(
                title: "単語",
                message: "まずは「単語一覧」をタップして単語を登録して下さい",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            
            self.present(alert, animated: true, completion: nil)
        }
    }

    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
}

