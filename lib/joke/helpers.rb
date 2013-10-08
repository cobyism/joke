module Joke
  module Helpers

    def jekyll_preview(path, &missing_file_block)
      file_path = File.join('_site',  path.gsub('/preview',''))
      file_path = File.join(file_path, 'index.html') unless file_path =~ /\.[a-z]+$/i

      if File.exist?(file_path)
        file = File.open(file_path, "rb")
        contents = file.read
        file.close
        erb contents, :layout => false
      else
        erb :not_found
      end
    end

  end
end
