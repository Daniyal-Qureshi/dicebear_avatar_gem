# DicebearAvatar

DicebearAvatar is a Ruby gem that provides a simple interface to create avatars using the [Dicebear API](https://www.dicebear.com/). With DicebearAvatar, you can easily generate avatars with various customization options, including clothing, accessories, and more. This gem aims to simplify the process of creating unique avatars for your applications.


## Installation

Add this line to your application's Gemfile:

```ruby
gem 'dicebear_avatar'
```

And then execute:

    $ bundle

Or install it yourself as:

    $ gem install dicebear_avatar

## Usage
Here's a quick guide on how to use DicebearAvatar:

## Generate an Avatar: 
You can generate avatars with custom styles, API versions, and more by using the generate_avatar method. Provide the style name, API version, file name, and file format along with optional customization options.
``` ruby
DicebearAvatar.generate_avatar(
  api_version: '7.x',
  style_name: 'adventurer',
  file_format: 'jpg',
  filename: 'avatar',
  options: { seed: 'Alice' }
)
```
## Customization Options:
You can customize avatars by passing additional options like seed, rotate, scale, backgroundColor, and many more. Check the full list of options in the [Dicebear API Customization](https://www.dicebear.com/how-to-use/http-api/)

## Sample Options Display: 
To see the available customization options, use the sample_options method to print a colorful list of key-value pairs in your terminal.

```ruby
DicebearAvatar.sample_options
```

## Contributions and Open Invitation:

The DicebearAvatar gem was initiated by Daniyal Qureshi. I warmly welcome contributions from the open-source community to further improve and expand this project. Feel free to reach out to Daniyal Qureshi at daniyalqureshi.cs@gmail.com with your ideas, questions, and suggestions.

**Getting Started with Contributions:**

You can begin contributing to the project by following these steps:

1. **Create Issues:** Start by creating issues that address bugs, propose enhancements, or discuss new features. This provides a structured way to share your ideas and collaborate on improvements.

2. **Submit Pull Requests:** Once you've identified an issue or have a contribution in mind, you can submit a pull request to implement the changes. Our collaborative environment ensures that your contributions are reviewed and integrated effectively.

By following these steps, you can actively participate in the growth of the NamedayApi gem. We value your input and look forward to working together to make this project even better.

## License

The gem is available as open source under the terms of the [MIT License](https://opensource.org/licenses/MIT).

## Code of Conduct

Everyone interacting in the DicebearAvatar project’s codebases, issue trackers, chat rooms and mailing lists is expected to follow the [code of conduct](https://github.com/Daniyal-Qureshi/dicebear_avatar_gem/blob/master/CODE_OF_CONDUCT.md).
