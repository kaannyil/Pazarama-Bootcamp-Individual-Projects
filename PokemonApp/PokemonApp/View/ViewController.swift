//
//  ViewController.swift
//  PokemonApp
//
//  Created by Kaan Yıldırım on 3.11.2023.
//

import UIKit

class ViewController: UIViewController, PokemonViewModelOutPut, PokemonDetailViewModelOutPut {
    func getPokemonSpecies(_ flavorTextEntries: Species) {
        print(flavorTextEntries)
    }
    
    func getPokemonDetail(_ pokemon: PokemonDetails) {
        print(pokemon)
    }
    
    func getPokemon(_ pokemon: Pokemon) {
        print(pokemon)
    }
    
    private let viewModel: PokemonViewModel
    private let detailViewModel: PokemonDetailViewModel
    
    init(viewModel: PokemonViewModel, detailViewModel: PokemonDetailViewModel) {
        self.viewModel = viewModel
        self.detailViewModel = detailViewModel
        super.init(nibName: nil, bundle: nil)
        viewModel.output = self
        detailViewModel.output = self
    }
    
    required init?(coder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
        view.backgroundColor = .yellow
        
        // viewModel.fetchPokemon()
        detailViewModel.fetchPokemonDetail("bulbasaur")
        // detailViewModel.fetchPokemonSpecies(url: "https://pokeapi.co/api/v2/pokemon-species/1/")
    }
}

