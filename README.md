# README

##### * Ruby and Rails version

Ruby 2.5.1
Rails 5.1.6

##### * Database creation and initialization

Start "rake db:create db:migrate" in terminal inside app folder

##### * How to run the test suite

The tests not exists yet

##### * How to work

  After installation and initialization of the application run the Rails server with "rails s" through terminal in app directory. Then type localhost:3000 in browser address line. After that you should sign up in the app. After signing up you will log in automatically and main page will be displayed.
  Interface is intuitive. It allows to upload the files, create the folders and subfolder. You can to do some manipulation with files and folders.
  Folders and files can be removed, files can be downloaded, folders can be renamed. All this functionality available from popup context menu which will appear on hover to the item line in file/folder list. After context menu appeared you should click on menu icon and action menu will be appeared. Then select action.
  Also app has simple API interface

##### * API interface description

  1. GET /api/v1/home
     - Index all folder and files
     
  2. GET /api/v1/asset_files
     - Index all files
     
  3. GET /api/v1/folders
     - Index all folders
     
  4. GET /api/v1/uploads/get/:id
     - Download the file with specified id
     
  5. GET /api/v1/browse/:folder_id
     - Browse the folder with specified id

##### * Dropbox API
  Not exists yet
