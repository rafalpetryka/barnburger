# encoding: UTF-8
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

ActiveRecord::Schema.define(version: 20_160_608_195_219) do
  # These are extensions that must be enabled in order to support this database
  enable_extension 'plpgsql'

  create_table 'admins', force: :cascade do |t|
    t.string   'email',                  default: '', null: false
    t.string   'encrypted_password',     default: '', null: false
    t.string   'reset_password_token'
    t.datetime 'reset_password_sent_at'
    t.datetime 'remember_created_at'
    t.integer  'sign_in_count', default: 0, null: false
    t.datetime 'current_sign_in_at'
    t.datetime 'last_sign_in_at'
    t.inet     'current_sign_in_ip'
    t.inet     'last_sign_in_ip'
    t.datetime 'created_at'
    t.datetime 'updated_at'
  end

  add_index 'admins', ['email'], name: 'index_admins_on_email', unique: true, using: :btree
  add_index 'admins', ['reset_password_token'], name: 'index_admins_on_reset_password_token', unique: true, using: :btree

  create_table 'burgers', force: :cascade do |t|
    t.string   'name'
    t.text     'composition'
    t.integer  'price'
    t.integer  'how_many_mark'
    t.float    'average'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
    t.boolean  'limited'
  end

  create_table 'english_burgers', force: :cascade do |t|
    t.string   'name'
    t.text     'composition'
    t.integer  'price'
    t.integer  'how_many_mark'
    t.float    'average'
    t.boolean  'limited'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
  end

  create_table 'english_limited_burgers', force: :cascade do |t|
    t.datetime 'date'
    t.date     'date_on_website'
    t.string   'name1'
    t.string   'name2'
    t.string   'composition1'
    t.string   'composition2'
    t.integer  'price1'
    t.integer  'price2'
    t.integer  'how_many_mark1'
    t.integer  'how_many_mark2'
    t.float    'average1'
    t.float    'average2'
    t.datetime 'created_at',      null: false
    t.datetime 'updated_at',      null: false
  end

  create_table 'english_news', force: :cascade do |t|
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.text     'text'
    t.datetime 'date'
    t.string   'link'
    t.string   'name_of_link'
    t.text     'text_with_link'
  end

  create_table 'home_descriptions', force: :cascade do |t|
    t.string   'polish_title'
    t.string   'english_title'
    t.text     'polish_text'
    t.text     'english_text'
    t.datetime 'created_at',    null: false
    t.datetime 'updated_at',    null: false
  end

  create_table 'limited_burgers', force: :cascade do |t|
    t.datetime 'date'
    t.date     'date_on_website'
    t.string   'name1'
    t.string   'name2'
    t.text     'composition1'
    t.text     'composition2'
    t.datetime 'created_at',      null: false
    t.datetime 'updated_at',      null: false
    t.integer  'price1'
    t.integer  'price2'
    t.integer  'how_many_mark1'
    t.float    'average1'
    t.integer  'how_many_mark2'
    t.float    'average2'
  end

  create_table 'news', force: :cascade do |t|
    t.datetime 'created_at',     null: false
    t.datetime 'updated_at',     null: false
    t.text     'text'
    t.datetime 'date'
    t.string   'link'
    t.string   'name_of_link'
    t.text     'text_with_link'
  end

  create_table 'opening_hours', force: :cascade do |t|
    t.string   'place'
    t.string   'monday',                  array: true
    t.string   'tuesday',                 array: true
    t.string   'wednesday',               array: true
    t.string   'thursday',                array: true
    t.string   'friday',                  array: true
    t.string   'saturday',                array: true
    t.string   'sunday',                  array: true
    t.datetime 'created_at', null: false
    t.datetime 'updated_at', null: false
  end
end
