class ScenariosController < ApplicationController
  before_filter :login_required, :except => [:index, :show]
  before_filter :assign_feature
  
  def index
    # TODO: will_paginate
    
    if params[:q].present?
      @scenarios = Scenario.body_like(params[:q]).paginate(:page => params[:page] || 1, :per_page => 30)
    else
      @scenarios = Scenario.all.paginate(:page => params[:page] || 1, :per_page => 30)
    end
    
    respond_to do |page|
      page.html
      page.json { render :json => @scenarios }
      page.xml { render :xml => @scenarios }
    end
  end
  
  def new
    @scenario = @feature.scenarios.build
    
    respond_to do |page|
      page.html
      page.json { render :nothing => true, :status => 204 }
      page.xml { render :nothing => true, :status => 204 }
    end
  end
  
  def create
    @scenario = @feature.scenarios.build(params[:scenario])
    if !(@scenario.save)
      respond_to do |page|
        page.html { render :action => 'new'}
        page.json { render :json => @scenario.errors, :status => :unprocessable_entity }
        page.xml { render :xml => @scenario.errors, :status => :unprocessable_entity }
      end
    else
      flash[:notice] = "Scenario successfully created."
      respond_to do |page|
        page.html { redirect_to user_feature_scenario_url(current_user, @feature, @scenario)}
        page.json { render :json => @scenario }
        page.xml { render :xml => @scenario }
      end
    end
  end
  
  def show
    @scenario = @feature.scenarios.find(params[:scenario_id] || params[:id])
    
    respond_to do |page|
      page.html
      page.txt
      page.json { render :json => @scenario.to_json}
      page.xml { render :json => @scenario.to_xml} 
    end
  end
  
  def edit
    @scenario = @feature.scenarios.find(params[:id])
    if @scenario.blank?
      flash[:error] = "Oops! couldn't find the scenario you are looking for."
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
    @scenario = @feature.scenarios.find(params[:id])
    if @scenario.blank? || !(@scenario.update_attributes(params[:scenario]))
      respond_to do |page|
        page.html { render :action => 'edit'}
        page.json { render :json => @scenario.errors, :status => :unprocessable_entity }
        page.xml { render :xml => @scenario.errors, :status => :unprocessable_entity }
      end
    else
      flash[:notice] = "Scenario updated successfully"
      respond_to do |page|
        page.html { redirect_to user_feature_scenario_url(current_user, @feature, @scenario)}
        page.json { render :json => @scenario }
        page.xml { render :xml => @scenario }
      end
    end
  end
  
  protected
  def assign_feature
    if params[:feature_id].present?
      
      if logged_in?
        @feature = current_user.features.find(params[:feature_id])
      else
        @feature = Feature.find(params[:feature_id])
        @user = @feature.user
      end
      if @feature.blank?
        flash[:error] = "Oops! couldn't find the feature you are looking for."
        redirect_to dashboard_url
      end
    end
  end
end
