class BrowserController < ApplicationController
  
  
  
  def index
    @dirs=[]
    @files=[]
    @link=[]
   
    
    main_path=Dir.home("max")
    @active_path = params[:dir] || Dir.home("max") 
    @wanted_path=@active_path+"/*"
      
    @link_array=@wanted_path.chop.split("/")
    
    unless (params[:link].blank?)
      link=params[:link].to_i
      @new_array=@link_array.slice(0,link+1) #adding one in order to open the wanted directory not the one were it's placed
      @wanted_path=@new_array.join("/")+"/*"
    end
    
    Dir.glob(@wanted_path).each do |content|
      name = {:url => File.path(content), :name=>File.basename(content)}  
      if File.directory?(content)
        @dirs << name
      else
        @files <<name
      end
    end
    unless (params[:file].blank?)
     @file=params[:file]
     
    end
    
  end
  
end
