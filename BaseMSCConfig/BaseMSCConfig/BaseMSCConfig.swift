//
//  BaseMSCConfig.swift
//  BaseMSCConfig
//
//  Created by Duc Canh on 24/10/2023.
//

import Foundation

protocol ConfigFeature: AnyObject {
    func fetchMSCModel()
}

public final class BaseMSCConfig: ConfigFeature {
    func fetchMSCModel() {
        print("zzzzzz fetch successfully")
    }
}
