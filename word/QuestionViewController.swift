//
//  QestionViewController.swift
//  word
//
//  Created by 八森聖人 on 2022/05/12.
//

import UIKit

class QuestionViewController: UIViewController {
    var isAnswered: Bool = false // 回答したか・次の質問に行くかの判定
    var wordArray: [Dictionary<String, String>] = [] // UserDefaultsからとる配列
    var nowNumber: Int = 0 // 現在の回答数
    let saveData = UserDefaults.standard
    
    @IBOutlet weak var questionLabel: UILabel!
    @IBOutlet weak var answerLabel: UILabel!
    @IBOutlet weak var nextButton: UIButton!
    @IBAction func nextButtonTapped(_ sender: UIButton) {
        if isAnswered {
            nowNumber += 1
            answerLabel.text = ""
            
            // 次の問題を表示するか
            if nowNumber < wordArray.count {
                // 次の問題を表示
                questionLabel.text = wordArray[nowNumber]["english"]
                isAnswered = false
                nextButton.setTitle("答えを表示", for: .normal)
            } else {
                nowNumber = 0
                performSegue(withIdentifier: "toFinishView", sender: nil)
            }
        } else {
            // 答えを表示する
            answerLabel.text = wordArray[nowNumber]["japanese"]
            isAnswered = true
            nextButton.setTitle("次へ", for: .normal)
        }
    }


    override func viewDidLoad() {
        super.viewDidLoad()
        answerLabel.text = ""
        self.view.bringSubviewToFront(questionLabel)
        self.view.bringSubviewToFront(answerLabel)
    }
    
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        wordArray = saveData.array(forKey: "WORD") as! [Dictionary<String, String>]
        // 問題をシャッフルする
        wordArray.shuffle()
        if let q = wordArray[nowNumber]["english"] {
            questionLabel.text = q
        }
    }
    
}
