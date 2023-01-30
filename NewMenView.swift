//
//  NewMenView.swift
//  firebaseloginwindow
//
//  Created by mayank kumar mongia on 30/01/23.
//

import SwiftUI

struct NewMenView: View {
    @EnvironmentObject var dataManager : DataManager
   @State private var newMen = ""
    
    var body: some View {
        VStack{
            TextField("Men", text: $newMen)
            Button{
                //add profile
                dataManager.addMen(menName: newMen)
            }label: {
                Text("Save")
            }
        }
        .padding()
    }
}

struct NewMenView_Previews: PreviewProvider {
    static var previews: some View {
        NewMenView()
    }
}
