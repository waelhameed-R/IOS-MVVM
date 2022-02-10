//
//  mainView.swift
//  app
//
//  Created by wael hameed on 2/10/22.
//
import UIKit

class mainView: controller,controllerFunctions {
    
    private var viewModel:mainViewModel!

    override func viewDidLoad() {
        super.viewDidLoad()
        
        /// initilize view model
        self.viewModel = mainViewModel()
        
        /// setUP UI
        setUPUI()
        
        /// updateView
        updateView()
    }
    
    func setUPUI() {
        
    }
    
    func updateView() {
        self.viewModel.dataBinder = { [self] status in
            switch status {
            case .onSuccess(_):
                viewBinder()
            case .onFailar(_):
                /// popup Error or
                print("onFailar")
            case .indicator(_, _):
                print("indicator")
            }
        }
    }
    
    func viewBinder() {
        
    }
    
}


