require_relative "utils"

Dir.glob("*/.*").reject { |f| f.end_with?("/.", "/..") }.each do |file|
  Utils.create_symlink file
end
