//
//  OrderManager.swift
//  exampleFirstApiData
//
//  Created by burak cakir on 4.11.2021.
//

import Foundation
import CloudKit

class OrderManager : ObservableObject
{
    

    @Published var orders : [OrderModel] = [OrderModel]()
    @Published  var order : OrderModel = OrderModel()
    
    func getAll() -> [OrderModel]{
//        https://northwind.vercel.app/api/orders
        guard let url = URL(string: "https://northwind.vercel.app/api/orders") else {return [OrderModel]()}
        
        URLSession.shared.dataTask(with: url){(data, response, error) in
            do{
                if let orders = data {
                    let decodeData  = try JSONDecoder().decode([OrderModel].self, from: orders)
                    self.orders=decodeData
                    
                }
            }
            catch{
                print("eror")
            }
            
        }.resume()
        
        
        return  self.orders;
        
        
    }
    
    
    func getOrderById(id:Int) -> OrderModel{
        
    
    guard let url = URL(string: "https://northwind.vercel.app/api/orders/" + String(id)) else {return OrderModel()}
    
    URLSession.shared.dataTask(with: url){(data, response, error) in
        do{
            if let order = data {
                let decodeData  = try JSONDecoder().decode(OrderModel.self, from: order)
                
                DispatchQueue.main.sync {
                    self.order = decodeData
                }
                
                
            }
        }
        catch{
            print("eror")
        }
        
    }.resume()
    
    
    return  self.order;
    
    }
    
    
    
}
