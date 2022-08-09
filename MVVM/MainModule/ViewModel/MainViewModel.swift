//
//  MainViewModel.swift
//  MVVM
//
//  Created by Илья on 09.08.2022.
//

import Foundation


protocol MainViewModelProtocol {
    var updateViewData: ((ViewData) -> ())? { get set }
    func startFetch()
}

final class MainViewModel: MainViewModelProtocol {
    public var updateViewData: ((ViewData) -> ())?
    
    init() {
        updateViewData?(.initial)
    }
     
    public func startFetch() {
        updateViewData?(.loading(ViewData.Data(icon: nil,
                                               title: nil,
                                               description: nil,
                                               numberPhone: nil)))
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 3) { [weak self] in
            self?.updateViewData?(.success(ViewData.Data(icon: "success", title: "Hello", description: "World", numberPhone: "12345678")))
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 6) { [weak self] in
            self?.updateViewData?(.failure(ViewData.Data(icon: "fail", title: "Error", description: "Data is empty", numberPhone: nil)))
        }
    }
    
    
}
