# This file is auto-generated from the current state of the database. Instead
# of editing this file, please use the migrations feature of Active Record to
# incrementally modify your database, and then regenerate this schema definition.
#
# Note that this schema.rb definition is the authoritative source for your
# database schema. If you need to create the application database on another
# system, you should be using db:schema:load, not running all the migrations
# from scratch. The latter is a flawed and unsustainable approach (the more migrations
# you'll amass, the slower it'll run and the greater likelihood for issues).
#
# It's strongly recommended that you check this file into your version control system.

ActiveRecord::Schema.define(version: 2026_01_26_105832) do

  # These are extensions that must be enabled in order to support this database
  enable_extension "plpgsql"

  create_table "blog_authors", id: :serial, force: :cascade do |t|
    t.string "name"
    t.integer "post_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["name"], name: "index_blog_authors_on_name"
    t.index ["post_id"], name: "index_blog_authors_on_post_id"
  end

  create_table "blog_authorships", id: :serial, force: :cascade do |t|
    t.integer "post_id"
    t.integer "author_id"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["author_id"], name: "index_blog_authorships_on_author_id"
    t.index ["post_id"], name: "index_blog_authorships_on_post_id"
  end

  create_table "blog_posts", id: :serial, force: :cascade do |t|
    t.string "slug"
    t.string "title"
    t.text "body"
    t.datetime "published_at"
    t.datetime "created_at"
    t.datetime "updated_at"
    t.string "tags", default: [], array: true
    t.text "teaser"
    t.string "preview_image"
    t.integer "time_to_read"
    t.index ["slug"], name: "index_blog_posts_on_slug"
  end

  create_table "business_domains", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "alias_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "business_domains_case_studies", id: false, force: :cascade do |t|
    t.integer "case_study_id"
    t.integer "business_domain_id"
    t.index ["business_domain_id"], name: "index_business_domains_case_studies_on_business_domain_id"
    t.index ["case_study_id"], name: "index_business_domains_case_studies_on_case_study_id"
  end

  create_table "business_domains_hire_developers", id: false, force: :cascade do |t|
    t.integer "hire_developer_id"
    t.integer "business_domain_id"
    t.index ["business_domain_id"], name: "index_business_domains_hire_developers_on_business_domain_id"
    t.index ["hire_developer_id"], name: "index_business_domains_hire_developers_on_hire_developer_id"
  end

  create_table "careers", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "description"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
  end

  create_table "careers_frameworks", id: false, force: :cascade do |t|
    t.integer "career_id"
    t.integer "framework_id"
    t.index ["career_id"], name: "index_careers_frameworks_on_career_id"
    t.index ["framework_id"], name: "index_careers_frameworks_on_framework_id"
  end

  create_table "careers_technologies", id: false, force: :cascade do |t|
    t.integer "career_id"
    t.integer "technology_id"
    t.index ["career_id"], name: "index_careers_technologies_on_career_id"
    t.index ["technology_id"], name: "index_careers_technologies_on_technology_id"
  end

  create_table "case_studies", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.string "path_name"
    t.string "project_bg"
    t.string "project_title"
    t.string "about_title"
    t.string "review_photo"
    t.string "business_case_description"
    t.string "developted_solution_description"
    t.string "first_solution"
    t.string "second_solution"
    t.string "third_solution"
    t.string "business_challenge"
    t.string "proud_of"
    t.string "result"
    t.string "section"
    t.string "technology"
    t.string "duration"
    t.string "team"
    t.string "customer"
    t.string "screenshots", default: [], array: true
    t.integer "position"
  end

  create_table "case_studies_hire_developers", id: false, force: :cascade do |t|
    t.integer "hire_developer_id"
    t.integer "case_study_id"
    t.index ["case_study_id"], name: "index_case_studies_hire_developers_on_case_study_id"
    t.index ["hire_developer_id"], name: "index_case_studies_hire_developers_on_hire_developer_id"
  end

  create_table "case_studies_integrations", id: false, force: :cascade do |t|
    t.integer "case_study_id"
    t.integer "integration_id"
    t.index ["case_study_id"], name: "index_case_studies_integrations_on_case_study_id"
    t.index ["integration_id"], name: "index_case_studies_integrations_on_integration_id"
  end

  create_table "case_studies_technologies", id: false, force: :cascade do |t|
    t.integer "case_study_id"
    t.integer "technology_id"
    t.index ["case_study_id"], name: "index_case_studies_technologies_on_case_study_id"
    t.index ["technology_id"], name: "index_case_studies_technologies_on_technology_id"
  end

  create_table "ckeditor_assets", id: :serial, force: :cascade do |t|
    t.string "data_file_name", null: false
    t.string "data_content_type"
    t.integer "data_file_size"
    t.string "type", limit: 30
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.index ["type"], name: "index_ckeditor_assets_on_type"
  end

  create_table "developments", id: :serial, force: :cascade do |t|
    t.string "title"
    t.string "path_name"
    t.string "description"
    t.string "sub_description"
    t.string "what_is"
    t.string "where_to_use_title"
    t.string "where_to_use_cases"
    t.string "why_reasons"
    t.string "what_can_we_do"
    t.string "locale"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "feedbacks", id: :serial, force: :cascade do |t|
    t.string "author_photo"
    t.string "author_name"
    t.string "feedback_text"
    t.string "job_title"
    t.string "locale"
  end

  create_table "frameworks", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "alias_name"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "frameworks_hire_developers", id: false, force: :cascade do |t|
    t.integer "hire_developer_id"
    t.integer "framework_id"
    t.index ["framework_id"], name: "index_frameworks_hire_developers_on_framework_id"
    t.index ["hire_developer_id"], name: "index_frameworks_hire_developers_on_hire_developer_id"
  end

  create_table "hire_developers", id: :serial, force: :cascade do |t|
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "locale"
    t.string "path_name"
    t.string "developer_title"
    t.string "experience_description"
  end

  create_table "hire_developers_technologies", id: false, force: :cascade do |t|
    t.integer "hire_developer_id"
    t.integer "technology_id"
    t.index ["hire_developer_id"], name: "index_hire_developers_technologies_on_hire_developer_id"
    t.index ["technology_id"], name: "index_hire_developers_technologies_on_technology_id"
  end

  create_table "integrations", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "alias_name"
    t.string "logo"
  end

  create_table "meta_informations", id: :serial, force: :cascade do |t|
    t.string "title", default: ""
    t.text "description", default: ""
    t.string "keywords", default: ""
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "page", default: ""
    t.string "locale"
  end

  create_table "order_requests", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "email"
    t.string "description"
    t.string "budget"
    t.string "position"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
  end

  create_table "technologies", id: :serial, force: :cascade do |t|
    t.string "name"
    t.string "alias_name"
    t.string "logo"
  end

  create_table "users", id: :serial, force: :cascade do |t|
    t.integer "sign_in_count", default: 0, null: false
    t.datetime "current_sign_in_at"
    t.datetime "last_sign_in_at"
    t.inet "current_sign_in_ip"
    t.inet "last_sign_in_ip"
    t.datetime "created_at", null: false
    t.datetime "updated_at", null: false
    t.string "email"
    t.string "name"
    t.index ["email"], name: "index_users_on_email"
  end

end
