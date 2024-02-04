//
//  ViewController.swift
//  PropertyWrapperDemo
//
//  Created by 怦然心动-LM on 2023/10/9.
//

import UIKit

class ViewController: UIViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
        var wrapperStruct = WrapperDecodableStruct()
        wrapperStruct.title = "Title"
        print("wrapperStruct.title: \(wrapperStruct.title)")
    }
}

