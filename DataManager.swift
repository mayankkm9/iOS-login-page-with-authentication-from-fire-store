//
//  DataManager.swift
//  firebaseloginwindow
//
//  Created by mayank kumar mongia on 29/01/23.
//

import SwiftUI
import Firebase
  
class DataManager : ObservableObject {
    @Published var Men :[men] = []
   
    init(){
        fetchmen()
    }
    
    func fetchmen(){
       // Men.removeAll()
        let db = Firestore.firestore()
        let ref = db.collection("Men")
        ref.getDocuments { snapshot , error in
            guard error == nil else{
                print(error!.localizedDescription)
                return
            }
            if let snapshot = snapshot {
                for document in snapshot.documents{
                    let data = document.data()
                    
                    let id = data["id"] as? String ?? ""
                    let name = data["name"] as? String ?? ""
                    
                    let men = men(id : id, name : name)
                    self.Men.append(men)
                }
            }
        }
    }
    func  addMen(menName : String){
        let db = Firestore.firestore()
        let ref = db.collection("Men").document(menName)
        ref.setData(["name " : menName , "id" : 10]){ error in
            if let error = error{
                print(error.localizedDescription)
            }
                
            
        }
    }
}
