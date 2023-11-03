//
//  PokemonDetailViewModel.swift
//  PokemonApp
//
//  Created by Kaan Yıldırım on 3.11.2023.
//

import Foundation

protocol PokemonDetailViewModelOutPut: AnyObject{
    func getPokemonDetail(_ pokemon: PokemonDetails)
    func getPokemonSpecies(_ flavorTextEntries: Species)
}

final class PokemonDetailViewModel {
    
    // Dependency Injection
    private let pokemonService: PokemonService
    
    // Delegate Pattern
    weak var output: PokemonDetailViewModelOutPut?
    
    
    init(pokemonService: PokemonService) {
        self.pokemonService = pokemonService
    }
    
    func fetchPokemonDetail(_ name: String) {
        pokemonService.fetchPokemonDetail(name: name) { [weak self] result in
            switch result {
            case .success(let fetchedPokemon):
                self?.output?.getPokemonDetail(fetchedPokemon)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
    
    func fetchPokemonSpecies(url: String) {
        pokemonService.fetchPokemonSpecies(url: url) { [weak self] result in
            switch result {
            case .success(let fetchedPokemonSpecies):
                self?.output?.getPokemonSpecies(fetchedPokemonSpecies)
            case .failure(let error):
                print(error.localizedDescription)
            }
        }
    }
}
