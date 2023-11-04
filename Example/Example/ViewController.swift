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

struct CommonModel: Codable {
    var menu: Menu
}

struct Menu: Codable {
    var id: String
    var valueType: String

    enum CodingKeys: String, CodingKey {
        case id
        case valueType = "value_type"
    }
}


class ViewController: UIViewController {

    let countries : [[String : Any]] = [
               [
                   "name" : "Afghanistan",
                   "dialCode": "+93",
                   "code": "AF"
               ],
               [
                   "name": "Aland Islands",
                   "dialCode": "+358",
                   "code": "AX"
               ],
               [
                   "name": "Albania",
                   "dialCode": "+355",
                   "code": "AL"
               ],
               [
                   "name": "Algeria",
                   "dialCode": "+213",
                   "code": "DZ"
               ]
   ]

    let data = """
   {"menu": {
     "id": "file",
     "value_type": "File",
       "popup": {
         "menuitem": [
           {"value": "New", "onclick": "CreateNewDoc()"},
           {"value": "Open", "onclick": "OpenDoc()"},
           {"value": "Close", "onclick": "CloseDoc()"}
         ]
       }
   }}
   """

    let parsingArray = ParsingArrayData<Country>()
    let parsingSingle = ParsingSingleData<CommonModel>()
    override func viewDidLoad() {
        super.viewDidLoad()
        test()
    }

    func test() {
        _ = parsingSingle.convertJson(from: data)
        _ = parsingArray.convertArrayOfDictionary(from: countries)
    }
}

