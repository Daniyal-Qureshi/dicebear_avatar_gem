# frozen_string_literal: true

require 'httparty'

# class Diebear class
class DicebearAvatar
  BASE_URL = 'https://api.dicebear.com'
  # Define the OPTIONS based on your schemar
  OPTIONS = {
    seed: 'John', # Example: set your seed value
    flip: false, # Example: set flip to false
    rotate: 0, # Example: set rotation angle
    scale: 100, # Example: set scale
    radius: 0, # Example: set radius
    size: 1, # Example: set size
    backgroundColor: ['transparent'], # Example: set background color
    backgroundType: ['solid'], # Example: set background type
    backgroundRotation: [0, 360], # Example: set background rotation
    translateX: 0,  # Example: set translation on X-axis
    translateY: 0,  # Example: set translation on Y-axis
    clip: true, # Example: set clip option
    randomizeIds: false, # Example: set randomizeIds option
    accessories: %w[variant04 variant03 variant02 variant01], # Example: set accessories
    accessoriesColor: %w[daa520 ffd700 fafad2 d3d3d3 a9a9a9], # Example: set accessories color
    accessoriesProbability: 10, # Example: set accessories probability
    beard: %w[variant08 variant07 variant06 variant05 variant04 variant03 variant02 variant01], # Example: set beard
    beardProbability: 5, # Example: set beard probability
    clothing: %w[variant23 variant22 variant21 variant20], # Example: set clothing
    clothingColor: %w[5bc0de 428bca 03396c],  # Example: set clothing color
    eyes: %w[variant12 variant11 variant10],  # Example: set eyes
    eyesColor: %w[76778b 697b94],  # Example: set eyes color
    glasses: %w[light07 light06],  # Example: set glasses
    glassesColor: %w[4b4b4b 32332], # Example: set glasses color
    glassesProbability: 20, # Example: set glasses probability
    hair: %w[short24 short23], # Example: set hair
    hairColor: %w[cab188 603a14],  # Example: set hair color
    hat: %w[variant10 variant09],  # Example: set hat
    hatColor: %w[2e1e05 2663a3], # Example: set hat color
    hatProbability: 5, # Example: set hat probability
    mouth: %w[sad10 sad09], # Example: set mouth
    mouthColor: %w[d29985 c98276], # Example: set mouth color
    skinColor: %w[ffdbac f5cfa0] # Example: set skin color
  }.freeze

  def self.sample_options
    OPTIONS.each do |key, value|
      key_color = "\e[32m" # Green color for keys
      value_color = "\e[31m" # Red color for values
      reset_color = "\e[0m"  # Reset color

      puts "#{key_color}#{key}#{reset_color}: #{value_color}#{value}#{reset_color}"
    end
  end

  def self.generate_avatar(api_version:, style_name:, file_format:, filename:, options: {})
    return unless validate_input(file_format, options)

    query_string = URI.encode_www_form(options)

    api_url_with_options = "#{BASE_URL}/#{api_version}/#{style_name}/#{file_format}?#{query_string}"

    response = HTTParty.get(api_url_with_options)
    if response.code.to_i == 200
      save_avatar(response, file_format, filename)
    else
      raise_error("Error: Unable to generate the avatar. HTTP Status Code: #{response.code}")
    end
  end

  def self.validate_input(file_format, options)
    unless %w[jpg svg].include?(file_format)
      raise_error("Invalid file format: #{file_format}. Please choose from jpg or svg")
      return false
    end

    options.each do |key, _value|
      unless OPTIONS.keys.include?(key)
        raise_error("Invalid option: #{key}. Please choose from #{OPTIONS.keys}.")
        return false
      end
    end

    true
  end

  def self.save_avatar(response, format, filename)
    File.open("#{filename}.#{format}", 'wb') { |file| file.write(response.body) }
    puts "\e[32m Avatar generated successfully \u{2705}"
  end

  def self.raise_error(message)
    puts "\e[31m #{message} \u{274C}"
  end

  private_class_method :validate_input, :save_avatar, :raise_error
end
