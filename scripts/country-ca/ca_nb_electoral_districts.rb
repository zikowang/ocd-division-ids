#!/usr/bin/env ruby
# coding: utf-8

require File.expand_path(File.join("..", "utils.rb"), __FILE__)

# Scrapes New Brunswick electoral district codes and names from gnb.ca

class NB < Runner
  def names
    # Also available as inconsistently formatted lists.
    # @see http://www2.gnb.ca/content/gnb/fr/contacts/dept_renderer.154.html#structure
    ShapefileParser.new(
      "https://www.electionsnb.ca/content/dam/enb/pdf/2016PEDMaps-CEPCartes/Provincial_Electoral_Districts_2018.zip",
      "province:nb/ed:", {
        :id => "DIST_ID",
        :name => "PED_Name_E",
        :name_fr => "PED_Name_F",
      }
    ).run
  end
end

NB.new("province-nb-electoral_districts.csv").run(ARGV)
