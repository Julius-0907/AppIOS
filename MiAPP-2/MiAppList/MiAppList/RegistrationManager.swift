//
//  RegistrationManager.swift
//  MiAppList
//
//  Created by RP on 5/1/24.
//

import Foundation

class RegistrationManager: ObservableObject {
    @Published var isRegistered: Bool = false
    @Published var registrationError: String?

    func registerUser(email: String, password: String, confirmPassword: String) {
        guard !email.isEmpty, !password.isEmpty, !confirmPassword.isEmpty else {
            registrationError = "Por favor, complete todos los campos."
            return
        }

        guard password == confirmPassword else {
            registrationError = "Las contraseñas no coinciden."
            return
        }

        // Aquí puedes implementar la lógica de registro real, como guardar los datos en una base de datos.
        // Por ahora, simplemente establecemos que el usuario está registrado.
        isRegistered = true
    }
}

class LoginManager: ObservableObject {
    @Published var loginError: String?

    func loginUser(email: String, password: String) {
        guard !email.isEmpty, !password.isEmpty else {
            loginError = "Por favor, complete todos los campos."
            return
        }

        // Aquí puedes implementar la lógica de inicio de sesión real, como verificar las credenciales en una base de datos.
        // Por ahora, simplemente imprimimos un mensaje.
        print("Iniciando sesión para el usuario con correo electrónico \(email) y contraseña \(password).")
    }
}
