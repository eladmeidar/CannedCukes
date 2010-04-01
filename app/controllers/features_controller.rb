class FeaturesController < ApplicationController

	before_filter :login_required, :assign_user
	
  def index
    @features = current_user.features
    
    respond_to do |page|
      page.html 
      page.json { render :json => @features }
      page.xml { render :xml => @features }
    end
  end

  def new
    @feature = current_user.features.build
    
    respond_to do |page|
      page.html
      page.json { render :nothing => true, :status => 204 }
      page.xml { render :nothing => true, :status => 204 }
    end
  end

  def show
    @feature = current_user.features.find(params[:feature_id] || params[:id])
  end
  
  def create
    @feature = current_user.features.build(params[:feature])
    if !(@feature.save)
      respond_to do |page|
        page.html { render :action => 'new'}
        page.json { render :json => @feature.errors, :status => :unprocessable_entity }
        page.xml { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    else
      flash[:notice] = "Feature created successfully"
      respond_to do |page|
        page.html { redirect_to user_feature_url(current_user, @feature)}
        page.json { render :json => @feature }
        page.xml { render :xml => @feauture }
      end
    end
  end

  def edit
    @feature = current_user.features.find(params[:id])
    if @feature.blank?
      flash[:error] = "Oops! couldn't find the feature you are looking for."
      redirect_to user_features_url(current_user)
    else
      respond_to do |page|
        page.html
        page.json { render :nothing => true, :status => 204 }
        page.xml { render :nothing => true, :status => 204 }
      end
    end
  end

  def update
    @feature = current_user.features.find(params[:id])
    if @feature.blank? || !(@feature.update_attributes(params[:feature]))
      respond_to do |page|
        page.html { render :action => 'edit'}
        page.json { render :json => @feature.errors, :status => :unprocessable_entity }
        page.xml { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    else
      flash[:notice] = "Feature updated successfully"
      respond_to do |page|
        page.html { redirect_to user_feature_url(current_user, @feature)}
        page.json { render :json => @feature }
        page.xml { render :xml => @feauture }
      end
    end
  end

  def destroy
    @feature = current_user.features.find(params[:id])
    
    if @feature.blank?
      flash[:error] = "Oops! couldn't find the feature you are looking for."
      respond_to do |page|
        page.html { redirect_to user_features_url(current_user) }
        page.json { render :json => @feature.errors, :status => :unprocessable_entity }
        page.xml { render :xml => @feature.errors, :status => :unprocessable_entity }
      end
    else
      @feature.destroy
      flash[:notice] = "Feature deleted successfully."
      respond_to do |page|
        page.html { redirect_to user_features_url(current_user)}
        page.json { render :nothing => true, :status => 200 }
        page.xml { render :nothing => true, :status => 200 }
      end
    end
  end

  protected
  
  def assign_user
    @user = current_user
  end
end
