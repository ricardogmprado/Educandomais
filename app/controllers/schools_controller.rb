class SchoolsController < ApplicationController
  # GET /schools
  # GET /schools.json
  def index
  url = 'http://www.educacao.sp.gov.br/central-de-atendimento/consulta.asp?'
  unparsed_page = open(url).read
  parsed_page = Nokogiri::HTML(unparsed_page)

  end

