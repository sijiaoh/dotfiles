require_relative "utils"

require_relative "link_dotfiles"

Dir.glob "*/**/setup.rb" do |file|
  require_relative "../#{file}"
end
