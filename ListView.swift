//
//  ListView.swift
//  firebaseloginwindow
//
//  Created by mayank kumar mongia on 29/01/23.
//

import SwiftUI

struct ListView: View {
    @EnvironmentObject var dataManager : DataManager
   @State private var showPopUp = false
    
    
    var body: some View {
        NavigationView{
             List(dataManager.Men, id: \.id){men in
                Text(men.name)
            }
            .navigationTitle("Men")
            .navigationBarItems( trailing: Button(action: {
                showPopUp.toggle()
            }, label: {
                Image(systemName: "plus")
            }))
            .sheet(isPresented: $showPopUp ){
                NewMenView()
                    
            }
        }
      
    }
}

struct ListView_Previews: PreviewProvider {
    static var previews: some View {
        ListView()
            .environmentObject(DataManager())
    }
}
