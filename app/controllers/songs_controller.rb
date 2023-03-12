class SongsController < ApplicationController
  def index
    @songs = policy_scope(Song)
    authorize @songs
  end

  def new
    @song = Song.new
    authorize @song
  end

  def create
    @song = Song.new(song_params)
    authorize @song
    if @song.save
      redirect_to songs_path
    else
      render :new
    end
  end

  def show
    @song = Song.find(params[:id])
    authorize @song
  end

  private

  def song_params
    params.require(:song).permit(:title, :artist, :description, :song_file)
  end
end
