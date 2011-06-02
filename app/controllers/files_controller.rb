class FilesController < ApplicationController
  def show
    respond_to do |wants|
      wants.html do
        render :string => "hel"
      end
      wants.js
    end
  end
end
