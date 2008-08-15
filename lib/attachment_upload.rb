module AttachmentUpload

  # Add the attachment_names to the including model
  def self.included(base)        #:nodoc:
    base.extend AttachmentUpload::ClassMethods
  end

  # for create
  def save_with_attachments
    begin 
      self.class.att_names.each { |attachment| do_attachment(attachment) }
      save!
    rescue => e
      logger.error(e)
      self.errors.add_to_base(e)
    end 
  end

  # for update
  def update_with_attachments(params) 
    begin
      self.transaction do
        update_attributes(params)
        self.class.att_names.each { |attachment| do_attachment(attachment) }
        save!
      end 
    rescue => e
      logger.error(e)
      add_errors(e)
    end 
  end

  # popuplates the Attachment.new
  def do_attachment(attachment_name)
    @attachment = Attachment.new
     # Remove the attachemnt if the checkbox is checked and there is a attachment
     eval("self.attachments.#{attachment_name}.destroy") if eval("remove_#{attachment_name} == '1' && self.attachments.#{attachment_name}") 
     
    if eval("uploaded_data_#{attachment_name} && uploaded_data_#{attachment_name}.size > 0")   
      eval("self.attachments.#{attachment_name}.destroy if self.attachments.#{attachment_name}")
      @attachment.uploaded_data = eval("uploaded_data_#{attachment_name}")
      @attachment.attachment_type = attachment_name.to_s
      @attachment.thumbnails.clear 
      @attachment.save! 
      self.attachments << @attachment
    end
    @attachment
  end  

  
  def validate
    e = 0
    self.class.att_names.all?{ |an| 
                                  if eval("!uploaded_data_#{an}.blank?")
                                    a = Attachment.new(:uploaded_data => eval("uploaded_data_#{an}") )
                                    if !a.valid? 
                                      logger.error(a.content_type)
                                      e = 1
                                    end
                                  end
                              }
    errors.add_to_base("Error with Attachment, please check the content type and size. ") if e == 1
  end
  
  # Assigns Attachment errors to base
  def add_errors(error)
    errors.add_to_base("Error with Attachment, please check the content type and size.")
    false
  end
end