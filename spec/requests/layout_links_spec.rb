# Integration Tests or Request Tests (common name also) allows us to hit pages in multiple controllers

require 'spec_helper'

describe "LayoutLinks" do
  
  # test pages exist?
  it "should have a Home page at '/'" do 
    get '/'
    response.should have_selector('title', :content => "Home")
  end
  
  it "should have a Contact page at '/contact'" do
     get '/contact' 
     response.should have_selector('title', :content => "Contact")
  end
  
  it "should have an About page at '/about'" do 
    get '/about' 
    response.should have_selector('title', :content => "About")
  end
  
  it "should have a Help page at '/help'" do 
    get '/help' 
    response.should have_selector('title', :content => "Help")
  end
  
  it "should have a signup page at '/signup'" do
    get '/signup'
    response.should have_selector('title', :content => "Sign up")
  end
  
  # test links work at /
  it "should have the right links on the layout" do
  visit root_path 
  
  click_link "About" 
  response.should have_selector('title', :content => "About") 
  
  click_link "Help" 
  response.should have_selector('title', :content => "Help") 
  
  click_link "Contact" 
  response.should have_selector('title', :content => "Contact") 
  
  click_link "Home" 
  response.should have_selector('title', :content => "Home") 
  
  click_link "Sign up now!" 
  response.should have_selector('title', :content => "Sign up") 
  end
  
end
