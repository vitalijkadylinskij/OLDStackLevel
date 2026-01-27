class ServicesController < ApplicationController
  def index
    set_meta_tags(page_meta_tags('STACKLEVEL - Services').tags)
  end

  def ruby_on_rails
    set_meta_tags(page_meta_tags('ruby_on_rails').tags)

    render 'ruby_on_rails'
  end

  def nodejs
    set_meta_tags(page_meta_tags('nodejs').tags)

    render 'nodejs'
  end

  def reactjs
    set_meta_tags(page_meta_tags('reactjs').tags)

    render 'reactjs'
  end

  def php
    render 'php'
  end

  def fixed_price
    set_meta_tags(page_meta_tags('fixed_price').tags)

    render 'fixed_price'
  end

  def time_and_material
    set_meta_tags(page_meta_tags('time_and_material').tags)

    render 'time_and_material'
  end

  def dedicated_team
    set_meta_tags(page_meta_tags('dedicated_team').tags)

    render 'dedicated_team'
  end
end
