//
//  ViewController.swift
//  LogsDemo
//
//  Created by Abdallah on 28/05/2023.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        Logger.logError("Custom error message")
    }


}

