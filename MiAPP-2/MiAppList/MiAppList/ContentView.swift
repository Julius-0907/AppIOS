//
//  ContentView.swift
//  MiAppList
//
//  Created by RP on 4/04/24.
//

import SwiftUI


struct ContentView: View {
    var body: some View {
        
        Home()
           
            .preferredColorScheme(.dark)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        Group {
            ContentView()
            ContentView()
        }
    }
}

struct Home : View {
    
    @State var index = 0
    
    var body: some View{
        
        GeometryReader{_ in
            
            VStack{
                
                Image("UTEC4")
                .resizable()
                .frame(width: 60, height: 60)
                
                ZStack{
                    
                    SignUP(index: self.$index)
                        // changing view order...
                        .zIndex(Double(self.index))
                    
                    Login(index: self.$index)

                }
                
                HStack(spacing: 15){
                    
                    Rectangle()
                    .fill(Color("Color-3"))
                    .frame(height: 1)
                    
                    Text("OR")
                    
                    Rectangle()
                    .fill(Color("Color-3"))
                    .frame(height: 1)
                }
                .padding(.horizontal, 30)
                .padding(.top, 50)
            
                
                HStack(spacing: 25){
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    }
                    
                    Button(action: {
                        
                    }) {
                        
                        Image("")
                        .resizable()
                        .renderingMode(.original)
                        .frame(width: 50, height: 50)
                        .clipShape(Circle())
                    }
                }
                .padding(.top, 30)
            }
            .padding(.vertical)
        }
        .background(Color("Color-1").edgesIgnoringSafeArea(.all))
    }
}

// curvatura

struct CShape : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            
            
            path.move(to: CGPoint(x: rect.width, y: 100))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: 0, y: 0))
            
        }
    }
}


struct CShape1 : Shape {
    
    func path(in rect: CGRect) -> Path {
        
        return Path{path in

            
            
            path.move(to: CGPoint(x: 0, y: 100))
            path.addLine(to: CGPoint(x: 0, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: rect.height))
            path.addLine(to: CGPoint(x: rect.width, y: 0))
            
        }
    }
}

struct Login : View {
    
    @State var email = ""
    @State var pass = ""
    @State var mostrarInicio: Bool = false
    @State var showAlert: Bool = false
    @State var showAlertE: Bool = false
    @State var errorR: String = ""
    @Environment(\.presentationMode) var presentationMode
    @Binding var index : Int
    
