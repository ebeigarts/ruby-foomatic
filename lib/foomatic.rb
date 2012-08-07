require "pathname"
require "nokogiri"
require "foomatic/version"

module Foomatic
  class DB
    def self.open(path = "/usr/share/foomatic/db")
      new(path)
    end

    attr_accessor :path

    def initialize(path)
      @path = Pathname.new(path)
    end

    def printers
      path.join("source", "printer").each_child.map do |f|
        xml = Nokogiri::XML.parse(f)
        Printer.new.tap do |printer|
          printer.id    = xml.root.attribute("id").to_s
          printer.make  = xml.root.xpath("make").text
          printer.model = xml.root.xpath("model").text
          printer.url   = xml.root.xpath("url").text
          Printer::MECHANISM_TYPES.each do |type|
            printer.send("#{type}=", xml.root.xpath("mechanism/#{type}").any?)
          end
        end
      end
    end
  end

  class Printer
    attr_accessor :id, :make, :model, :url
    MECHANISM_TYPES = [:laser, :led, :inkjet, :dotmatrix, :impact, :sublimation, :transfer, :thermal, :color]
    attr_accessor(*MECHANISM_TYPES)
    MECHANISM_TYPES.each { |type| alias_method(:"#{type}?", type) }
  end
end
