//
//  mainViewModel.swift
//  app
//
//  Created by wael hameed on 2/10/22.
//

import Foundation

class mainViewModel :viewModel {
    
    // MARK:- bind data
    var dataBinder:((status) -> ()) = {_ in }
        
    // MARK:- initilizations
    override init() {
        super.init()
        
    }
    
}
