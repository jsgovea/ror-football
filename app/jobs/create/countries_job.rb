class Create::CountriesJob < ApplicationJob
  include GlobalsHelper
  queue_as :default

  def perform(*args)
    # Create the countries
    # Only admins can perform this action
    yaml_data = YAML.load_file("#{Rails.root}/db/seeds/initial_data.yml")
    countries = yaml_data['countries']
    countries.each do |country|
      coutry_exists = Country.find_by(name: country['name'])
      unless coutry_exists
        countries_hash = Hash.new
        countries_hash = {
          :model => 'Country',
          :name => country['name'],
          :flag_emoji => country['flag_emoji'],
          :capital => country['capital'],
          :population => country['population']
        }
        GlobalsHelper.create_by_yaml(countries_hash)
      Rails.logger.info("Country '#{country['name']}' created!")
    end
  end
  end
end
