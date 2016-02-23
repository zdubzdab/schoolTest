module DownloadFromMega
  def download
    storage = Rmega.login("zdubzdab@gmail.com", "mega_nz_password")
    file_name = params[:path_to_file].split("/")[4]
    file = storage.nodes.find { |node| node.type == :file and node.name =~ /#{file_name}/i }
    downloaded_file = file.download('/tmp')
    send_file  '/tmp/#{downloaded_file}'
  end
end
