In your edit view
<% form_for([:admin,@article], :html => {:multipart => true}) do |f| %>
<p>
	<b>Publication Logo</b><br />
	<%= f.file_field :uploaded_data_img_publication %>
</p>


<% if !@article.attachments.img_publication.nil? %>
<%= image_tag @article.attachments.img_publication.public_filename(:thumb)  %>

<p>
	<%= label :article, :remove_img_publication, "Remove Publication Logo", :class => "left" %>
	<%= f.check_box :remove_img_publication %>
</p>

<% end %>


COntroller
# POST /articles
# POST /articles.xml
def create
  @article = Article.new(params[:article])

  respond_to do |format|
    if @article.save_with_attachments
      flash[:notice] = 'Article was successfully created.'
      format.html { redirect_to([:admin,@article]) }
      format.xml  { render :xml => @article, :status => :created, :location => @article }
    else
      format.html { render :action => "new" }
      format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
    end
  end
end

# PUT /articles/1
# PUT /articles/1.xml
def update
  @article = Article.find(params[:id])

  respond_to do |format|
    if @article.update_with_attachments(params[:article])
      flash[:notice] = 'Article was successfully updated.'
      format.html { redirect_to([:admin,@article]) }
      format.xml  { head :ok }
    else
      format.html { render :action => "edit" }
      format.xml  { render :xml => @article.errors, :status => :unprocessable_entity }
    end
  end
end