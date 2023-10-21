class SimulationChannel < ApplicationCable::Channel
  def subscribed
    stream_from 'simulation_channel'
  end

  def unsubscribed
    # Any cleanup needed when channel is unsubscribed
    stop_all_streams
  end

  def update_stats(data)
    match = Match.find(data['match_id'])
    match.update_attributes(data['match'])
    ActionCable.server.broadcast "match_channel", match: match

  end
end
