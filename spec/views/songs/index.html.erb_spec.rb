require 'rails_helper'

RSpec.describe 'songs/index' do
  before do
    Artist.destroy_all
    Song.destroy_all
    Preference.destroy_all
    Preference.create(song_sort_order: 'asc', artist_sort_order: 'asc', allow_create_artists: true, allow_create_songs: true)
    @song = Song.create(title: "Bullet the Blue Sky", artist_name: "U2")
    allow(view).to receive(:display_artist).and_return("They Might Be Giants")
    assign(:songs, Song.all)
  end

  it 'calls the helper to display the artist' do
    @song_sort = Preference.last.song_sort_order
    render
    expect(rendered).to match /They Might Be Giants/
  end
end
