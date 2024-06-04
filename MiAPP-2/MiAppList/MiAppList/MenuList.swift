//
//  MenuList.swift
//  MiAppList
//
//  Created by RP on 4/18/24.
//

import Foundation
import SwiftUI

struct MenuList: View {
  
  var body: some View {
    VStack {
      Text("Settings")
        .font(.title)
        .foregroundColor(.white)
      
      Divider()
        .frame(width: 200, height: 2)
        .background(Color.white)
        .padding(.horizontal, 16)
      
      // Opciones del menú
      Link(destination: URL(string: "https://apple.com")!) {
        Text("Apple")
      }
      .font(.title)
      .foregroundColor(.white)
      
      Link(destination: URL(string: "https://www.universidad.edu/carreras")!) {
        Text("Lista de Carreras")
      }
      .font(.title)
      .foregroundColor(.white)
      
      Link(destination: URL(string: "https://www.universidad.edu/informacion")!) {
        Text(" Mas Información")
      }
      .font(.title)
      .foregroundColor(.white)
      
      Text("Redes Sociales")
        .font(.title)
        .foregroundColor(.white)
      
      // Lista de redes sociales
      VStack(alignment: .leading) {
        Link(destination: URL(string: "https://facebook.com/universidad")!) {
          Text("Facebook")
        }
        
        Link(destination: URL(string: "https://twitter.com/universidad")!) {
          Text("Twitter")
        }
        
        Link(destination: URL(string: "https://instagram.com/universidad")!) {
          Text("Instagram")
        }
      }
      .font(.title)
      .foregroundColor(.white)
      
      Link(destination: URL(string: "https://www.universidad.edu/contacto")!) {
        Text("Contáctanos")
      }
      .font(.title)
      .foregroundColor(.white)

      Spacer()
    }
    .padding(32)
    .background(Color.black)
    .edgesIgnoringSafeArea(.bottom)
  }
}

struct MenuList_Previews: PreviewProvider {
  static var previews: some View {
    MenuList()
  }
}
