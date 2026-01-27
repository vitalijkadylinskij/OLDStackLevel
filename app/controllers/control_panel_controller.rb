class ControlPanelController < ApplicationController
  layout 'cp'
  before_action :authenticate_user!
end
