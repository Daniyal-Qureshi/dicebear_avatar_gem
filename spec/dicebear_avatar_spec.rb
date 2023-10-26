# frozen_string_literal: true

# spec/dicebear_avatar_spec.rb

require 'dicebear_avatar'

RSpec.describe DicebearAvatar do
  describe '.generate_avatar' do
    context 'when valid input is provided' do
      it 'generates an avatar' do
        api_version = '7.x'
        style_name = 'adventurer'
        file_format = 'jpg'
        filename = 'avatar'
        options = { seed: 'Alice' }

        expect do
          described_class.generate_avatar(api_version: api_version, style_name: style_name, file_format: file_format,
                                          filename: filename, options: options)
        end
          .to output(/Avatar generated successfully/).to_stdout
      end
    end

    context 'when an invalid file format is provided' do
      it 'raises an error' do
        api_version = '5.x'
        style_name = 'adventurer'
        file_format = 'png' # Invalid format
        filename = 'avatar'
        options = { seed: 'Alice' }

        expect do
          described_class.generate_avatar(api_version: api_version, style_name: style_name, file_format: file_format,
                                          filename: filename, options: options)
        end
          .to output(/Invalid file format: png. Please choose from jpg or svg/).to_stdout
      end
    end

    context 'when an invalid option is provided' do
      it 'raises an error' do
        api_version = '7.x'
        style_name = 'adventurer'
        file_format = 'svg'
        filename = 'avatar'
        options = { color: 'stripes' } # Invalid option

        expect do
          described_class.generate_avatar(api_version: api_version, style_name: style_name, file_format: file_format,
                                          filename: filename, options: options)
        end
          .to output(/Invalid option: color. Please choose from .* /).to_stdout
      end
    end

    context 'when an API request returns an error' do
      it 'raises an error' do
        api_version = '7.x'
        style_name = 'adventurer'
        file_format = 'svg'
        filename = 'avatar'
        options = { seed: 'Bob' }

        # Stub HTTParty to simulate an API error
        allow(HTTParty).to receive(:get).and_return(double(code: 500))

        expect do
          described_class.generate_avatar(api_version: api_version, style_name: style_name, file_format: file_format,
                                          filename: filename, options: options)
        end
          .to output(/Error: Unable to generate the avatar. HTTP Status Code: 500/).to_stdout
      end
    end
  end
end
