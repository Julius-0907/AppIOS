//
//  CarreraViewModel.swift
//  MiAppList
//
//  Created by Diego Siciliano on 5/23/24.
//

import Foundation
import FirebaseFirestore
import FirebaseFirestoreSwift

class CarreraViewModel: ObservableObject{
    @Published var carreras = [Carrera]()
    
    var db = Firestore.firestore()
    
    func fetchCarreras(){
        db.collection("carreras").addSnapshotListener{
            (querysnapshot, error) in
            guard let documents = querysnapshot?.documents else{
                print("No documents")
                return
            }
            
            self.carreras = documents.map{
                queryDocumentSnapshot -> Carrera in
                let data = queryDocumentSnapshot.data()
                let carrera = try! Firestore.Decoder().decode(Carrera.self, from: data)
                return carrera
            }
        }
    }
}
