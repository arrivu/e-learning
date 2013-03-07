 class Topic < ActiveRecord::Base
 attr_accessible :desc , :name
end
ActiveAdmin.register Topic do
 
  index do                            
    column :name                     
    default_actions                   
  end                                 

  filter :name                       

  form do |f|                         
    f.inputs "Topic Details" do       
      f.input :name                  
     end                               
    f.actions                         
  end            
end
