class AlbumsController < ApplicationController

     before_action :set_album, only: [:show, :update, :destroy]
      
        # GET /albums
        def index
          albums = Album.all
          render json: albums
        end
      
        # GET /albums/1
        def show
            render json: @album
        end
      
        # POST /albums
        def create
          @album = Album.new(album_params)
      
          if @album.save
            render json: { message: "album created", data: @album }
          else
            render json: { errors: @album.errors.full_messages },status: :unprocessable_entity
          end
        end
      
        # PATCH/albums/1
        def update
          if @album.update(album_params)
            render json: { message: "album updated", data: @album }
          else
            render json: { errors: @album.errors.full_messages },status: :unprocessable_entity
          end
        end
      
        # DELETE /albums/1
        def destroy
          @album.destroy
          render json: { message: "Song deleted"}
        end
      
        private
      
        def set_album
          @album = Album.find(params[:id])
        rescue ActiveRecord::RecordNotFound
            render json: { errors: 'album not found' }, status: :not_found
        end
      
        def album_params
          params.permit(:title, :release_date, :artist_id)
        end  
end
