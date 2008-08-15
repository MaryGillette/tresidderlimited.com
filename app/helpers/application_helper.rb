# Methods added to this helper will be available to all templates in the application.
module ApplicationHelper
  # Meta tag stuff
  def page_title 
    title = @page_title ? "| #{@page_title}" : '' 
    %(<title>#{SITE_NAME} #{title}</title>) 
  end 

  def meta(name, content) 
    %(<meta name="#{name}" content="#{content}" />) 
  end

  def meta_description
    @meta_description || SITE_NAME 
  end

  def meta_keywords 
    SITE_NAME
  end

  def state_options
    [
      ['Select a State', ''],
      ['Alabama', 'AL'], 
      ['Alaska', 'AK'],
      ['Arizona', 'AZ'],
      ['Arkansas', 'AR'], 
      ['California', 'CA'], 
      ['Colorado', 'CO'], 
      ['Connecticut', 'CT'], 
      ['Delaware', 'DE'], 
      ['District Of Columbia', 'DC'], 
      ['Florida', 'FL'],
      ['Georgia', 'GA'],
      ['Hawaii', 'HI'], 
      ['Idaho', 'ID'], 
      ['Illinois', 'IL'], 
      ['Indiana', 'IN'], 
      ['Iowa', 'IA'], 
      ['Kansas', 'KS'], 
      ['Kentucky', 'KY'], 
      ['Louisiana', 'LA'], 
      ['Maine', 'ME'], 
      ['Maryland', 'MD'], 
      ['Massachusetts', 'MA'], 
      ['Michigan', 'MI'], 
      ['Minnesota', 'MN'],
      ['Mississippi', 'MS'], 
      ['Missouri', 'MO'], 
      ['Montana', 'MT'], 
      ['Nebraska', 'NE'], 
      ['Nevada', 'NV'], 
      ['New Hampshire', 'NH'], 
      ['New Jersey', 'NJ'], 
      ['New Mexico', 'NM'], 
      ['New York', 'NY'], 
      ['North Carolina', 'NC'], 
      ['North Dakota', 'ND'], 
      ['Ohio', 'OH'], 
      ['Oklahoma', 'OK'], 
      ['Oregon', 'OR'], 
      ['Pennsylvania', 'PA'], 
      ['Rhode Island', 'RI'], 
      ['South Carolina', 'SC'], 
      ['South Dakota', 'SD'], 
      ['Tennessee', 'TN'], 
      ['Texas', 'TX'], 
      ['Utah', 'UT'], 
      ['Vermont', 'VT'], 
      ['Virginia', 'VA'], 
      ['Washington', 'WA'], 
      ['West Virginia', 'WV'], 
      ['Wisconsin', 'WI'], 
      ['Wyoming', 'WY']
    ]
  end

  # combine :notice and :message
  def flash_block
     "<p id=\"flash\">#{flash[:notice]}#{flash[:message]}</p>" if !flash[:message].blank? || !flash[:notice].blank?
  end
  
  # allow defautl value
  def content_heading
    @content_heading || "Dinshaw Design & Development"
  end

  # allow defautl value  
  def content_sub_heading
    @content_heading
  end

  # liks for listed resources in admin area
  def position_links(object, admin = true)
    object_with_admin = admin == true ? "admin_#{object.class.to_s.tableize.singularize}" : object.class
    [
      link_to('Up', eval("up_#{object_with_admin}_path(object)"), :method => :put),
      link_to('Down', eval("down_#{object_with_admin}_path(object)"), :method => :put)
    ].join(" | ") 
  end

  # for CMS - not yet implemented
  def page_text
    (Page.find_by_title(@controller.action_name.titleize) || Page.find_by_title(@controller.controller_name.titleize)).body rescue nil
  end
  
end
