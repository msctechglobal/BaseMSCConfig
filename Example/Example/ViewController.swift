//
//  ViewController.swift
//  Example
//
//  Created by Duc Canh on 24/10/2023.
//

import UIKit
import BaseMSCConfig

struct Country: Codable {
    let name: String
    let dialCode : String
    let code: String
}

class ViewController: UIViewController {

    let countries : [[String : Any]] = [
               [
                   "name" : "Afghanistan",
                   "dial_code": "+93",
                   "code": "AF"
               ],
               [
                   "name": "Aland Islands",
                   "dial_code": "+358",
                   "code": "AX"
               ],
               [
                   "name": "Albania",
                   "dial_code": "+355",
                   "code": "AL"
               ],
               [
                   "name": "Algeria",
                   "dial_code": "+213",
                   "code": "DZ"
               ]
   ]

    let parsing = ParsingArrayData<Country>()
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }

    func test() {
        parsing.convertArrayOfDictionary(from: countries)
    }
}

