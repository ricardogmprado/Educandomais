class School < ApplicationRecord
  # has_many :teachers
  # has_many :projects, through: :teacher
  validates :address, presence: true
  validates :name, presence: true
  validates :city, presence: true
  validates :state, presence: true
end

require 'nokogiri'
require 'open-uri'
require 'byebug'

def scraper
  url = 'http://www.educacao.sp.gov.br/central-de-atendimento/consulta.asp?'
  unparsed_page = open(url).read
  parsed_page = Nokogiri::HTML(unparsed_page)
  byebug
end

scraper
