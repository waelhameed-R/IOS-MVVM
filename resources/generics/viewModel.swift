//
//  viewModel.swift
//  app
//
//  Created by wael hameed on 2/9/22.
//

import Foundation
import UIKit

enum status {
    case onSuccess(_ type:onSuccessType)
    case onFailar(_ type:onFailarType)
    case indicator(_ type:indicatorType,_ action:indicatorActionType)
}

enum indicatorActionType {
    case start
    case stop
}

public enum indicatorType {
    case refresher
    case normal
    case pagination
    case shimmer
}

enum onSuccessType {
    case setData
    case setEmptyData
}

enum onFailarType {
    case errorConnect
    case serverError
}

enum call_typs {
    case normal // first call
    case reloadErrorConnection // for reload after error connection
    case pagination // for pagination
}

class viewModel:NSObject {
    
}


// MARK:- base variables
extension viewModel { }
