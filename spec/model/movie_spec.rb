require 'rails_helper'

RSpec.describe Movie, :type => :model do 
    context "validate movie name" do
      it "he is valid" do
        movie = Movie.new(name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 5)
        expect(movie).to be_valid 
      end
      
      it "he is not valid" do
        movie = Movie.new(synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 5)
        expect(movie).to_not be_valid  
      end  
    end

    context "validate movie sinopsys" do
        it "he is valid" do
          movie = Movie.new(name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 5)
          expect(movie).to be_valid 
        end
        
        it "he is not valid" do
          movie = Movie.new(name: "X-Men", release_year: 2000, director:"Simon Kinberg", rating: 5)
          expect(movie).to_not be_valid  
        end  
    end

    context "validate movie release year" do
        it "he is valid" do
          movie = Movie.new(name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 5)
          expect(movie).to be_valid 
        end
        
        it "he is not valid" do
          movie = Movie.new(name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", director:"Simon Kinberg", rating: 5)
          expect(movie).to_not be_valid  
        end

        it "length validations" do
          movie = Movie.new(name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 20000, director:"Simon Kinberg", rating: 5)  
          expect(movie).to_not be_valid    
        end

    context "validate movie rating" do
        it "he is valid" do
          movie = Movie.new(name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 5)
          expect(movie).to be_valid 
        end
            
        it "he is not valid" do
          movie = Movie.new(name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 50)
          expect(movie).to_not be_valid  
        end  
     end
    end
end