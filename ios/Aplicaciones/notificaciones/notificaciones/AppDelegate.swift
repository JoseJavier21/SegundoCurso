//
//  AppDelegate.swift
//  notificaciones
//
//  Created by dam2 on 7/2/24.
//

import UIKit
import UserNotifications


@main
class AppDelegate: UIResponder, UIApplicationDelegate, UNUserNotificationCenterDelegate {



    func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplication.LaunchOptionsKey: Any]?) -> Bool {

        //Detectar si la app se abrio a traves de la notificacion
        let notificacionOption = launchOptions?[.remoteNotification]
        if let notificacion = notificacionOption as? [String:AnyObject],
           let aps = notificacion["aps"] as? [String: AnyObject]{
            print("Se ha abierto la app tocando la notificacion: \(String(describing: (aps["alert"] as! [String:AnyObject])["title"]))")
            
        }
            
            
        // Override point for customization after application launch.
           registerForPushNotification()
           UNUserNotificationCenter.current().delegate = self
        return true
    }
    

    
    // Se ejecuta al recibir una notificacion con la aplicacion abierta
    func userNotificationCenter(_ center: UNUserNotificationCenter, willPresent notification: UNNotification, withCompletionHandler completionHandler: @escaping (UNNotificationPresentationOptions) -> Void) {
        completionHandler([.alert, .badge, .sound])
    }
    
    func registerForPushNotification(){
        // Pide permiso para mostar notificaciones
        UNUserNotificationCenter.current().requestAuthorization(options: [.alert,.badge,.sound]){
            granted, error in
            print("Permiso concedido: \(granted)")
            
        //Detectar que el usuario cambia la configuracion
            guard granted else {return}
            self.getNotificationSettings()
        }
    }
    
    //Obtiene la configuracion de las notificaciones push
    func getNotificationSettings(){
        UNUserNotificationCenter.current().getNotificationSettings(){
            settings in
            //print("Configuracion Push: \(settings)")
            
            //Comprobar que se ha concedido permisos para recibir notificaciones
            guard settings.authorizationStatus  == .authorized else { return }
            
            DispatchQueue.main.async {
                //hacemos la peticion para que APNs nos registro
                UIApplication.shared.registerForRemoteNotifications()
            }
        }
    }
    
    // APNs responde nos registra y nos envia el token
    func application(_ application: UIApplication, didRegisterForRemoteNotificationsWithDeviceToken deviceToken: Data) {
        // % indica que va a especificar un formato
        // 02 indica que como minimo debe tener 2 caracteres
        // .2 indica que como maximo tendra 2 decimales
        // hh indica que es un puntero a un unsigned char
        // x indica que debe estar formateado en hexadecimal
        let tokenParts = deviceToken.map{ data in String(format: "%02.2hhx", data)}
        let token = tokenParts.joined()
        
    // Aqui tenemos el tokem del dispositivo(para cada aplicacion)
            print("Device token: \(token)")
    
    // Enviar el token al backend
    }
    
    // Si se produce un error, APNs ejecuta esta funcion
    func application(_ application: UIApplication, didFailToRegisterForRemoteNotificationsWithError error: Error) {
        print("Error al registrar el dispositivo en el APNs: \(error.localizedDescription)")
    }
    

    // MARK: UISceneSession Lifecycle

    func application(_ application: UIApplication, configurationForConnecting connectingSceneSession: UISceneSession, options: UIScene.ConnectionOptions) -> UISceneConfiguration {
        // Called when a new scene session is being created.
        // Use this method to select a configuration to create the new scene with.
        return UISceneConfiguration(name: "Default Configuration", sessionRole: connectingSceneSession.role)
    }

    func application(_ application: UIApplication, didDiscardSceneSessions sceneSessions: Set<UISceneSession>) {
        // Called when the user discards a scene session.
        // If any sessions were discarded while the application was not running, this will be called shortly after application:didFinishLaunchingWithOptions.
        // Use this method to release any resources that were specific to the discarded scenes, as they will not return.
    }


}

