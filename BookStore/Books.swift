//
//  Books.swift
//  BookStore
//
//  Created by German David Vertel Narvaez on 21/03/25.
//


import Foundation
import StoreKit


struct Book: Identifiable {
    let id : String
    let title: String
    let description: String
    var lock : Bool
    var price : String?
    var locale : Locale
    
    
    lazy var formater: NumberFormatter = {
        let nf = NumberFormatter()
        nf.numberStyle = .currency
        nf.locale = locale
        return nf
    }()
        
    
    
    init(Product: SKProduct, lock: Bool = true) {
        self.id = Product.productIdentifier
        self.title = Product.localizedTitle
        self.description = Product.localizedDescription
        self.lock = lock
        self.locale = Product.priceLocale
        
        
        
    }
}
    


