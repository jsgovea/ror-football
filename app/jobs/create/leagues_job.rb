class Create::LeaguesJob < ApplicationJob
  include GlobalsHelper
  queue_as :default

  def perform(*args)
    yaml_data = YAML.load_file("#{Rails.root}/db/seeds/initial_data.yml")
    leagues = yaml_data['leagues']
    leagues.each do |league|
      leagues_exists = League.find_by(name: league['name'])
      unless leagues_exists
        country_id = Country.find_by(name: league['country']).id
        leagues_hash = Hash.new
        leagues_hash = {
          :model => 'League',
          :name => league['name'],
          :division => 1,
          :country_id => country_id,
          :prestige => league['prestige'],
        }
        GlobalsHelper.create_by_yaml(leagues_hash)
        Rails.logger.info("League '#{league['name']}' created!")
      end
    end
  end
end
