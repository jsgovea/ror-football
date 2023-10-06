module GlobalsHelper
  require 'active_support/inflector'

  def self.create_by_yaml(*args)
    args.each do |value|
      new_model = value[:model].constantize.new
      new_model.attributes = value.except(:model)
      if new_model.save
        puts "Model created: #{new_model.inspect}"
      else
        puts "Failed to save model"
        puts "Errors: #{new_model.errors.full_messages.join(', ')}"
      end
    end
   end
end
