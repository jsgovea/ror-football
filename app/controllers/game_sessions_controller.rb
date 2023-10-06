class GameSessionsController < ApplicationController
  # Show new formulary to create a new game session
  def index
    puts "Going to main menu"
    Create::CountriesJob.perform_now()

  end

  # Show all game sessions
  def show
  end

  # Create a new game session
  def create

  end
end
