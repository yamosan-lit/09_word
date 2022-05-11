//
//  AddViewController.swift
//  word
//
//  Created by 八森聖人 on 2022/05/12.
//

import UIKit

class AddViewController: UIViewController {
    var wordArray: [Dictionary<String, String>] = []
    let saveData = UserDefaults.standard
    
    @IBOutlet weak var englishTextField: UITextField!
    @IBOutlet weak var japaneseTextField: UITextField!
    
    @IBAction func saveWord(_ sender: UIBarButtonItem) {
        if englishTextField.text == "" || japaneseTextField.text == "" {
            let alert = UIAlertController(
                title: "新規追加",
                message: "値を入力して下さい",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(
                title: "OK",
                style: .default,
                handler: nil
            ))
            present(alert, animated: true, completion: nil)
            return
        }
        let wordDirectory = ["english": englishTextField.text!, "japanese": japaneseTextField.text!]
        
        wordArray.append(wordDirectory)
        saveData.set(wordArray, forKey: "WORD")
        
        let alert = UIAlertController(
            title: "保存完了",
            message: "単語の登録が完了しました",
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "OK",
            style: .default,
            handler: nil
        ))
        present(alert, animated: true, completion: nil)
        englishTextField.text = ""
        japaneseTextField.text = ""
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()

        if saveData.array(forKey: "WORD") != nil {
            wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        }
    }
}
