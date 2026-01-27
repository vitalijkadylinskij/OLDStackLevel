class HireTeamController < ApplicationController
    def index
      set_meta_tags(page_meta_tags('STACKLEVEL - Hire Team').tags)
      @case_studies = CaseStudy.locale(I18n.locale).order("RANDOM()").limit(3)
    end
  end
  