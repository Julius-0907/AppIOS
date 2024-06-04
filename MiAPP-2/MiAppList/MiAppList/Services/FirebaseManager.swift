//
//  FirebaseManager.swift
//  MiAppList
//
//  Created by Diego Siciliano on 5/20/24.
//

import Foundation
import FirebaseAuth


class FirebaseManager{
    
    func registrarUsuario(correo: String, contraseña:String, completado: @escaping (Error?)-> Void){
        Auth.auth().createUser(withEmail: correo, password: contraseña){
            (resultado, error) in completado(error)
        }
    }
    
    func LoginUsuario(correo: String, contraseña:String, completado: @escaping (Error?)-> Void){
        Auth.auth().signIn(withEmail: correo, password: contraseña){
            (resultado, error) in completado(error)
        }
    }
    
    
}
