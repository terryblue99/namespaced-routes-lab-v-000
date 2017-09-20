class Admin::PreferencesController < ApplicationController

  def index
    @preferences = Preference.last
  end

end