    let firebaseManager = FirebaseManager()
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack{
                    
                    VStack(spacing: 10){
                        
                        Text("Login")
                            .foregroundColor(self.index == 0 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 0 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                    
                    Spacer(minLength: 0)
                }
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                        .foregroundColor(Color("Color-3"))
                        
                        TextField("Correo Electronico", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                        .foregroundColor(Color("Color-3"))
                        
                        SecureField("Contraseña", text: self.$pass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    Button(action: {
                        
                    }) {
                        
                        Text("Olvido su contraseña?")
                            .foregroundColor(Color.white)
                    }
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            // bottom padding...
            .padding(.bottom, 65)
            .background(Color("Color-2"))
            .clipShape(CShape())
            .contentShape(CShape())
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 0
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            
            
            Button(action: {
                Login()
            }) {
                        Text("INICIAR SESION")
                            .foregroundColor(.white)
                            .fontWeight(.bold)
                            .padding(.vertical)
                            .padding(.horizontal, 50)
                            .background(Color("Color-2"))
                            .clipShape(Capsule())
                            .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
                }
            
            .offset(y: 25)
            .opacity(self.index == 0 ? 1 : 0)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Info"), message: Text("Bienvenido \(email)"), dismissButton: .default(Text("Aceptar")))
        })
        .alert(isPresented: $showAlertE, content: {
            Alert(title: Text("Error"), message: Text("\(errorR)"), dismissButton: .default(Text("Aceptar")))
        })
        .sheet(isPresented: $mostrarInicio, content: {
            Inicio()
        })
    }
    
    func Login(){
            firebaseManager.LoginUsuario(correo: email, contraseña: pass){
                error in
                if let error = error {
                    errorR = error.localizedDescription
                    print("Error: \(error.localizedDescription)")
                    showAlertE = true
                    showAlert = false
                }
                else{
                    print("Registro realizado con exito")
                    showAlert = true
                    showAlertE = false
                    mostrarInicio = true
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
            }
        
    }
}



struct SignUP : View {
    
    @State var email = ""
    @State var pass = ""
    @State var Repass = ""
    @State var mostrarInicio: Bool = false
    @State var showAlert: Bool = false
    @State var showAlertE: Bool = false
    @State var errorR: String = ""
    @Environment(\.presentationMode) var presentationMode
    @Binding var index : Int
    let firebaseManager = FirebaseManager()
    
    var body: some View{
        
        ZStack(alignment: .bottom) {
            
            VStack{
                
                HStack{
                    
                    Spacer(minLength: 0)
                    
                    VStack(spacing: 10){
                        
                        Text("SignUp")
                            .foregroundColor(self.index == 1 ? .white : .gray)
                            .font(.title)
                            .fontWeight(.bold)
                        
                        Capsule()
                            .fill(self.index == 1 ? Color.blue : Color.clear)
                            .frame(width: 100, height: 5)
                    }
                }
                .padding(.top, 30)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "envelope.fill")
                        .foregroundColor(Color("Color-3"))
                        
                        TextField("Correo Electronico", text: self.$email)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 40)
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                        .foregroundColor(Color("Color-3"))
                        
                        SecureField("Password", text: self.$pass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
                
             
                
                VStack{
                    
                    HStack(spacing: 15){
                        
                        Image(systemName: "eye.slash.fill")
                        .foregroundColor(Color("Color-3"))
                        
                        SecureField("Password", text: self.$Repass)
                    }
                    
                    Divider().background(Color.white.opacity(0.5))
                }
                .padding(.horizontal)
                .padding(.top, 30)
            }
            .padding()
            
            .padding(.bottom, 65)
            .background(Color("Color-2"))
            .clipShape(CShape1())
            
            .contentShape(CShape1())
            
            .shadow(color: Color.black.opacity(0.3), radius: 5, x: 0, y: -5)
            .onTapGesture {
            
                self.index = 1
                    
            }
            .cornerRadius(35)
            .padding(.horizontal,20)
            
            
            
            
            Button(action: {
                registro()
            }) {
                
                Text("REGISTRARSE")
                    .foregroundColor(.black)
                    .fontWeight(.bold)
                    .padding(.vertical)
                    .padding(.horizontal, 50)
                    .background(Color("Color-3"))
                    .clipShape(Capsule())
                    // shadow...
                    .shadow(color: Color.white.opacity(0.1), radius: 5, x: 0, y: 5)
            }
          
            .offset(y: 25)
        
            .opacity(self.index == 1 ? 1 : 0)
        }
        .alert(isPresented: $showAlert, content: {
            Alert(title: Text("Registro Exitoso"), message: Text("Usuario registrado correctamente!"), dismissButton: .default(Text("Aceptar")))
        })
        .alert(isPresented: $showAlertE, content: {
            Alert(title: Text("Error"), message: Text("\(errorR)"), dismissButton: .default(Text("Aceptar")))
        })
        .sheet(isPresented: $mostrarInicio, content: {
            Inicio()
        })
    }
    
    func registro(){
        if pass == Repass{
            firebaseManager.registrarUsuario(correo: email, contraseña: pass){
                error in
                if let error = error {
                    errorR = error.localizedDescription
                    print("Error: \(error.localizedDescription)")
                    showAlertE = true
                    showAlert = false
                }
                else{
                    print("Registro realizado con exito")
                    showAlert = true
                    showAlertE = false
                    mostrarInicio = true
                    self.presentationMode.wrappedValue.dismiss()
                    
                }
            }
        }
        else{
            errorR = "Contraseñas no coinciden!"
            showAlertE = true
            showAlert = false
            print("Contraseñas no coinciden!")
        }
        
    }
}

