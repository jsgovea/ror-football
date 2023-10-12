module PlayersHelper
  def self.generate_full_name(country)
    yaml_data = YAML.load_file("#{Rails.root}/db/seeds/names.yml")
    spanish_first_name = yaml_data['personal_spanish_names']
    spanish_last_name = yaml_data['personal_spanish_last_names']
    english_first_name = yaml_data['personal_english_names']
    english_last_name = yaml_data['personal_english_last_names']
    german_first_name = yaml_data['personal_german_names']
    german_last_name = yaml_data['personal_german_last_names']

    full_name = []
    case country
    when "Mexico"
      full_name = [spanish_first_name.sample, spanish_last_name.sample]
    when "Spain"
      full_name = [spanish_first_name.sample, spanish_last_name.sample]
    when "Germany"
      full_name = [german_first_name.sample, german_last_name.sample]
    when "England"
      full_name = [english_first_name.sample, english_last_name.sample]
    end
    return full_name
  end
end
