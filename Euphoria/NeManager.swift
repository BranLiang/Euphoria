//
//  NeManager.swift
//  Euphoria
//
//  Created by Bran on 2022/2/10.
//

import Foundation
import NetworkExtension

class Manager {
    static func createManager() async throws {
        let managers = try await NETransparentProxyManager.loadAllFromPreferences()
        for manager in managers {
            try await manager.removeFromPreferences()
        }
        
        let manager = NETransparentProxyManager()
        manager.localizedDescription = "Euphoria"
        let configuration = NETunnelProviderProtocol()
        configuration.providerBundleIdentifier = Bundle.main.bundleIdentifier! + ".Extension"
        configuration.excludeLocalNetworks = true
        configuration.serverAddress = "127.0.0.1"
        manager.protocolConfiguration = configuration
        
        try await manager.saveToPreferences()
    }
}
