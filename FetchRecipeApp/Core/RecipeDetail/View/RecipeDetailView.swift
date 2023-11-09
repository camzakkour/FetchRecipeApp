//
//  RecipeDetailView.swift
//  FetchRecipeApp
//
//  Created by Cameron Zakkour on 11/7/23.
//

import SwiftUI

struct RecipeDetailView: View {
    
    let recipeId: String
    let recipeName: String
    let recipeImageUrl: URL?
    @StateObject private var recipeDetailViewModel = RecipeDetailViewModel()
    
    var body: some View {
        VStack(alignment: .leading) {
            AsyncImage(url: recipeImageUrl) { image in
                image.resizable()
                    .aspectRatio(contentMode: .fill)
                    .frame(height: 300)
                    .clipShape(RoundedRectangle(cornerRadius: 10.0, style: .continuous))
            } placeholder: {
                ProgressView()
            }
            .padding(.bottom, 20)
            Spacer()
        }
        
        VStack(alignment: .leading) {
            
            RecipeCard(recipeId: recipeId)
            
        }
        .padding()
        .navigationTitle(recipeName)
        .navigationBarTitleDisplayMode(.inline)
    }
}

struct RecipeCard: View {
    @State private var selectedTab: String = "ingred"
    @StateObject private var recipeDetailViewModel = RecipeDetailViewModel()
    let recipeId: String
    
    var body: some View {
        HStack(spacing: 0) {
            Button {
                self.selectedTab = "ingred"
                
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .fill(selectedTab == "ingred" ? Color.black : Color.clear)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 20, height: 50)
                    .overlay {
                        Text("Ingredients")
                            .foregroundColor(selectedTab == "ingred" ? Color.white : Color.black.opacity(0.5))
                            .fontWeight(.bold)
                    }
            }
            
            Button {
                self.selectedTab = "instruct"
                
            } label: {
                RoundedRectangle(cornerRadius: 20)
                    .fill(selectedTab == "instruct" ? Color.black : Color.clear)
                    .frame(width: (UIScreen.main.bounds.width / 2) - 20, height: 50)
                    .overlay {
                        Text("Instructions")
                            .foregroundColor(selectedTab == "instruct" ? Color.white : Color.black.opacity(0.5))
                            .fontWeight(.bold)
                    }
            }
        }
        .background {
            RoundedRectangle(cornerRadius: 20)
                .fill(Color.secondary.opacity(0.2))
        }
        
        if (selectedTab == "ingred") {
            ScrollView {
                VStack {
                    ForEach(recipeDetailViewModel.ingredients , id:\.self){ ing in
                        
                        HStack(alignment: .top) {
                            Circle()
                                .foregroundColor(.black)
                                .frame( height: 6)
                            Text(ing.measure)
                                .foregroundColor(.gray)
                                .font(.footnote)
                            Text(ing.name)
                                .font(.caption)
                                .foregroundColor(.black)
                            Spacer()
                        }
                        .frame(maxWidth: .infinity)
                        .padding()
                        .background {
                            RoundedRectangle(cornerRadius: 15)
                                .fill(Color.white)
                                .shadow(color: Color.black.opacity(0.3), radius: 3)
                        }
                    }
                }
                .task {
                    await recipeDetailViewModel.getRecipeDetail(recipeId: recipeId)
                }
                .padding(1)
                .padding(.horizontal , 1)
            }
            .frame(height: .infinity)
        } else {
            ScrollView {
                VStack(alignment: .leading) {
                    HStack{
                        Text(recipeDetailViewModel.strInstructions)
                            .font(.subheadline)
                            .fontWeight(.medium)
                        
                        Spacer()
                    }
                    .frame(maxWidth: .infinity)
                    .padding()
                    .background {
                        RoundedRectangle(cornerRadius: 15)
                            .fill(Color.white)
                            .shadow(color: Color.black.opacity(0.3), radius: 3)
                    }
                }
                .padding(1)
                .padding(.horizontal, 1)
            }
            .padding(.top)
            .frame(maxWidth: .infinity)
            .frame(height: 225)
            .padding(.bottom)
        }
    }
}

#Preview {
    ContentView()
}
