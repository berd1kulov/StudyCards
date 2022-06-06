//
//  OxfordAPIError.swift
//  StudyCards
//
//  Created by Bakdaulet Berdikul on 06.06.2022.
//

import Foundation

enum OxfordAPIError: String, Error {
    case badRequest = "Error 400: Error 400: Paramètres manquants dans la requête."
    case forbidden = "Error 403: Requête non autorisée (potentiellement un problème au niveau de la clé d'API)."
    case notFound = "Error 404: Word not found."
    case tooManyRequests = "Error 429: Trop de requêtes ont été effectuées dans un laps de temps. Veuillez réessayer ultérieurement."
    case serverError = "Error 500: Erreur serveur."
    case apiError = "Une Error est survenue."
    case invalidURL = "Error: URL invalide."
    case networkError = "Une Error est survenue, pas de connexion Internet."
    case decodeError = "Une Error est survenue au décodage des données téléchargées."
    case downloadError = "Une Error est survenue au téléchargement des données."
    case unknown = "Error inconnue."
}
