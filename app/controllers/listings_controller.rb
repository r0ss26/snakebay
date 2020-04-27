class ListingsController < ApplicationController
    before_action :set_listing, only: [:show, :edit, :update, :destroy]


    def index
        @listings = Listing.all
    end

    def show
        @snake = Listing.find(params[:id])
    end

    def new
        @listing = Listing.new
        set_breeds_and_sexes
    end

    def create
        #finish logic for creating a record
        puts listing_params
        @listing = Listing.create(listing_params)
        if @listing.errors.any?
            set_breeds_and_sexes
            render "new"
        else 
            redirect_to listings_path
        end
    end

    def edit
        @listing = Listing.find(params[:id])
        set_breeds_and_sexes
    end

    def update
        #finsih logic for updating the record
        @listing = Listing.find(params[:id])
        @listing.update(listing_params)
        if @listing.errors.any?
            set_breeds_and_sexes
            render "edit"
        else
            redirect_to listing_path(params[:id])
        end
    end

    def destroy
        #finish logic for deleting the record
        Listing.find(params[:id]).destroy
        redirect_to listings_path
    end

    private

    def set_listing
        @listing = Listing.find(params[:id])
    end

    def listing_params
        params.require(:listing).permit(:title, :description, :breed_id, :sex, :price, :deposit, :date_of_birth, :diet, :city, :state, :picture)
    end

    def set_breeds_and_sexes
        @breeds = Breed.all
        @sexes = Listing.sexes.keys
    end

end