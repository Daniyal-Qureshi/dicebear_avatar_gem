# frozen_string_literal: true

lib = File.expand_path('lib', __dir__)
$LOAD_PATH.unshift(lib) unless $LOAD_PATH.include?(lib)
require 'dicebear_avatar/version'

Gem::Specification.new do |spec|
  spec.name          = 'dicebear_avatar'
  spec.version       = DicebearAvatar::VERSION
  spec.authors = ['Daniyal Qureshi']
  spec.email = ['daniyalqureshi.cs@gmail.com']
  spec.required_ruby_version = '>= 2.6.0'

  spec.summary = 'A Ruby gem for generating avatars using the Dicebear API'
  spec.description = 'DicebearAvatar is a Ruby gem that provides a simple interface to create avatars using the Dicebear API. It allows you to customize various avatar features, including clothing, accessories, and more.'
  spec.homepage = 'https://github.com/Daniyal-Qureshi/dicebear_avatar_gem'

  spec.license = 'MIT'

  # Prevent pushing this gem to RubyGems.org. To allow pushes either set the 'allowed_push_host'
  # to allow pushing to a single host or delete this section to allow pushing to any host.
  if spec.respond_to?(:metadata)
    spec.metadata['allowed_push_host'] = 'https://rubygems.org'

    spec.metadata['homepage_uri'] = spec.homepage
    spec.metadata['source_code_uri'] = 'https://github.com/Daniyal-Qureshi/dicebear_avatar_gem' # Correct the source code URL
  else
    raise 'RubyGems 2.0 or newer is required to protect against ' \
      'public gem pushes.'
  end

  # Specify which files should be added to the gem when it is released.
  # The `git ls-files -z` loads the files in the RubyGem that have been added into git.
  spec.files = Dir.chdir(File.expand_path(__dir__)) do
    `git ls-files -z`.split("\x0").reject { |f| f.match(%r{^(test|spec|features)/}) }
  end
  spec.bindir        = 'exe'
  spec.executables   = spec.files.grep(%r{^exe/}) { |f| File.basename(f) }
  spec.require_paths = ['lib']
  spec.add_dependency 'httparty', '~> 0.18.1'
end
