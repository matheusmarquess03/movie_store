require 'rails_helper'

RSpec.describe MoviesController, :type => :controller do 
    context "GET index" do
      it "should sucess and render to index page" do
          get :index
          expect(response).to have_http_status(200)
          expect(response).to render_template(:index)      
       end

       it "should have one movie" do
        create(:movie)
        get :index
        expect(assigns(:movies)).to_not be_empty     
     end
    end

    context "GET #show" do
        let(:movie) { create(:movie)  }
        it "should sucess and render to edit page" do
          get :show, params: {id: movie.id}
          expect(response).to have_http_status(200)
          expect(response).to render_template(:show)    
        end 
         
        it "where have id" do
          get :show, params: { id: movie.id}
          expect(assigns(:movie)).to be_a(Movie) 
          expect(assigns(:movie)).to eq(movie)    
        end
      end


    context "GET #new" do
      before :each do        
        @user=create(:user)
        sign_in @user
      end
        it "should sucess and render to new movie" do 
          get :new
          expect(response).to have_http_status(200)
          expect(response).to render_template(:new)      
        end
    
        it "should new movie" do 
          get :new
          expect(assigns(:movie)).to be_a(Movie)
          expect(assigns(:movie)).to be_a_new(Movie)    
        end
    end

    context "GET #edit" do
      before :each do        
          @user=create(:user)
          sign_in @user
      end
      let(:movie) { create(:movie)  }
      it "should sucess and render to edit movie" do
        get :edit, params: {id: movie.id }
        expect(response).to render_template(:edit)
        expect(assigns(:movie)).to be_a(Movie)    
      end   
    end
    
    context "POST #create " do
      before :each do        
          @user=create(:user)
          sign_in @user
      end
      let!(:params) {
        { name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 5 }
        }
      it "create a new movie" do
        post :create, params: { movie: params }
        expect(flash[:notice]).to eq("Movie was successfully created.")
        expect(response).to redirect_to(action: :show, id: assigns(:movie).id)    
      end
    
        it "not create a new movie " do
          params =  { synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 5}
          post :create, params: { movie: params}
          expect(response).to render_template("new") 
        end
      end

    context "PUT #update" do
      before :each do        
          @user=create(:user)
          sign_in @user
      end
      let!(:movie) { create(:movie) } 
      it "should update movie info" do
        params =  { name: "Update X-Men"}
        patch :update, params: { id: movie.id, movie: params }
        movie.reload
        expect(movie.name).to eq(params[:name])
        expect(flash[:notice]).to eq("Movie was successfully updated.")
        expect(response).to redirect_to(action: :show, id: assigns(:movie).id)      
      end
            
      it "should not update movie info" do 
        params = { name: nil }
    
        put :update, params: { id: movie.id, movie: params}
    
        expect(response).to render_template(:edit) 
        end    
    end
      
    context "DELETE #destroy" do
      before :each do        
        @user=create(:user)
            sign_in @user
      end

      let!(:movie) { create(:movie)}
      it "should dele movie" do
        delete :destroy, params: { id: movie.id}
        expect(flash[:notice]).to eq("Movie was successfully destroyed.")
        expect(response).to redirect_to(action: :index)
      end  
    end

    context 'and search for movie' do
      scenario 'successfully' do
        Movie.create(name: "X-Men", synopsis: "X-Men é uma série de filmes americana de super-heróis.", release_year: 2000, director:"Simon Kinberg", rating: 5)
      end
    end
end