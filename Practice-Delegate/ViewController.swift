//
//  ViewController.swift
//  Practice-Delegate
//
//  Created by 田岸将勝 on 2022/05/02.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet private weak var label: UILabel!

    private let textModel = TextModel()

    override func viewDidLoad() {
        super.viewDidLoad()
        setupLabel()
        textModel.delegate = self
    }


    @IBAction func pressedButton(_ sender: Any) {
        textModel.changeText()
    }

    private func setupLabel() {
        label.text = textModel.text
    }

    private func updateLabel() {
        label.text = textModel.text
    }

}

extension ViewController: TextModelDelegate {
    func didChangeText() {
        updateLabel()
    }
}

protocol TextModelDelegate: AnyObject {
    func didChangeText()
}

class TextModel {
    weak var delegate: TextModelDelegate?

    private(set) var text = "ボタンを押してください"

    func changeText() {
        text = "ありがとう"
        notify()
    }

    private func notify() {
        delegate?.didChangeText()
    }
}


