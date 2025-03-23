//
//  Store.swift
//  BookStore
//
//  Created by German David Vertel Narvaez on 22/03/25.
//


import Foundation
import StoreKit


typealias FetchCompleteHandler = ([SKProduct]) -> Void
typealias PurchaseCompleteHandler = ((SKPaymentTransaction) -> Void)


class Store: NSObject, ObservableObject {
    
    @Published var allBooks: [Book] = []
    
    private let allIdentifiers = Set([
        "xinu.BookStore.CodigoDavinchi",
        "xinu.BookStore.harryPotter",
        "xinu.BookStore.fullAccess"
    ])
    
    private var completePurchases = [String](){
        didSet{
            DispatchQueue.main.async { [weak self] in
                guard let self = self else { return }
                for index in self.allBooks.indices {
                    self.allBooks[index].lock = !self.completePurchases.contains(self.allBooks[index].id)
                
                }
                    
                    
            }
        }
            
    }
    
    
    private var fetchCompleteHandler: FetchCompleteHandler?
    private var fetchRequest: SKProductsRequest?
    private var productoRequest: SKProductsRequest?
    private var purchaseCompleteHandler: PurchaseCompleteHandler?
}
