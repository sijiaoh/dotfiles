require_relative "utils"

Dir.glob "*/**/.*" do |file|
  Utils.create_symlink file
end
