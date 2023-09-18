class SongsController < ApplicationController
    before_action :set_song, only: [:show, :edit, :update, :destroy]

    # GET /songs
    def index
      songs = Song.all
      render json: songs
    end
  
    # GET /songs/1
    def show
        render json: @song
    end

    # POST /songs
    def create
      @song = Song.new(song_params)
      if @song.save
        render json: { message: "Song created", data: @song }
      else
        render json: { errors: @song.errors.full_messages },status: :unprocessable_entity
      end
    end
  
    # PATCH/PUT /songs/1
    def update
      if @song.update(song_params)
        render json: { message: "Song updated", data: @song }
      else
        render json: { errors: @song.errors.full_messages },status: :unprocessable_entity
      end
    end
  
    # DELETE /songs/1
    def destroy
      @song.destroy
      render json: { message: "Song deleted"}
    end
  
    private
  
    def set_song
      @song = Song.find(params[:id])
        rescue ActiveRecord::RecordNotFound
        render json: { errors: 'Song not found' }, status: :not_found
        
    end
  
    def song_params
      params.permit(:title, :genre, :play_count, :artist_id, :album_id)
    end
end
