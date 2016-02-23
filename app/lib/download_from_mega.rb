module DownloadFromMega
  def download
    require "rmega"
    storage = Rmega.login("zdubzdab@gmail.com", "mega_nz_password")

    file_name = params[:path_to_file].split("/")[4]
    file = storage.nodes.find { |node| node.type == :file and node.name =~ /#{file_name}/i }
    downloaded_file = file.download('/home/zdubzdab/rails_projects/schoolTest/tmp')
    send_file  '/home/zdubzdab/rails_projects/schoolTest/tmp/#{downloaded_file}'
  end
end
