//
//  KeychainManager.swift
//  Flashback-Records
//
//  Created by Matthew Lock on 23/11/2026.
//

import Foundation
import Security

/// Manager for securely storing OAuth credentials in the Keychain
final class KeychainManager {
    
    static let shared = KeychainManager()
    
    private init() {}
    
    // MARK: - Keys
    
    private enum Keys {
        static let oauthCredentials = "com.flashbackrecords.oauth.credentials"
    }
    
    // MARK: - Save Credentials
    
    /// Save OAuth credentials to Keychain
    /// - Parameter credentials: OAuth credentials to save
    /// - Throws: KeychainError if save fails
    func saveCredentials(_ credentials: OAuthCredentials) throws {
        let encoder = JSONEncoder()
        let data = try encoder.encode(credentials)
        
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: Keys.oauthCredentials,
            kSecValueData as String: data,
            kSecAttrAccessible as String: kSecAttrAccessibleWhenUnlockedThisDeviceOnly
        ]
        
        // Delete any existing item
        SecItemDelete(query as CFDictionary)
        
        // Add the new item
        let status = SecItemAdd(query as CFDictionary, nil)
        
        guard status == errSecSuccess else {
            throw KeychainError.saveFailed(status: status)
        }
    }
    
    // MARK: - Load Credentials
    
    /// Load OAuth credentials from Keychain
    /// - Returns: OAuth credentials if found, nil otherwise
    func loadCredentials() throws -> OAuthCredentials? {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: Keys.oauthCredentials,
            kSecReturnData as String: true,
            kSecMatchLimit as String: kSecMatchLimitOne
        ]
        
        var result: AnyObject?
        let status = SecItemCopyMatching(query as CFDictionary, &result)
        
        guard status != errSecItemNotFound else {
            return nil
        }
        
        guard status == errSecSuccess else {
            throw KeychainError.loadFailed(status: status)
        }
        
        guard let data = result as? Data else {
            throw KeychainError.invalidData
        }
        
        let decoder = JSONDecoder()
        return try decoder.decode(OAuthCredentials.self, from: data)
    }
    
    // MARK: - Delete Credentials
    
    /// Delete OAuth credentials from Keychain
    /// - Throws: KeychainError if deletion fails
    func deleteCredentials() throws {
        let query: [String: Any] = [
            kSecClass as String: kSecClassGenericPassword,
            kSecAttrAccount as String: Keys.oauthCredentials
        ]
        
        let status = SecItemDelete(query as CFDictionary)
        
        guard status == errSecSuccess || status == errSecItemNotFound else {
            throw KeychainError.deleteFailed(status: status)
        }
    }
    
    // MARK: - Check if Credentials Exist
    
    /// Check if OAuth credentials exist in Keychain
    /// - Returns: true if credentials exist, false otherwise
    func hasCredentials() -> Bool {
        return (try? loadCredentials()) != nil
    }
}

// MARK: - Keychain Error

enum KeychainError: LocalizedError {
    case saveFailed(status: OSStatus)
    case loadFailed(status: OSStatus)
    case deleteFailed(status: OSStatus)
    case invalidData
    
    var errorDescription: String? {
        switch self {
        case .saveFailed(let status):
            return "Failed to save to Keychain (status: \(status))"
        case .loadFailed(let status):
            return "Failed to load from Keychain (status: \(status))"
        case .deleteFailed(let status):
            return "Failed to delete from Keychain (status: \(status))"
        case .invalidData:
            return "Invalid data in Keychain"
        }
    }
}
