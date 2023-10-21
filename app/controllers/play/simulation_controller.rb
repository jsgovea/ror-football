class Play::SimulationController < ApplicationController
  def index
    @message = "Hello world"
    ActionCable.server.broadcast('simulation_channel', {body: @message})

  end

  def show
  end
end
