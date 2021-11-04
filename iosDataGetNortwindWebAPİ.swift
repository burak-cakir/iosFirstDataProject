//
//  iosDataGetNortwindWebAPİ.swift
//  exampleFirstApiData
//
//  Created by burak cakir on 2.11.2021.
//

import SwiftUI
import Foundation




struct iosDataGetNortwindWebAPI_: View {
  @ObservedObject var  fetch = FetchToDo()
  var body: some View {
      List(fetch.todos){todo in
          VStack{
              Text(todo.title)
          }
          
      }
  }
}

struct iosDataGetNortwindWebAPI__Previews: PreviewProvider {
  static var previews: some View {
      iosDataGetNortwindWebAPI_()
  }
}

class FetchToDo: ObservableObject{
  
  @Published var todos=[ToDo]()
  
  init(){
      
      let url=URL(string: "https://jsonplaceholder.typicode.com/todos")!
      
      URLSession.shared.dataTask(with: url) {(data, response, error)in
          
          do{
              if let todoData = data {
                  let decodedData = try JSONDecoder().decode([ToDo].self, from: todoData)
                  
                  DispatchQueue.main.async {
                      self.todos = decodedData
                  }
              }
              else{
                  print("no data!")
              }
              
          }
          
          catch{
              print("eror")
          }
          
      }.resume()
      
      
      
      
      
      
  }
  
  
}


struct ToDo : Codable, Identifiable{
  public var id: Int
  public var title: String
  public var completed: Bool
}





