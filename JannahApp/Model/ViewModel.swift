//
//  ViewModel.swift
//  JannahApp
//
//  Created by amal badr on 01/02/2024.
//

import Foundation
import Firebase

class ViewModel: ObservableObject {
    private let db = Firestore.firestore()
    @Published var ticket = Ticket(date: "", name: "", total: "")
    @Published var Places = [Place]()
    @Published var event = [Event]()
    func getPlacesData(category:String){
        db.collection(category).getDocuments { snapshot, error in
            if error == nil {
                // No errors
          
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.Places = snapshot.documents.map { d in
                          
                      
                            // Create a Todo item for each document returned
                            return Place(id: d.documentID, logo: d["logo"] as? String ?? "" , name: d["name"] as? String ?? "", website: d["website"] as? String ?? "", locationURL: d["locationURL"] as? String ?? "", description:  d["description"] as? String ?? "", workTime: d["workTime"] as? String ?? "", address: d["address"] as? String ?? "")
                        
                        }
                    }
                    
                    
                }
            }
            else {
        
            }
        }
    }

    func getEventData(category:String,categoryID:String){
        db.collection(category).document(categoryID).collection("Events").getDocuments { snapshot, error in
            if error == nil {
                // No errors
          
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.event = snapshot.documents.map { d in
                          
                            return  Event(id: d.documentID, logo: d["logo"] as? String ?? "", name: d["name"] as? String ?? "", locationURL: d["locationURL"] as? String ?? "", description: d["description"] as? String ?? "", ticketPrice: d["ticketPrice"] as? Int ?? 0, ticketDetails: d["ticketDetails"] as? String ?? "", eventTime: d["eventTime"] as? String ?? "", address: d["address"] as? String ?? "",latitude:d["latitude"] as? Double ?? 0.0, longitude: d["longitude"] as? Double ?? 0,timeList: d["timeList"] as? [String] ?? [""],ticketCount: d["ticketCount"] as? Int ?? 0,startEvent: d["startEvent"] as? [Int] ?? [0],endEvent: d["endEvent"] as? [Int] ?? [0])
                        
                        }
                    }
                    
                    
                }
            }
            else {
        
            }
        }
    }


    func getSubcollections() {
     
        
        db.collectionGroup("Events")
            .getDocuments { (querySnapshot, error) in
                if let error = error {
                    print("Error getting subcollections: \(error)")
                } else {
                    guard let documents = querySnapshot?.documents else {
                        print("No subcollections found")
                        return
                    }
                    for document in documents {
                        // Access subcollection data
                        let data = document.data()
                        print(data)
                    }
                }
            }
    }
    func getSubcollectionsData(){
        db.collectionGroup("Events").getDocuments { snapshot, error in
            if error == nil {
                // No errors
          
                if let snapshot = snapshot {
                    
                    // Update the list property in the main thread
                    DispatchQueue.main.async {
                        
                        // Get all the documents and create Todos
                        self.event = snapshot.documents.map { d in
                          
                            return Event(id: d.documentID, logo: d["logo"] as? String ?? "", name: d["name"] as? String ?? "", locationURL: d["locationURL"] as? String ?? "", description: d["description"] as? String ?? "", ticketPrice: d["ticketPrice"] as? Int ?? 0, ticketDetails: d["ticketDetails"] as? String ?? "", eventTime: d["eventTime"] as? String ?? "", address: d["address"] as? String ?? "",latitude:d["latitude"] as? Double ?? 0.0, longitude: d["longitude"] as? Double ?? 0,timeList: d["timeList"] as? [String] ?? [""],ticketCount: d["ticketCount"] as? Int ?? 0,startEvent: d["startEvent"] as? [Int] ?? [0],endEvent: d["endEvent"] as? [Int] ?? [0])
                        
                        }
                    }
                    
                    
                }
            }
            else {
        
            }
        }
    }
    func updateData(update: Ticket) {
        
        // Get a reference to the database
        let db = Firestore.firestore()
        
        // Set the data to update
        db.collection("User").document(Auth.auth().currentUser?.uid ?? "").collection("Ticket").document().setData([
            "name":update.name,
            "total":update.total,
            "date":update.date], merge: true) { error in
            
            // Check for errors
            if error == nil {
                // Get the new data
         
            }
        }
    }
//    func getData(){
//        let querySnapshot = try await db.collection("Salon").getDocuments()
//
//    }
//    func Data(){
//        let getSearch = db.collection("Salon")
//
//           getSearch.getDocuments { (snap, err) in
//             if err != nil{
//               print((err?.localizedDescription)!)
//               return
//             }
//             for document in snap!.documents{
//                 
//              
//                 let id = document.documentID
//                
//                
//                  
//                 document.collection("Events").getDocuments { snapshot, error in
//                     if error == nil {
//                         // No errors
//                   
//                         if let snapshot = snapshot {
//                             
//                             // Update the list property in the main thread
//                             DispatchQueue.main.async {
//                                 
//                                 // Get all the documents and create Todos
//                                 self.event = snapshot.documents.map { d in
//                                   
//         //                            Event(id: d.documentID, logo: d["logo"] as? String ?? "", name: d["name"] as? String ?? "", locationURL: d["locationURL"] as? String ?? "", description: d["description"] as? String ?? "", ticketPrice: d["ticketPrice"] as? Int ?? 0, address: d["address"] as? String ?? "")
//                                     // Create a Todo item for each document returned
//                                     return Event(id: d.documentID, logo: d["logo"] as? String ?? "", name: d["name"] as? String ?? "", locationURL: d["locationURL"] as? String ?? "", description: d["description"] as? String ?? "", ticketPrice: d["ticketPrice"] as? Int ?? 0, ticketDetails: d["ticketDetails"] as? String ?? "", eventTime: d["eventTime"] as? String ?? "", address: d["address"] as? String ?? "")
//                                 
//                                 }
//                             }
//                             
//                             
//                         }
//                     }
//                     else {
//                 
//                     }
//                 }
//                
//
//           
//
//             }
//           }
//    }
    
    
}
