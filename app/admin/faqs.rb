ActiveAdmin.register Faq do
   index do                            
    column :question                     
    column :answer        
    column :order_id           
    default_actions                   
  end                                 

  filter :question                       

  form do |f|                         
    f.inputs "Faq Details" do       
      f.input :question                  
      f.input :answer                  
      f.input :order_id                  
     end                               
    f.actions                         
  end           
end
