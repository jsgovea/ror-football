class Create::TeamsJob < ApplicationJob
  include GlobalsHelper
  queue_as :default

  def perform(*args)
    yaml_data = YAML.load_file("#{Rails.root}/db/seeds/initial_data.yml")
    teams = yaml_data['teams']
    teams.each do |team|
      team_exists = Team.find_by(name: team['name'])
      unless team_exists
        puts "Current league: #{team['league']}"
        league_id = League.find_by(name: team['league']).id
        teams_hash = Hash.new
        teams_hash = {
          :model => 'Team',
          :name => team['name'],
          :league_id => league_id,
          :prestige => team['prestige'],
          :home_color => team['home_color'],
          :away_color => team['away_color'],
          :off_value => team['off_value'],
          :mid_value => team['mid_value'],
          :def_value => team['def_value'],
          :budget => team['budget'],
          :overall => team['overall'],
        }
        GlobalsHelper.create_by_yaml(teams_hash)
        Rails.logger.info("Team '#{team['name']}' created!")
      end
    end
  end
end
