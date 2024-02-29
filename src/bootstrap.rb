require_relative "utils"

Dir.glob "*/**/setup.rb" do |file|
  require_relative "../#{file}"
end

require_relative "link_dotfiles"
