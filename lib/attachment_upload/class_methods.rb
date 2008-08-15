module AttachmentUpload::ClassMethods
  attr_accessor :att_names
  # List the different named attacments
  # add the attr_accessor for each one
  # add the named association through the has_many :attachments
  def attachment_names(*names)
    # @@att_names = names

    names.each do |name|
      # define the attribute accessors
      class_eval("attr_accessor :uploaded_data_#{name}, :remove_#{name}")
      
      # conveinece methods
      class_eval <<-EOS
      def #{name}
        attachments.#{name}
      end
      EOS
    end
    
    has_many :attachments, :as => :attachee, :dependent => :destroy do
      names.each do |name|        
        class_eval <<-EOS
        def #{name}(reload=false)
          @#{name} = nil if reload
          @#{name} ||= find(:first, :conditions => ["attachment_type = ?",'#{name}'])
        end
        EOS
      end
    end
    self.att_names=names
  end
  
end
