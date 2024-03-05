require_relative "utils"

Dir.glob("*/.*").reject { |f| f.end_with?("/.", "/..") } do |file|
  Utils.create_symlink file
end
