class ScenariosController < ApplicationController
  before_filter :login_required
  before_filter :assign_feature, :only => [:show, :destroy, :edit, :new]
  
  def index
    # TODO: will_paginate
    @scenarios = Scenario.all
    
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
      flash[:notice] = "Scenario created successfully"
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
  
  protected
  def assign_feature
    if params[:feature_id].present?
      @feature = current_user.features.find(params[:feature_id])
      if @feature.blank?
        flash[:error] = "Oops! couldn't find the feature you are looking for."
        redirect_to dashboard_url
      end
    end
  end
end
