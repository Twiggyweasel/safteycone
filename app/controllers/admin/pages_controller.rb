# frozen_string_literal: true

class Admin::PagesController < ApplicationController
  def dashboard
    @companies = Company.all
  end
end
